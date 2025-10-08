# LaTeX Setup on Arch Linux

## Overview

This guide covers setting up a complete LaTeX environment on Arch Linux for academic journal writing with both English and Chinese language support. LaTeX is a document preparation system widely used in academia for producing high-quality technical and scientific documents.

## Installation for English Journal Compilation with Chinese Support

### Required Packages

For English journal compilation with Chinese support, install the following packages:

```bash
sudo pacman -S texlive-basic texlive-latex texlive-latexrecommended texlive-latexextra \
               texlive-langenglish texlive-langchinese texlive-langcjk \
               texlive-fontsrecommended texlive-fontsextra \
               texlive-publishers texlive-bibtexextra \
               texlive-mathscience texlive-pictures \
               texlive-binextra biber
```

### Package Breakdown

**Core LaTeX:**

- `texlive-basic` - Essential programs and files (tex, pdftex engines)
- `texlive-latex` - LaTeX fundamental packages (core document classes and packages)
- `texlive-latexrecommended` - Recommended LaTeX packages for standard document features
- `texlive-latexextra` - Additional LaTeX packages (extended functionality, specialized packages)

**Language Support:**

- `texlive-langenglish` - US and UK English hyphenation patterns and language support
- `texlive-langchinese` - Chinese typesetting packages (ctex, xeCJK for Chinese documents)
- `texlive-langcjk` - Base support for Chinese/Japanese/Korean (CJK) character encoding and fonts

**Fonts:**

- `texlive-fontsrecommended` - Standard fonts required by most documents (Latin Modern, etc.)
- `texlive-fontsextra` - Extended font collection including Chinese fonts (Fandol, etc.)

**Journal Publishing:**

- `texlive-publishers` - Journal and publisher style files (IEEE, ACM, Springer, Elsevier templates)
- `texlive-bibtexextra` - Bibliography management tools (biblatex, additional BibTeX styles)
- `texlive-mathscience` - Mathematics and scientific notation packages (amsmath, physics, siunitx)
- `texlive-pictures` - Graphics creation tools (TikZ, pgfplots for diagrams and plots)

**Build Tools:**

- `texlive-binextra` - Auxiliary build programs (latexmk for automated compilation, latexdiff, etc.)
- `biber` - Modern bibliography processor for biblatex (Unicode-capable BibTeX replacement)

### Optional Packages

For advanced features:

```bash
sudo pacman -S texlive-xetex      # XeTeX engine - better Unicode/font handling
sudo pacman -S texlive-luatex     # LuaTeX engine - modern TeX with Lua scripting
```

**Why XeTeX?** XeTeX provides superior Unicode support and can use system fonts directly, making it ideal for multilingual documents (especially Chinese). It's the recommended engine when using Chinese text.

**Why LuaTeX?** LuaTeX is a modern TeX engine that embeds the Lua scripting language, allowing for programmable document generation and advanced typography.

### Minimal Installation

For a minimal setup (basic English + Chinese):

```bash
sudo pacman -S texlive-basic texlive-latex texlive-langenglish \
               texlive-langchinese texlive-langcjk
```

### Search TeXLive Packages

To search for specific TeX packages:

```bash
pacman -Ss texlive              # Search all TeXLive packages
pacman -Ss texlive-lang         # Search language packages
pacman -Si texlive-langchinese  # View package details
```

## Compilation Engines Explained

LaTeX has multiple compilation engines, each with different capabilities:

| Engine | Command | Best For | Chinese Support |
|--------|---------|----------|-----------------|
| pdfLaTeX | `pdflatex` | English documents, traditional LaTeX workflow | Limited (CJK package) |
| XeLaTeX | `xelatex` | Unicode documents, system fonts, multilingual | Excellent (xeCJK) |
| LuaLaTeX | `lualatex` | Modern documents, Lua scripting | Good |

**For this setup:** Use `xelatex` (or `latexmk -xelatex`) for English + Chinese documents.

## Testing the Installation

Create a test file `test.tex`:

```latex
\documentclass{article}
\usepackage{xeCJK}  % For Chinese support (requires XeLaTeX)
\setCJKmainfont{Noto Sans CJK SC}  % Set Chinese font (adjust if different font installed)

\begin{document}
\title{Test Document}
\author{Author Name}
\maketitle

\section{English Section}
This is an English paragraph for journal compilation.

\section{中文部分}
这是中文测试段落。

\end{document}
```

**Explanation of the test file:**

- `\documentclass{article}` - Uses the standard article class for academic papers
- `\usepackage{xeCJK}` - Loads xeCJK package for Chinese character support (requires XeLaTeX engine)
- `\setCJKmainfont{Noto Sans CJK SC}` - Sets the Chinese font (use system fonts like Noto Sans CJK or Source Han Sans)
- The document contains both English and Chinese text to verify bilingual support

Compile with:

```bash
xelatex test.tex
```

Or use latexmk for automatic compilation:

```bash
latexmk -xelatex test.tex
```

### Using latexmk

latexmk is an automated build tool that intelligently handles all compilation steps. Unlike running `xelatex` or `pdflatex` manually, latexmk automatically:

- Detects when multiple compilation passes are needed (for cross-references, table of contents, etc.)
- Runs BibTeX/Biber for bibliography generation when needed
- Handles index generation
- Only recompiles when source files change

**Common latexmk commands:**

```bash
# Compile with XeLaTeX (recommended for Chinese)
latexmk -xelatex document.tex

# Compile with pdfLaTeX (for English-only documents)
latexmk -pdf document.tex

# Continuous preview mode (auto-recompile on changes)
latexmk -xelatex -pvc document.tex

# Clean auxiliary files (.aux, .log, .out, etc.)
latexmk -c

# Clean all generated files including PDF
latexmk -C
```

**Why use latexmk?**

1. **Automation** - Handles complex build dependencies automatically
2. **Efficiency** - Only recompiles when necessary
3. **Convenience** - One command instead of multiple manual runs
4. **Reliability** - Ensures all references and citations are properly resolved

**Example workflow:**

```bash
# Initial compilation
latexmk -xelatex paper.tex

# Watch mode for editing (recompiles on save)
latexmk -xelatex -pvc paper.tex

# Clean up before submission
latexmk -c
```

## Bibliography Management

For academic papers, you'll need bibliography management. Two main approaches:

### Using BibTeX (Traditional)

```latex
\documentclass{article}
\begin{document}
\cite{knuth1984}
\bibliographystyle{plain}
\bibliography{references}  % references.bib file
\end{document}
```

Compile with:
```bash
latexmk -xelatex paper.tex  # latexmk handles bibtex automatically
```

### Using Biblatex + Biber (Modern, Recommended)

```latex
\documentclass{article}
\usepackage[backend=biber,style=ieee]{biblatex}
\addbibresource{references.bib}

\begin{document}
\cite{knuth1984}
\printbibliography
\end{document}
```

Compile with:
```bash
latexmk -xelatex paper.tex  # latexmk handles biber automatically
```

**Why Biber?**
- Full Unicode support (essential for Chinese names/titles in bibliography)
- Better sorting algorithms
- More flexible citation styles
- Modern replacement for BibTeX

**Note:** The `biber` package is separate from TeXLive and must be installed explicitly. It's included in the installation command above.
