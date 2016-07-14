echo -e '\e[H\e[2J' > issue
echo -e '        \e[1;34m/\\\\        \e[30m|  \e[34mArch Linux \\r' >> issue
echo -e '       \e[34m/  \\\\       \e[30m|' >> issue
echo -e '      \e[1;34m/ \e[1;34m.. \e[1m\\\\      \e[30m|  \e[0m\\d' >> issue
echo -e '     \e[1;34m/ \e[0;34m.  . \\\\     \e[1;30m|' >> issue
echo -e '    \e[0;34m/  .  .  \\\\    \e[1;30m|  \e[0m\\t' >> issue
echo -e '   \e[0;34m/ ..    .. \\\\   \e[1;30m|' >> issue
echo -e '  \e[0;34m/_\x27        `_\\\  \e[1;30m|  \e[1;34m\\l' >> issue
echo -e '  \e[0m' >> issue

cp issue /etc/issue
cat /etc/issue
