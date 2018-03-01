#!/usr/bin/env bash

rm -rf build/
mkdir build

echo "Compiling functions to build/ ..."
cd handlers/
for f in *.go; do
  filename="${f%.go}"
  GOOS=linux go build -o ${filename} ${f}
  zip ../build/${filename}.zip ${filename}
  rm ${filename}
done

echo "Done."
