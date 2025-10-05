#!/bin/bash

echo "
╔══════════════════════════════════════════════╗
║              🔐 PassGen Setup 🔐            ║
╚══════════════════════════════════════════════╝
"

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "❌ Node.js is not installed. Please install Node.js first:"
    echo "   https://nodejs.org/"
    exit 1
fi

SRC="$(pwd)"
DEST="/usr/local/lib/passgen"
LINK="/usr/local/bin/passgen"

# Remove old installation if exists
if [ -d "$DEST" ]; then
    sudo rm -rf "$DEST"
    echo "⚠ Old installation removed: $DEST"
fi

if [ -L "$LINK" ]; then
    sudo rm "$LINK"
    echo "⚠ Old symlink removed: $LINK"
fi

# Copy project
sudo cp -r "$SRC" "$DEST"
echo "✅ Project copied to $DEST"

# Make the main script executable
sudo chmod +x "$DEST/passgen"

# Create symbolic link
sudo ln -s "$DEST/passgen" "$LINK"
echo "✅ Symlink created: $LINK"

echo "
🎉 PassGen installed successfully! Run it with 'passgen'.
"
