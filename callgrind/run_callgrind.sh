#!/bin/bash

TEST="../11-SobaZabave/test/Test/build/Test"
DATA_FILE="callgrind.out"
REPORT_FILE="callgrind_report.txt"
PROJECT_REPORT_FILE="callgrind_project_report.txt"

echo "Running Callgrind analysis..."

valgrind --tool=callgrind \
    --callgrind-out-file="$DATA_FILE" \
    "$TEST"

echo "Generating Callgrind report..."

callgrind_annotate \
    --auto=yes \
    "$DATA_FILE" \
    > "$REPORT_FILE"

echo "Extracting project functions..."

{
    head -24 "$REPORT_FILE"
    grep -E "Mice|Othello|Othellostate|Board|Game" "$REPORT_FILE"
} > "$PROJECT_REPORT_FILE"

echo "Callgrind analysis finished."
echo "Full report saved to: $REPORT_FILE"
echo "Project report saved to: $PROJECT_REPORT_FILE"
