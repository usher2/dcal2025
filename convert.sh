#!/bin/sh
# make animated gif with compilied example

article=$1

if [ "x${article}" = "x" ]; then
        article="dcal2025-ru"
fi

if [ -x "/usr/bin/convert" ]; then
        if [ ! -d "slide" ]; then
                mkdir -p slide
        fi
        cd slide
        rm -f slide-*.png
        convert -strip -verbose -density 300 ../${article}.pdf -quality 90 -resize 800  PNG8:slide-%02d.png
        convert -layers OptimizePlus -delay 200 slide-00.png -delay 125 slide-[0123456789][0123456789].png -loop 0 ../${article}.gif
else
        echo "You must install ImageMagick!"
fi

