#!/bin/sh
# make animated gif with compilied example

article="dcal2025-ru"

if [ -x "/usr/bin/convert" ]; then
        if [ ! -d "slideHD" ]; then
                mkdir -p slideHD
        fi
        cd slideHD
        rm -f *.png
        convert -verbose -strip -density 300 ../${article}.pdf -quality 100 PNG24:slide-%02d.png
else
        echo "You must install ImageMagick!"
fi

