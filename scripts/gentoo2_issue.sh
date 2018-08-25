echo -e '\e[35;40m                    ' > issue
echo -e '  __     _       _/"\\\\_   _     _  ' >> issue
echo -e '/`_ `\\\\ /`,\\\\ /""\\\\|_   _|/`_`\\\\ /`_`\\\\' >> issue
echo -e '\\\\_   //  _// /\\\\ \\\\ | | | |_| | |_| | ' >> issue
echo -e '/   / \\\\___\\\\|/  \\\\_|| |  \\\\___/ \\\\___/' >> issue
echo -e '\\\\__/ \e[0;1m\e[35;01mGentoo \e[0;1mLinux \e[0;40m\e[35;40m|_|\e[0;0m \\r :: \e[1m\\l' >> issue
echo -e '' >> issue
echo -e '\e[34m\\d' >> issue
echo -e '\e[0;0m' >> issue

cp issue /etc/issue
cat issue
rm issue
