#!/usr/bin/env sh

# Wrapper around qutebrowser that makes sessions (-r, --restore SESSION) behave
# like they used to in dwb.
#
# We do so by filtering out the -r/--restore option passed to qutebrowser and
# using the argument to set up the following directory structure and symbolic
# links:
#
# $XDG_RUNTIME_DIR/qutebrowser/$session/cache → $XDG_CACHE_HOME/qutebrowser/$session
# $XDG_RUNTIME_DIR/qutebrowser/$session/data → $XDG_DATA_HOME/qutebrowser/$session
# $XDG_RUNTIME_DIR/qutebrowser/$session/config → $XDG_CONFIG_HOME/qutebrowser
# $XDG_RUNTIME_DIR/qutebrowser/$session/runtime (no symlink, regular directory)
#
# We then specify $XDG_RUNTIME_DIR/qutebrowser/$session as a --basedir, and the
# files will end up in their intended locations (notice how the config directory
# is the same for all sessions, as there is no point in keeping it separate).
#
# Written by ayekat in an burst of nostalgy, on a mildly cold wednesday night in
# February 2017.

set -e

# Set default values for the variables as defined in the XDG base directory spec
# (https://specifications.freedesktop.org/basedir-spec/latest/):
XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Translate options: remove occurrences of -r/--restore from the list of
# command line arguments and save the session name for later; ignore -R (TODO):
session=default
basedir_specified=n
opts_read=0
while [ $opts_read -lt $# ]; do
	opt="$1" && shift
	case "$opt" in
		(--basedir) basedir_specified=y ;;
		(-r|-[!-]*r|--restore) test $# -gt 0 && session="$1" && shift && continue ;;
		(-R) continue ;; # TODO
	esac
	set -- "$@" "$opt"
	opts_read=$((opts_read + 1))
done

# Set up session base directory, unless --basedir has been specified by the
# user:
if [ "$basedir_specified" != 'y' ]; then
	basedir="$XDG_RUNTIME_DIR/qutebrowser/$session"
	set -- --basedir "$basedir" "$@"
	mkdir -p \
		"$basedir" \
		"$XDG_CONFIG_HOME/qutebrowser" \
		"$XDG_CACHE_HOME/qutebrowser/$session" \
		"$XDG_DATA_HOME/qutebrowser/$session" \
		"$basedir/runtime"
	ln -fsT "$XDG_CONFIG_HOME/qutebrowser" "$basedir/config"
	ln -fsT "$XDG_CACHE_HOME/qutebrowser/$session" "$basedir/cache"
	ln -fsT "$XDG_DATA_HOME/qutebrowser/$session" "$basedir/data"
fi

# Run "real" qutebrowser executable:
if [ "$(basename "$0")" != qutebrowser ]; then
	exec qutebrowser "$@"
fi
spath="$(readlink -f "$0")"
IFS=:
for p in $PATH; do
	epath="$p"/qutebrowser
	if [ -x "$epath" ] && [ "$(readlink -f "$epath")" != "$spath" ]; then
		exec "$epath" "$@"
	fi
done
echo 'command not found: qutebrowser' >&2
exit 127
