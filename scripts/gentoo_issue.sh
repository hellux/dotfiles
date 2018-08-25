echo -e '\e[0;35;40m                                           .                                ' > issue
echo -e '\e[0;35;40m     .vir.                                d$b                               ' >> issue
echo -e '\e[0;35;40m  .d$$$$$$b.    .cd$$b.     .d$$b.   d$$$$$$$$$$$b  .d$$b.      .d$$b.      ' >> issue
echo -e '\e[0;35;40m  $$$$( )$$$b d$$$()$$$.   d$$$$$$$b Q$$$$$$$P$$$P.$$$$$$$b.  .$$$$$$$b.    ' >> issue
echo -e '\e[0;35;40m  Q$$$$$$$$$$B$$$$$$$$P"  d$$$PQ$$$$b.   $$$$.   .$$$P´ `$$$ .$$$P´ `$$$    ' >> issue
echo -e '\e[0;35;40m    "$$$$$$$P Q$$$$$$$b  d$$$P   Q$$$$b  $$$$b   $$$$b..d$$$ $$$$b..d$$$    ' >> issue
echo -e '\e[0;35;40m   d$$$$$$P"   "$$$$$$$$ Q$$$     Q$$$$  $$$$$   `Q$$$$$$$P  `Q$$$$$$$P     ' >> issue
echo -e '\e[0;35;40m  $$$$$$$P       `"""""   ""        ""   Q$$$P     "Q$$$P"    "Q$$$P"       ' >> issue
echo -e '\e[0;35;40m  `Q$$P"                                  """                               ' >> issue
echo -e '\e[0;37;40m                                                                            ' >> issue

cp issue /etc/issue
cat issue
rm issue
