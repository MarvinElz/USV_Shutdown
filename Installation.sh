#!bin/bash

echo 'Checken, ob wiringpi installiert ist'
#sudo apt-get install wiringpi
if ! dpkg -s 'wiringpi' >/dev/null 2>&1; then
	echo 'Installiere piringpi';
	sudo dpkg -i wiringpi-2.50-1.deb
fi

echo 'Compiliere Programm'
g++ USV_Shutdown.cpp -o USV_Shutdown -lwiringPi
echo 'Compilieren erfolgreich'

echo '#####################################################'
echo '##############       ACHTUNG          ###############'
echo '#####################################################'
echo 'Damit das Programm beim Systemstart ausgeführt wird,'
echo 'muss es in der Datei "/etc/rc.local" eingefügt werden.'
echo 'Dazu den Befehl "sudo nano /etc/rc.local" ausführen,'
echo 'und vor die Zeile "exit 0" folgende Zeile eintragen:'
echo 'sudo /home/pi/Desktop/USV_Shutdown &'
echo 'Dabei muss der Pfad zu der Datei mit dem Speicherort'
echo 'übereinstimmen. Speichern mit STRG + O und schließen'
echo 'des Editors mit STRG + X'
echo 'Das &-Zeichen am Ende der Zeile ist WICHTIG und muss'
echo 'mit in rc.local eingetragen werden.'
echo '#####################################################' 
