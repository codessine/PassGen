#!/bin/bash

echo "
╔══════════════════════════════════════════════╗
║            🔐 PassGen Uninstall 🔐          ║
╚══════════════════════════════════════════════╝
"

PROJECT_DIR="/usr/local/lib/passgen"
SYMLINK="/usr/local/bin/passgen"

# Check if both project and symlink exist
if [ ! -d "$PROJECT_DIR" ] && [ ! -L "$SYMLINK" ]; then
    echo "✅ PassGen is already uninstalled 😞"
    exit 0
fi

# Remove project folder if it exists
if [ -d "$PROJECT_DIR" ]; then
    sudo rm -rf "$PROJECT_DIR"
    echo "✅ Removed project folder: $PROJECT_DIR"
fi

# Remove symlink if it exists
if [ -L "$SYMLINK" ]; then
    sudo rm "$SYMLINK"
    echo "✅ Removed symlink: $SYMLINK"
fi

echo "
😢 PassGen uninstall completed!
"
