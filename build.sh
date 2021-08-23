#!/bin/bash

VERSION=$(node -p -e "require('./package.json').version")

rm -rf build && mkdir build && cd build

npx pkg ../index.js -t node14-linux-x64 --out-path linux-x64
cd linux-x64
mv index scratch-run
zip "../scratch-run_"$VERSION"_linux_amd64.zip" scratch-run
cd ..

npx pkg ../index.js -t node14-macos-x64 --out-path macos-x64
cd macos-x64
mv index scratch-run
zip "../scratch-run_"$VERSION"_macos_amd64.zip" scratch-run
cd ..

npx pkg ../index.js -t node14-win-x64 --out-path win-x64
cd win-x64
mv index.exe scratch-run.exe
zip "../scratch-run_"$VERSION"_win_amd64.zip" scratch-run.exe
cd ..