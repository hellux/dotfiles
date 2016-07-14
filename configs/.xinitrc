if [ -d /etc/X11/xini/xinitrc.d ] ; then
	for f in /etc/X11/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

exec i3
