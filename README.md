# Stellar Body Analysis using Lane-Emden and Variational Methods

This is a write-up (or pedagogical review, if you want to sound fancier) on the Lane-Emden equation, one of those rare cases in astrophysics where you get a clean, analytical description of something as complicated as a star. The goal was to understand it more deeply than just "here is the equation, here are solutions", and to approach it from two different directions to see if they agree (they do, thankfully).

## What's in here

The write-up covers three main things:

1. **Deriving the Lane-Emden from first principles**: starting from hydrostatic equilibrium and a polytropic equation of state, the usual route.

2. **Deriving it again using a variational/energy argument**: this is the more interesting part, in my opinion. Instead of balancing forces, you minimise the total energy of the system using a Lagrangian field theory framework. The reason this is nicer is that it actually *guarantees* the system is at a stable minimum, rather than just some equilibrium that could be a saddle point.

3. **Numerical and analytical solutions, compared against real solar data**: analytical solutions exist for $n = 0, 1, 5$, and a series solution for $n = 2$. For everything else, Python does the heavy lifting. These are then compared against the Model S solar data to see how well (or not) a single polytrope can describe the Sun. Spoiler: it does reasonably well for the density profile, less well for the radius and mass (~33% and ~37% error respectively). The reason is fairly intuitive once you think about it.

## Files

**The write-up**
- `StellarBody.typ`: the main source file, written in Typst
- `StellarBody.pdf`: compiled PDF, if you just want to read it without installing Typst
- `references.bib`: bibliography
- `verma.typ` and `theorems.typ`: document template and theorem environment files, needed to compile

**Python**
- `lane_emden solver.py`: numerically solves the Lane-Emden ODE for various polytropic indices using `scipy`'s `solve_ivp` (RK45). Outputs the surface values and plots the polytrope curves.
- `model_sc.py`: compares the $n = 3$ polytrope density profile against the Model S solar data. Computes the RMS and maximum errors.
- `model_s.txt`: the raw Model S solar data (sourced from the Christensen-Dalsgaard online repository), used by `model_sc.py`

**Plots**
- `Lane-Emden_Polytropes.png`: the polytrope curves for $n = 0, 1, 1.5, 2, 3, 5$
- `ModS_Pol.png`: the density profile comparison between Model S and the $n = 3$ polytrope
- `image-19.png`: diagram of the thin shell used in the hydrostatic equilibrium derivation

## How to compile

If you have Typst installed:

```
typst compile StellarBody.typ
```

Or just open `StellarBody.pdf` directly. For the Python scripts, you will need `numpy`, `scipy`, and `matplotlib`:

```
pip install numpy scipy matplotlib
```

Then just run either script directly: `lane_emden solver.py` first if you want to reproduce the polytrope plot, `model_sc.py` for the Model S comparison.

## Why I made this

Honestly, this started as a way to understand stellar modelling without jumping straight into the deep end. The Lane-Emden felt like the right entry point, it is simple enough to be tractable, but rich enough that you can spend a lot of time with it and still find something new. It has also made me considerably more interested in the subject, so that is a good sign.

This is a draft, and there will be revisions. Feedback is welcome.

---

*Arush Datta, IISER Bhopal*
