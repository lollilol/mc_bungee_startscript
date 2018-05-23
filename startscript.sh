#!/bin/sh

#name of the startscript
name=startscript.sh

case "$1" in
start)
	cd /home/minecraft/bungeecord/ && ./start.sh
	cd /home/minecraft/lobby/ && ./start.sh
	cd /home/minecraft/bedwars/ && ./start.sh
	cd /home/survival/ && ./start.sh
	sleep 1
	echo "\033[32mBungeeCord and all Minecraft-Servers were started..\033[0m"
	;;
stop)
	screen -S bungee -p 0 -X stuff "end^M"
	screen -S lobby -p 0 -X stuff "stop^M"
	screen -S bedwars -p 0 -X stuff "stop^M"
	screen -S survival -p 0 -X stuff "stop^M"
	sleep 1
	echo "\033[31mBungeeCord and all Minecraft-Servers were stopped..\033[0m"
	;;
reload)
	screen -S bungee -p 0 -X stuff "greload^M"
	screen -S lobby -p 0 -X stuff "reload^M"
	screen -S bedwars -p 0 -X stuff "reload^M"
	screen -S survival -p 0 -X stuff "reload^M"
	sleep 1
	echo "\033[31mBungeeCord and all Minecraft-Servers were reloaded..\033[0m"
	;;
restart)
	$0 stop
	$0 start
	;;
*)
	echo "\033[31mUsage: './$name (start|stop|restart|reload)'\033[0m"
	;;
esac
exit 0
