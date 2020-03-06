#/bin/bash

TMPBG=~/.config/i3/screen.png
HUE=(-level 0%,100%,0.6)
EFFECT=(-filter Gaussian -resize 20% -define filter:sigma=1.5 -resize 500.5%)

DISPLAY_RE="([0-9]+)x([0-9]+)\\+([0-9]+)\\+([0-9]+)"
DISPLAYS=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')

LOCK_ICON=~/.config/i3/lock.png

SQUARE_W=300
SQUARE_H=375
SQUARE_R=10
SQUARE_O=0.7

# GET SCREENS PROPS
DRAW=""
for MON in $DISPLAYS
do
  if [[ $MON =~ $DISPLAY_RE ]]; then
    SCREEN_WIDTH=${BASH_REMATCH[1]}
    SCREEN_HEIGHT=${BASH_REMATCH[2]}
    SCREEN_X=${BASH_REMATCH[3]}
    SCREEN_Y=${BASH_REMATCH[4]}

    SQUARE_X=$((($SCREEN_WIDTH - $SQUARE_W) / 2 + $SCREEN_X))
    SQUARE_Y=$((($SCREEN_HEIGHT - $SQUARE_H) / 2 + $SCREEN_Y))
    SQUARE_X2=$(($SQUARE_X + $SQUARE_W))
    SQUARE_Y2=$(($SQUARE_Y + $SQUARE_H))

    DRAW+="roundRectangle $SQUARE_X,$SQUARE_Y $SQUARE_X2,$SQUARE_Y2 $SQUARE_R,$SQUARE_R "
  fi
done

# GET RANDOM QUOTE
QUOTE_URL="http://api.forismatic.com/api/1.0/?method=getQuote&format=text&lang=en"
QUOTE=$(wget $QUOTE_URL -q -O -)
QUOTE_SIZE=20

if [[ ${#QUOTE_SIZE} > 80 ]]; then
  QUOTE_SIZE=16
fi

scrot $TMPBG 
convert $TMPBG "${HUE[@]}" "${EFFECT[@]}" -draw "fill black fill-opacity $SQUARE_O $DRAW" $TMPBG
#original font NexaLight
convert $TMPBG -gravity center -font "Noto Sans" -pointsize $QUOTE_SIZE -style italic -draw "fill white fill-opacity .3 text 0,300 '$QUOTE'" $TMPBG
convert -gravity center -geometry +0-63 $TMPBG $LOCK_ICON -composite $TMPBG

#Pause music
if [[ "$(playerctl status)" == "Playing" ]]; then
    playerctl pause
    play=true
fi

$(i3lock \
  -i $TMPBG \
  -e --timepos="x+w/2:y+h/2+95" \
  --datepos="tx:ty+45" \
  --indpos="x+w/2:y+h/2-60" \
  --timesize=48 --datesize=16 --redraw-thread\
  --clock --indicator --datestr "Type password to unlock..." \
  --insidecolor=00000000 --ringcolor=ffffff33 --separatorcolor=00ffff00 \
  --insidevercolor=00000000 --insidewrongcolor=00000000 \
  --linecolor=00000000 --time-font="Noto Sans" --date-font="Noto Sans Light"\
  --ringvercolor=ffffffAA --ringwrongcolor=c62d2d77 --keyhlcolor=ffffff99\
  --radius=70 --veriftext="" --verifcolor="ffffffff" --wrongtext="Wrong" \
  --wrongcolor="ffffffff" --timecolor="ffffffff" --datecolor="ffffff66") && if [[ $play = true ]]; then
    playerctl play
fi

rm ~/.config/i3/screen.png
