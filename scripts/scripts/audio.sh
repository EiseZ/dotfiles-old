case $1 in
    "get-volume" )
        #amixer -c 2 sget PCM | grep "Mono: Playback" | cut -d " " -f6-6 | cut -b2- | rev | cut -b2- | rev ;;
        pactl get-sink-volume 1 | awk '{print $5}';;
    "set-volume" )
        if [ -n "$2" ]; then
            #amixer -c 2 sset "PCM" "$2"
            pactl set-sink-volume 0 "$2"
            pactl set-sink-volume 1 "$2"
            pactl set-sink-volume 2 "$2"
        else
            echo "Please specify a percentage"
        fi;;
    "toggle" )
        #amixer -c 2 sset "PCM" toggle;;
        pactl set-sink-mute 0 toggle
        pactl set-sink-mute 1 toggle
        pactl set-sink-mute 2 toggle;;
    * )
        echo "Incorrect use, use argument 'get-volume' or 'set-volume'";;
esac
