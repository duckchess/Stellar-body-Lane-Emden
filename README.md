# Stellar Body Analysis using Lane-Emden and Variational Methods

This is a write-up (or pedagogical review, if you want to sound fancier) on the Lane-Emden equation, one of those rare cases in astrophysics where you get a clean, analytical description of something as complicated as a star. The goal was to understand it more deeply than just "here is the equation, here are solutions", and to approach it from two different directions to see if they agree (they do, thankfully).

## What's in here

The write-up covers three main things:

1. **Deriving the Lane-Emden from first principles** — starting from hydrostatic equilibrium and a polytropic equation of state, the usual route.

2. **Deriving it again using a variational/energy argument** — this is the more interesting part, in my opinion. Instead of balancing forces, you minimise the total energy of the system using a Lagrangian field theory framework. The reason this is nicer is that it actually *guarantees* the system is at a stable minimum, rather than just some equilibrium that could be a saddle point.

3. **Numerical and analytical solutions, compared against real solar data** — analytical solutions exist for $n = 0, 1, 5$, and a series solution for $n = 2$. For everything else, Python does the heavy lifting. These are then compared against the Model S solar data to see how well (or not) a single polytrope can describe the Sun. Spoiler: it does reasonably well for the density profile, less well for the radius and mass (~33% and ~37% error respectively). The reason is fairly intuitive once you think about it.

## Files

- `StellarBody.typ` — the main write-up, written in Typst
- `references.bib` — bibliography

The Python code for the numerical solver and the density profile comparison will be added shortly.

## How to compile

If you have Typst installed:

```
typst compile StellarBody.typ
```

That should give you the PDF. You will also need `verma.typ` and `theorems.typ` for the document template — these are from the [evan.typ](https://github.com/Jollywatt/typst-fletcher) style package and modified by my friend Arush Verma. 

## Why I made this

Honestly, this started as a way to understand stellar modelling without jumping straight into the deep end. The Lane-Emden felt like the right entry point, it is simple enough to be tractable, but rich enough that you can spend a lot of time with it and still find something new. It has also made me considerably more interested in the subject, so that is a good sign.

This is a draft, and there will be revisions. Feedback is welcome.

---

*Arush Datta, IISER Bhopal*
