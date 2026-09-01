#!/bin/bash

CLIENT="../11-SobaZabave/SobaZabave/src/build-Client-Desktop-Debug/Client"
DATA_FILE="perf.data"
REPORT_FILE="perf_report.txt"

echo "Running Perf analysis..."

sudo perf record -g -o "$DATA_FILE" "$CLIENT"

echo "Generating Perf report..."

sudo perf report \
    -i "$DATA_FILE" \
    --stdio \
    --no-source \
    > "$REPORT_FILE"

echo "Perf analysis finished."
echo "Report saved to: $REPORT_FILE"
