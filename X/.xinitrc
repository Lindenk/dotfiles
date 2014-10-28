# change caps lock to escape
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

# numlock on by default
numlockx on

# Set repeat rate
xset r rate 200 35

xrandr --output DVI-D-0 --primary --mode 1920x1080 --output DVI-I-0 --mode 1440x900 --right-of DVI-D-0

sxhkd &
exec bspwm
