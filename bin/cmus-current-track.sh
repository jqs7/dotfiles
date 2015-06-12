#!/bin/sh
if cmus-remote -Q > /dev/null 2>&1; then
    status=$(cmus-remote -Q | grep "status" | cut -d ' ' -f 2)
    artist=$(cmus-remote -Q | grep -m 1 "artist" | cut -d ' ' -f 3-)
    title=$(cmus-remote -Q | grep "title" | cut -d ' ' -f 3-)
    #The lines below works fine. Just uncomment them and add them
    # in np below if you want the track number or album name.
    #tracknumber=$(cmus-remote -Q | grep "tracknumber" | cut -d ' ' -f 3)
    #album=$(cmus-remote -Q | grep "album" | cut -d ' ' -f 3-)

    np=$(echo "♫ ${artist} - ${title}")

    if [ "$status" == "playing" ]; then
        echo "$np"
    fi
fi
