#!/bin/bash

for filename in inputs/grayscale/*.jpg; do
    if [[ -f "${filename}" ]]; then
        colorspace=$(identify -format %[colorspace] "${filename}")

        if [[ "${colorspace}" != 'sRGB' ]];then
            convert "${filename}" -colorspace sRGB -type truecolor "${filename}"
            echo "Converted: ${filename}"
        fi
    fi
done
