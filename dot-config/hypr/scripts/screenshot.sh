
SAVEDIR=~/Pictures/Screenshots
FILENAME="$(date +"Screenshot-%F-%H-%M-%S.png")"
FILEPATH="$SAVEDIR/$FILENAME"

echo "$FILEPATH $@"

if [ "$#" -eq "0" ]
  then
    grim $FILEPATH
else
    grim -g "$1" $FILEPATH
fi

# TODO: screenshot area not working

wl-copy < $FILEPATH
notify-send "Screenshot" "File copied and saved as <i>$FILENAME</i>" -i "$FILEPATH"
