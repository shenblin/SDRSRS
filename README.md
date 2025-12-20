# 🔬 SDRSRS Code & Software Package

**Simultaneous Dual-Raman-Shift Scanning-Free Stimulated Raman Scattering Microscopy**

---

## 📌 Overview

This repository contains the **custom analysis and visualization code** used in the manuscript:

> *Simultaneous Dual-Raman-Shift Scanning-Free Stimulated Raman Scattering Microscopy for Label-Free Biomolecular Imaging*

The software enables:

```
┌──────────────────────────────────────────┐
│  Birefringent-crystal Raman-shift model │
│        (Sellmeier-based)                │
├──────────────────────────────────────────┤
│  Dual-channel SDRSRS spectral analysis  │
│   (X / Y orthogonal demodulation)       │
├──────────────────────────────────────────┤
│  PCA / UMAP statistical classification │
│   (paired CH₃–CH₂ biochemical data)    │
└──────────────────────────────────────────┘
```

All scripts are provided for **reviewer assessment, transparency, and reproducibility**.

---

## 📂 Directory Structure

```
SDRSRS_Code_Package/
├── 📁 MATLAB
│   ├── Sellmeier_birefringence.m
│   └── SDRSRS_Spectra_public.m
│
├── 📁 Python
│   └──PCA_UMAP_analysis_mouse_model.ipynb
│   └──PCA_UMAP_analysis_human_CRC.ipynb
│
├── 📁 Example_Data
│   ├── DMSO1chn.csv
│   ├── MeOH1chn.csv
│   ├── DMSO2chn.csv
│   └── MeOH2chn.csv
│
└── 📄 README.md
```

---

## 💻 1. System Requirements

### 🖥 Operating Systems

* ✅ Windows 10 / 11 (tested)
* ✅ macOS 12+ (Intel / Apple Silicon)
* ✅ Linux (Ubuntu 20.04+)

---

### 🧮 MATLAB Environment

* MATLAB **R2021a or newer** (tested up to R2023b)
* Required toolboxes:

  * Signal Processing Toolbox
  * Statistics and Machine Learning Toolbox
  * (Optional) Curve Fitting Toolbox

```
MATLAB Usage  →  Spectral modeling & visualization
```

---

### 🐍 Python Environment (Statistical Analysis)

* Python ≥ 3.8 (tested: 3.9, 3.10)

Required packages:

```bash
pip install numpy scipy pandas matplotlib scikit-learn umap-learn jupyter
```

```
Python Usage  →  PCA / UMAP / clustering analysis
```

---

### 🧰 Hardware Requirements

* Standard desktop or laptop computer
* ❌ No specialized hardware required
* ⚠️ SRS microscope hardware is **not required** to run the software

---

## ⚙️ 2. Installation Guide

### Step 1 — Unpack

```text
Unzip SDRSRS_Code_Package.zip
```

### Step 2 — MATLAB Setup

* Open MATLAB
* Set working directory to `MATLAB/`
* Verify toolbox availability

⏱ **Typical setup time:** < 5 minutes

---

## ▶️ 3. Demo & Expected Output

### 🧪 Demo A — Birefringent Crystal Raman-Shift Model

**Script:**
`Sellmeier_birefringence.m`

**Purpose:**
Compute Raman-shift separation ΔΩ vs. YVO₄ crystal length
(reproduces **Fig. 2f**)

```matlab
Sellmeier_birefringence
```

**Output:**

```
Raman shift difference (cm⁻¹)
│
│        ●  ●  ●  ●   ← experimental points
│      ─────────────
│     /   shaded     \  ← theoretical range
│____/________________\________  Crystal length (cm)
```

⏱ Runtime: < 2 s

---

### 🧪 Demo B — SDRSRS Dual-Channel Spectra

**Script:**
`SDRSRS_Spectra_public.m`

**Purpose:**
Reconstruct simultaneous X/Y demodulated Raman spectra
(reproduces **Fig. 2g–h**)

**Steps:**

1. Set `file_path` to `Example_Data/`
2. Run:

```matlab
SDRSRS_Spectra_public
```

⏱ Runtime: < 5 s

---

### 🧪 Demo C — PCA & UMAP Analysis

**Notebook:**
`PCA_UMAP_analysis.ipynb`

**Purpose:**
Statistical separation of paired CH₃–CH₂ data
(reproduces **Fig. 4–5**)

```bash
jupyter notebook PCA_UMAP_analysis_mouse_model.ipynb
```


⏱ Runtime: < 1 min

---

## 🔁 4. Using Your Own Data

### MATLAB (Spectral Data)

* Replace CSV files in `Example_Data/`
* Column format:

  * Col 1 → X demodulation
  * Col 2 → Y demodulation
  * Col 3 → reference (optional)

### Python (Statistical Data)

* Replace tables with your own paired CH₃–CH₂ values
* Rows = biological replicates
* Columns = intensities or ratios


All analyses operate on **biological replicates**, not pixel-level data, consistent with the manuscript’s *Statistics and reproducibility* section.


## 📬 Contact & Data Availability

All data and code supporting this study are available upon reasonable request.
Please contact the corresponding author for additional datasets or clarification.

