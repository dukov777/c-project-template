#!/bin/bash
# File: scripts/genconfig.sh

OUTPUT_DIR="./include"
CONFIG_FILE="${OUTPUT_DIR}/config.h"

mkdir -p $OUTPUT_DIR

# Create config header
cat > $CONFIG_FILE << EOF
/* Auto-generated config file - DO NOT EDIT */
#ifndef _PROJECT_CONFIG_H_
#define _PROJECT_CONFIG_H_

EOF

# For boolean options, convert 'y' to '1' and 'n' to '0'
grep -v "^#" .config | grep "=y" | sed 's/CONFIG_\(.*\)=y/#define CONFIG_\1 1/' >> $CONFIG_FILE
grep -v "^#" .config | grep "=n" | sed 's/CONFIG_\(.*\)=n/#define CONFIG_\1 0/' >> $CONFIG_FILE

# For other options (like integers and strings)
grep -v "^#" .config | grep "=" | grep -v "=y" | grep -v "=n" | sed 's/CONFIG_\(.*\)=\(.*\)/#define CONFIG_\1 \2/' >> $CONFIG_FILE


# Close header guard
echo "" >> $CONFIG_FILE
echo "#endif /* _PROJECT_CONFIG_H_ */" >> $CONFIG_FILE

echo "Generated $CONFIG_FILE"