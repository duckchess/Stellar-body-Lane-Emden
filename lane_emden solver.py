import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp
 
 #────────────────────────────────────Function Definitions──────────────────────────────────────────
 
def lane_emden(xi, J, n):
    """
    First-order form of the Lane-Emden equation obtained via the substitutions:
        u1 = θ,   u2 = dθ/dξ
 
    The original second-order equation
        θ'' + (2/ξ)θ' + θⁿ = 0
    becomes the coupled first-order system
        u1' = u2
        u2' = -u1ⁿ - (2/ξ)u2
    which is what solve_ivp actually integrates.
 
    Note
    ----
    For non-integer n, θ < 0 produces complex values when computing θⁿ.
    Since the integration terminates at θ = 0 (the stellar surface),
    we clamp the derivative to zero once θ goes negative to avoid
    numerical issues just past the surface event.
    """
    u1, u2 = J
    if u1 <= 0:
        return [u2, 0]
    return [u2, -(u1**n) - 2*u2/xi]
 

 
def surface_at(xi, J, n):
    # theta = 0 marks the stellar surface — integration stops here.
    # direction = -1 ensures we only catch the crossing on the way down,
    # not the trivial theta = 0 case at the start for some n.
    u1, u2 = J
    return u1
 
surface_at.terminal  = True
surface_at.direction = -1
 
 

def solve(n):
    # Cannot start at ξ = 0 exactly — the 2/ξ term blows up there.
    # Instead we start at a small ξ and use the Taylor expansion
    #   theta(ξ) ≈ 1 - ξ²/6 + ...
    # to get an accurate initial conditions while avoiding the singularity. 
    xi_i = 1e-8
    xi_f = 80       # generous upper limit; surface event stops us early anyway
 
    u1_0 = 1 - xi_i**2 / 6
    u2_0 = -xi_i / 3
 
    sol = solve_ivp(
        lane_emden,
        [xi_i, xi_f],
        [u1_0, u2_0],
        events       = surface_at,
        args         = (n,),
        dense_output = True,  
        max_step     = 0.01    # small enough that the curves come out smooth
    )
    return sol



#────────────────────────────────────Polytrope Plotting──────────────────────────────────────────
 
import matplotlib.cm as cm
 
n_values = [0, 1, 1.5, 2, 3, 5]
 
# Each n gets a colour sampled from the YlOrRd colormap.
# Kept it in a dictionary means the plotting loop stays clean
# We start at 0.35 rather than 0 to avoid the very pale end of the map, which contrasts weirdly with the white. 
hutao_colors = {
    n: cm.YlOrRd(val)
    for n, val in zip(n_values, np.linspace(0.35, 0.95, len(n_values)))
}
 
fig, ax = plt.subplots(figsize=(9, 6))
 
for n in n_values:
    sol = solve(n)
 
    if len(sol.t_events[0]) > 0:
        # Surface found — plot only up to ξ₁
        xi_1 = sol.t_events[0][0]
        xi    = np.linspace(sol.t[0], xi_1, 2500)
        theta = sol.sol(xi)[0]
 
        label = fr"$n={n},\ \xi_1={xi_1:.4f}$"
 
        ax.plot(xi, theta,
                linewidth=2.5,
                color=hutao_colors[n],
                label=label)
 
        # Dot at the surface to make ξ₁ easy to read off the plot
        ax.scatter(xi_1, 0,
                   s=40,
                   color=hutao_colors[n],
                   zorder=5)
 
    else:
        # n = 5 has no finite surface — plot up to wherever the solver stopped
        xi_max = sol.t[-1]
        xi     = np.linspace(sol.t[0], xi_max, 2500)
        theta  = sol.sol(xi)[0]
 
        label = fr"$n={n},\ \xi_1=\infty$"
 
        ax.plot(xi, theta,
                linewidth=2.5,
                color=hutao_colors[n],
                label=label)
 
    print(n, sol.t_events[0])
 
 
# ────────────────────────────────────Appearance ──────────────────────────────────────────
 
fig.patch.set_facecolor("white")
ax.set_facecolor("white")
 
# Reference line at ξ = 0 (the stellar surface level)
ax.axhline(0, color="#555555", linewidth=0.8, linestyle="--")
 
ax.set_xlabel(r'$\xi$', fontsize=14)
ax.set_ylabel(r'$\theta(\xi)$', fontsize=14)
ax.set_title("Lane-Emden Polytropes", fontsize=16, pad=12)
 
ax.legend(fontsize=11, frameon=False)
ax.grid(alpha=0.25, linestyle=":")
 
ax.set_xlim(0, 10)
ax.set_ylim(-0.5, 1.1)
 
# Drop the top and right spines
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['left'].set_linewidth(1.1)
ax.spines['bottom'].set_linewidth(1.1)
 
plt.tight_layout()
plt.show()