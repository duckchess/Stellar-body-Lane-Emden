import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cm as cm
from scipy.integrate import solve_ivp
from scipy.interpolate import interp1d


# ─────────────────────────── Model S Data ───────────────────────────

data = np.loadtxt("model_s.txt", comments="#")

r_over_R = data[:, 0]
rho_cgs  = data[:, 2]

# Convert to SI
R_sun = 6.957e8                  # m
rho_SI = rho_cgs * 1000          # g cm^-3 → kg m^-3
r_SI = r_over_R * R_sun

# Reverse so arrays run centre → surface
r_SI = r_SI[::-1]
rho_SI = rho_SI[::-1]

# ───────────────────────── Lane–Emden Solver ────────────────────────

def lane_emden(xi, J, n):
    theta, dtheta = J

    if theta <= 0:
        return [dtheta, 0]

    return [
        dtheta,
        -(theta**n) - (2/xi)*dtheta
    ]


def surface_event(xi, J, n):
    theta, _ = J
    return theta


surface_event.terminal = True
surface_event.direction = -1


def solve_polytrope(n):

    xi0 = 1e-8
    xif = 80

    theta0 = 1 - xi0**2/6
    dtheta0 = -xi0/3

    sol = solve_ivp(
        lane_emden,
        [xi0, xif],
        [theta0, dtheta0],
        args=(n,),
        events=surface_event,
        dense_output=True,
        max_step=0.01
    )

    return sol


# ───────────────────────── n = 3 Polytrope ─────────────────────────

rho_c = 1.622e5      # kg m^-3
alpha = 6.707e7      # m
# Solve n = 3 polytrope
sol = solve_polytrope(3)

xi_1 = sol.t_events[0][0]

print(f"\nξ₁ = {xi_1:.6f}")

# Including the centre point explicitly
xi_body = np.linspace(1e-6, xi_1, 2500)

theta_body = sol.sol(xi_body)[0]

xi = np.concatenate(([0.0], xi_body))
theta = np.concatenate(([1.0], theta_body))

# Physical radius and density
r_poly = alpha * xi
rho_poly = rho_c * theta**3

# ───────────────────────── Normalisation ───────────────────────────

r_model_norm = r_SI / R_sun
r_poly_norm = r_poly / R_sun

rho_model_norm = rho_SI / rho_SI[0]
rho_poly_norm = rho_poly / rho_c



# ─────────────────────── Quantitative Comparison ───────────────────

interp_poly = interp1d(
    r_poly_norm,
    rho_poly_norm,
    bounds_error=False,
    fill_value=0.0
)

rho_poly_interp = interp_poly(r_model_norm)

difference = rho_model_norm - rho_poly_interp

print("Model S centre density:", rho_model_norm[0])
print("Polytrope centre density:", rho_poly_interp[0])

print("Model S first radius:", r_model_norm[0])
print("Model S last radius:", r_model_norm[-1])

# Only compare where the polytrope actually exists
mask = r_model_norm <= r_poly_norm[-1]

rms_error = np.sqrt(
    np.mean(difference[mask]**2)
)

max_error = np.max(
    np.abs(difference[mask])
)

idx = np.argmax(
    np.abs(difference[mask])
)

print(f"RMS Error = {rms_error:.4f}")
print(f"Max Error = {max_error:.4f}")
print(f"Max discrepancy at r/R☉ = {r_model_norm[mask][idx]:.4f}")

# ───────────────────────── Hu Tao Colours ──────────────────────────

hutao_colors = {
    "model": cm.YlOrRd(0.55),
    "poly":  cm.YlOrRd(0.95)
}

# ───────────────────────────── Plot ────────────────────────────────

fig, ax = plt.subplots(figsize=(10, 7))

# Density profiles
ax.plot(
    r_model_norm,
    rho_model_norm,
    linewidth=3.2,
    color=hutao_colors["model"],
    label="Model S"
)

ax.plot(
    r_poly_norm,
    rho_poly_norm,
    linewidth=3.2,
    color=hutao_colors["poly"],
    label=r"$n=3$ Polytrope"
)


# ───────────────────────── Appearance ──────────────────────────────

fig.patch.set_facecolor("white")
ax.set_facecolor("white")

ax.set_xlabel(r"$r/R_\odot$", fontsize=15)
ax.set_ylabel(r"$\rho/\rho_c$", fontsize=15)

ax.set_title(
    r"Comparison of Model S and $n=3$ Polytropic Density Profiles",
    fontsize=18,
    pad=15
)

ax.grid(alpha=0.75, linestyle=":")

# RMS error annotation only
ax.text(
    0.60,
    0.96,
    f"RMS Error = {rms_error:.4f}",
    transform=ax.transAxes,
    fontsize=11
)

ax.text(
    0.60,
    0.92,
    f"Max Error = {max_error:.4f}",
    transform=ax.transAxes,
    fontsize=11
)

ax.legend(
    fontsize=11,
    frameon=True
)

ax.set_xlim(0, 1)
ax.set_ylim(bottom=0)

# Clean publication-style axes
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

ax.spines["left"].set_linewidth(1.2)
ax.spines["bottom"].set_linewidth(1.2)

plt.tight_layout()
plt.show()
