format="%T"
if [ $# -ge 1 ]; then
    format=$1
fi

    curl qrenco.de/$(date +"$format" | sed -r 's/[ ]+/%20/g')
