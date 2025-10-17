# 1D Advection–Dispersion Modeling (Analytical vs. Numerical)

This project presents **analytical** and **finite-difference (FTCS)** numerical solutions to the **one-dimensional Advection–Dispersion Equation (ADE)** for solute transport.  
Developed as part of my MSc coursework *“Numerical Modelling in Water and Sediment Transport”* at **IWFM, BUET**.

---

## 🧠 Overview

The Advection–Dispersion Equation (ADE) describes solute movement under the combined effects of **advection** and **dispersion**:

\[
\frac{\partial C}{\partial t} + u\frac{\partial C}{\partial x} = D\frac{\partial^2 C}{\partial x^2}
\]

Two approaches are implemented:
1. **Analytical solution** for a pulse input.  
2. **Numerical solution** using the **Forward-Time Central-Space (FTCS)** scheme.

The numerical model is validated against the analytical profile to assess **stability**, **dispersion effects**, and **temporal evolution**.

---

## ⚙️ Parameters

| Symbol | Description | Default |
|:--|:--|:--|
| L | Domain length (m) | 2.0 |
| D | Dispersion coefficient (m²/s) | 0.01 |
| u | Advection velocity (m/s) | 0.1 |
| nx | Grid points | 200 |
| dt | Time step (s) | 0.001 |

---

## 📊 Results

- FTCS scheme reproduces analytical profiles accurately under stability limits (α ≤ 0.5).  
- Dispersion broadens solute spread; advection controls transport speed.  
- Demonstrates core numerical concepts used in larger-scale CFD and LES modeling.

![ADE Simulation](assets/ade_plot_example.png)

---

## 📁 Files

| File | Description |
|------|--------------|
| `ADE_analytical.m` | Analytical solution for pulse input |
| `ADE_numerical_FTCS.m` | Finite-difference solution using FTCS |
| `assets/` | Contains result figures |

---

## 👨‍💻 Author

**Md. Asadullahil Galib Fardin**  
Graduate Research Assistant, IWFM, BUET  
📧 [fardin.civilworks@gmail.com](mailto:fardin.civilworks@gmail.com)  
🌐 [github.com/galibfardeen](https://github.com/galibfardeen)
