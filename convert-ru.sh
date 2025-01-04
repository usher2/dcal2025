#!/bin/sh
# make animated gif with compilied example

article=$1

if [ "x${article}" = "x" ]; then
        article="dcal2025-ru"
fi

if [ -x "/usr/bin/convert" ]; then
        if [ ! -d "slide/${article}" ]; then
                mkdir -p slide/${article}
        fi
        cd slide/${article}
        rm -f slide-*.png
        convert -strip -verbose -density 300 ../../${article}.pdf -quality 90 -resize 800  PNG8:slide-%02d.png
        cp -f slide-00.png ../../${article}.png
else
        echo "You must install ImageMagick!"
fi

