#!/bin/bash

# Exit on errors
set -e

# Navigate to the directory containing this script, then to project root
cd "$(dirname "$0")/.."

# Hardcoded relative input and output directories
INPUT_DIR="./latex"
OUTPUT_DIR="./pdfs"
MAIN_FILE="main.tex"

# Ensure input directory exists
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Input directory '$INPUT_DIR' does not exist."
    exit 1
fi

# Ensure main.tex exists
if [ ! -f "$INPUT_DIR/$MAIN_FILE" ]; then
    echo "Error: Main file '$INPUT_DIR/$MAIN_FILE' does not exist."
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "🚀 Compiling Neural Networks lecture notes..."
echo "📂 Input: $INPUT_DIR/$MAIN_FILE"
echo "📂 Output: $OUTPUT_DIR/"
echo ""

# Change to latex directory for compilation
cd "$INPUT_DIR"

echo "📖 Compiling: $MAIN_FILE (pass 1)..."
# First pass: Run pdflatex to compile the main file
pdflatex -interaction=nonstopmode "$MAIN_FILE" > "../compile_log_pass1.log" 2>&1

echo "📖 Compiling: $MAIN_FILE (pass 2)..."
# Second pass: Run pdflatex again for cross-references, TOC, etc.
pdflatex -interaction=nonstopmode "$MAIN_FILE" > "../compile_log_pass2.log" 2>&1

# Go back to project root
cd ..

# Move the generated PDF to the output directory
base_name="${MAIN_FILE%.tex}"
if [ -f "$INPUT_DIR/$base_name.pdf" ]; then
    cp "$INPUT_DIR/$base_name.pdf" "$OUTPUT_DIR/"
    echo "✔ Successfully compiled: $base_name.pdf -> $OUTPUT_DIR/"
    
    # Get page count if pdfinfo is available
    if command -v pdfinfo &> /dev/null; then
        pages=$(pdfinfo "$OUTPUT_DIR/$base_name.pdf" 2>/dev/null | grep "Pages:" | awk '{print $2}')
        echo "📄 Pages: $pages"
    fi
else
    echo "❌ Error: Failed to generate PDF for $MAIN_FILE"
    echo "Check compile_log_pass1.log and compile_log_pass2.log for details"
    exit 1
fi

# Clean up auxiliary files in latex directory (but keep logs for debugging)
cd "$INPUT_DIR"
rm -f *.aux *.log *.out *.toc
cd ..

echo ""
echo "✅ Compilation complete! Neural Networks lecture notes saved as: $OUTPUT_DIR/$base_name.pdf"
echo "🎓 Ready to add more lectures - just create lecture2.tex, lecture3.tex, etc."
