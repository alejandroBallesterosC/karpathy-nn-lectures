# Neural Networks and Deep Learning Lecture Notes

A beautifully styled LaTeX document collection based on Andrej Karpathy's neural networks lectures.

## 📁 Project Structure

```
karpathy-nn-lectures/
├── latex/                  # LaTeX source files
│   ├── main.tex           # Main document with styling and structure
│   ├── lecture1.tex       # Lecture 1: Neural Networks & Backpropagation with Micrograd
│   └── lecture2.tex       # (Add future lectures here)
├── scripts/
│   └── compile_latex.sh   # Automated compilation script
├── pdfs/                  # Generated PDF output
│   └── main.pdf          # Compiled lecture notes
└── README.md             # This file
```

## 🚀 Quick Start

### Compile All Lectures
```bash
./scripts/compile_latex.sh
```

### Manual Compilation
```bash
cd latex/
pdflatex main.tex
pdflatex main.tex  # Run twice for TOC and cross-references
```

## ✨ Features

- **Professional Styling**: Clean, academic layout with proper typography
- **Code Highlighting**: Syntax-highlighted Python code blocks
- **Modular Structure**: Easy to add new lectures
- **Automated Compilation**: One-command PDF generation
- **Table of Contents**: Automatically generated navigation
- **Hyperlinks**: Clickable references and navigation

## 📝 Adding New Lectures

1. **Create a new lecture file**:
   ```bash
   touch latex/lecture2.tex
   ```

2. **Use this template structure**:
   ```latex
   % ====================================================================
   % LECTURE 2: Your Lecture Title Here
   % ====================================================================
   
   \section{Lecture 2: Your Lecture Title}
   
   \begin{abstract}
   Brief description of what this lecture covers.
   \end{abstract}
   
   \subsection{Main Topic}
   Your content here...
   
   \subsubsection{Subtopic}
   More detailed content...
   ```

3. **Add to main.tex**:
   ```latex
   % Include individual lecture files
   \input{lecture1}
   \input{lecture2}  % Add this line
   ```

4. **Compile**:
   ```bash
   ./scripts/compile_latex.sh
   ```

## 🎨 Styling Features

### Mathematics
- Enhanced math environments with `amsmath`, `amssymb`, `amsthm`
- Custom commands for neural network notation:
  - `\loss` for loss functions
  - `\grad` for gradients  
  - `\sigmoid`, `\relu`, `\softmax` for activation functions

### Code Blocks
```latex
\begin{lstlisting}[caption={Your Caption Here}]
# Python code with syntax highlighting
def neural_network():
    return "Beautiful code formatting!"
\end{lstlisting}
```

### Colors and Typography
- Blue color scheme for headers and links
- Professional fonts and spacing
- Consistent formatting throughout

## 🔧 Customization

### Changing the Title
Edit the title section in `latex/main.tex`:
```latex
\title{
    \huge\textbf{Your Course Title}\\
    \Large\textbf{Lecture Notes}\\
}
```

### Adding New Packages
Add packages to the preamble in `latex/main.tex`:
```latex
\usepackage{your-package}
```

### Custom Commands
Define new commands in the custom commands section:
```latex
\newcommand{\yourcommand}{Your definition}
```

## 📋 Current Lectures

1. **Lecture 1: Neural Networks and Backpropagation with Micrograd**
   - Understanding derivatives and gradients
   - Building the Value object
   - Implementing backpropagation
   - Creating neural networks (MLPs)
   - Training loops and gradient descent
   - Comparison with PyTorch

## 🛠️ Requirements

- LaTeX distribution (TeX Live, MiKTeX, etc.)
- Required packages (automatically installed with most distributions):
  - `amsmath`, `amssymb`, `amsthm`
  - `listings`, `xcolor`
  - `geometry`, `fancyhdr`, `hyperref`
  - And others (see `main.tex` for complete list)

## 📖 Usage Tips

- **Always run compilation twice** to resolve cross-references and TOC
- **Use the automated script** for consistent results
- **Check compile logs** if there are errors (`compile_log_pass1.log`, `compile_log_pass2.log`)
- **Keep lectures modular** - one file per lecture for easy management

## 🎓 Next Steps

1. Add more lectures as you take notes
2. Consider adding problem sets using the existing templates
3. Customize styling to your preferences
4. Share your beautifully formatted notes!

---

*Happy learning! 🧠✨*
