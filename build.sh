#!/bin/bash

# Copyright (c) 2012  XULApp StarterKit racklin@gmail.com

CALLDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PACKAGENAME="xulapp-starterkit-addon-expressjs-demo"
VERSION="0.0.1"

BUILDDIR="$CALLDIR/build"
DISTDIR="$CALLDIR/dist"
BUILDID=`date +%Y%m%d`

echo "Building ExpressJS Demo for XULApp StarterKit"

# Remove build directory
if [ ! -d "$BUILDDIR" ]; then mkdir -p "$BUILDDIR"; fi

# Copy app directory
cp -RH "$CALLDIR/chrome" "$BUILDDIR/"
cp -RH "$CALLDIR/app" "$BUILDDIR/"
cp "$CALLDIR/chrome.manifest" "$BUILDDIR/"
cp "$CALLDIR/install.rdf" "$BUILDDIR/"

# Make sure DISTDIR exists
if [ ! -d "$DISTDIR" ]; then mkdir -p "$DISTDIR"; fi

cd "$BUILDDIR" && zip -rqX "$DISTDIR/${PACKAGENAME}-${VERSION}.xpi" *

rm -rf $BUILDDIR
