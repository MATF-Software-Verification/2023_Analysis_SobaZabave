#!/bin/bash

REPORT_FILE="lizard_report.txt"

echo "Running Lizard analysis..."

lizard \
    ../11-SobaZabave/SobaZabave/src/Client/src \
    ../11-SobaZabave/SobaZabave/src/Client/include \
    ../11-SobaZabave/SobaZabave/src/Server/src \
    ../11-SobaZabave/SobaZabave/src/Server/include \
    > "$REPORT_FILE"

echo "Lizard analysis finished."
echo "Report saved to: $REPORT_FILE"
