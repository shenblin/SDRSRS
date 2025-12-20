# 🔬 SDRSRS Code & Software Package

**Simultaneous Dual-Raman-Shift Scanning-Free Stimulated Raman Scattering Microscopy**

---

## 📌 Overview

This repository contains the **custom analysis and visualization code** used in the manuscript:

> *Simultaneous Dual-Raman-Shift Scanning-Free Stimulated Raman Scattering Microscopy for Label-Free Biomolecular Imaging*

### 🔧 System concept at a glance

![SDRSRS system overview](images/SDRSRS_system.jpg)

The software supports the complete SDRSRS workflow:

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

## 🧠 Dual-Raman-shift principle

![Dual-channel OPD principle](images/dual_channel_principle.jpg)

Simultaneous acquisition of two Raman shifts (Ω₁, Ω₂) is enabled by a **birefringent-crystal–induced optical path difference (OPD)** combined with orthogonal polarization modulation and phase-sensitive detection.
This allows **strictly synchronous CH₃–CH₂ measurements without spectral scanning**.


## 💻 1. System Requirements

### 🖥 Operating Systems

* Windows 10 / 11 (tested)
* macOS 12+ (Intel / Apple Silicon)
* Linux (Ubuntu 20.04+)

### 🧮 MATLAB

* MATLAB **R2021a or newer** (tested up to R2023b)
* Toolboxes:

  * Signal Processing Toolbox
  * Statistics and Machine Learning Toolbox

### 🐍 Python

* Python ≥ 3.8 (tested: 3.9–3.10)

```bash
pip install numpy scipy pandas matplotlib scikit-learn umap-learn jupyter
```

### 🧰 Hardware

* Standard desktop/laptop
* ❌ No SRS microscope hardware required to run the code

---

## ▶️ 2. Demo & Expected Output

### 🧪 Demo A — Raman-shift separation vs crystal length

**Script:** `Sellmeier_birefringence.m`

Reproduces Raman-shift separation ΔΩ as a function of birefringent-crystal length.

```matlab
Sellmeier_birefringence
```

⏱ Runtime: < 2 s

---

### 🧪 Demo B — SDRSRS dual-channel spectra

**Script:** `SDRSRS_Spectra_public.m`

![Dual-channel SDRSRS spectra](images/SDRSRS_Spectra_public.jpg)

Reproduces simultaneous X/Y demodulated Raman spectra.

```matlab
SDRSRS_Spectra_public
```

⏱ Runtime: < 5 s

---

### 🧪 Demo C — PCA / UMAP statistical analysis

**Notebook:** `PCA_UMAP_analysis_mouse_model.ipynb`

Performs PCA and UMAP on **biological replicates** of paired CH₃–CH₂ data.

```bash
jupyter notebook PCA_UMAP_analysis_mouse_model.ipynb
```

⏱ Runtime: < 1 min

---

## 🔁 3. Using Your Own Data

### MATLAB

* Replace CSV files in `Example_Data/`
* Column format:

  * Column 1: X demodulation
  * Column 2: Y demodulation
  * Column 3: reference (optional)

### Python

* Replace tables with paired CH₃–CH₂ intensities
* Rows = biological replicates (cells / animals / patients)

> All statistical analyses operate on **biological replicates**, not pixel-level data, consistent with the manuscript’s *Statistics and reproducibility* section.

---

## 📬 Contact & Data Availability

All data and code supporting this study are available upon reasonable request.
📧 **Contact:** `shenblin@foxmail.com`


如果你愿意，下一步我可以帮你：

1. **生成 `/images` 里缺的 PCA/UMAP 示意图**
2. 帮你**压缩成一个 Nature 推荐的 code.zip 结构**
3. 按 **Nature “Code availability”** 标准写一段正式声明
