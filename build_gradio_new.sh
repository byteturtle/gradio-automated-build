#!/bin/bash
cd build/gradio
git reset --hard
git pull
cd ..
rm -rf compile/*
flatpak-builder --repo=repo compile gradio/de.haeckerfelix.gradio.json --gpg-sign=A001AC1A
flatpak build-sign repo --gpg-sign=A001AC1A
flatpak build-export /home/buildbot/repos/gradio compile --gpg-sign=A001AC1A
flatpak build-update-repo --title=Gradio /home/buildbot/repos/gradio --gpg-sign=A001AC1A
