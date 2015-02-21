# load resources
xrdb .Xresources

# change caps lock to escape
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

# numlock on by default
numlockx on

# Set repeat rate
xset r rate 200 35

# Pulse
pulseaudio --start
#amixer sset Master unmute
#amixer sset -c SB Headphones unmute
aslactl restore

# Monitors
#xrandr --output HDMI-0 --primary --mode 1920x1080 --output DVI-D-0 --left-of HDMI-0 --mode 1680x1050 --output DVI-I-0 --mode 1680x1050 --right-of HDMI-0
xrandr --output DP-0 --mode 1920x1080 --primary --output DVI-D-0 --mode 1680x1050 --left-of DP-0 --output DVI-I-0 --mode 1680x1050 --right-of DP-0 --output HDMI-0 --off

# Wallpaper
sh ~/.fehbg &

# Fix java
export _JAVA_AWT_WM_NONREPARENTING=1

# Keybindings and window manager
sxhkd &
exec bspwm
