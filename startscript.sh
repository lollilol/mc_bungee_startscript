#!/bin/sh

##variables
#location of bungeecord and minecraft servers
bungee=/home/minecraft/bungeecord/
mc1=/home/minecraft/lobby/
mc2=/home/minecraft/bedwars/
mc3=/home/minecraft/survival

##screen
#names
bungee_name=bungeecord
mc1_name=lobby
mc2_name=bedwars
mc3_name=survival
#RAM
# usage 
# 1 Gigabyte, write: 1G
# 1 Gigabyte in Megabyte, write: 1024M
# 512 Megabyte, write: 512M
# 256 Megabyte, write: 256M
# etc..

ram_server1=1G
ram_server2=1G
ram_server3=2G

#no major changes beyond this line

name=`basename "$0"`
case "$1" in
start)
	cd $bungee && screen -AmdS $bungee_name java -jar BungeeCord.jar
	cd $mc1 && screen -AmdS $mc1_name java -Xms$ram_server1 -Xmx$ram_server1 -jar minecraft_server.jar nogui
	cd $mc2 && screen -AmdS $mc2_name java -Xms$ram_server2 -Xmx$ram_server2 -jar minecraft_server.jar nogui
	cd $mc3 && screen -AmdS $mc3_name java -Xms$ram_server3 -Xmx$ram_server3 -jar minecraft_server.jar nogui
	sleep 1
	echo "\033[32mBungeeCord and all Minecraft-Servers were started..\033[0m"
	;;
stop)
	screen -S $bungee_name -p 0 -X stuff "end^M"
	screen -S $mc1_name -p 0 -X stuff "stop^M"
	screen -S $mc2_name -p 0 -X stuff "stop^M"
	screen -S $mc3_name -p 0 -X stuff "stop^M"
	sleep 1
	echo "\033[31mBungeeCord and all Minecraft-Servers were stopped..\033[0m"
	;;
reload)
	screen -S $bungee_name -p 0 -X stuff "greload^M"
	screen -S $mc1_name -p 0 -X stuff "reload^M"
	screen -S $mc2_name -p 0 -X stuff "reload^M"
	screen -S $mc3_name -p 0 -X stuff "reload^M"
	sleep 1
	echo "\033[31mBungeeCord and all Minecraft-Servers were reloaded..\033[0m"
	;;
restart)
	$0 stop
	$0 start
	;;
info)
	echo "\033[32m$bungee_screen\033[0m is in: \033[32m$bungee\033[0m"
	echo "\033[32m$mc1_screen\033[0m server has \033[32m$ram_server1\033[0m Ram. [\033[32m$mc1\033[0m]"
	echo "\033[32m$mc2_screen\033[0m sserver has \033[32m$ram_server2\033[0m Ram. [\033[32m$mc2\033[0m]"
	echo "\033[32m$mc3_screen\033[0m server has \033[32m$ram_server3\033[0m Ram. [\033[32m$mc3\033[0m]"
	;;
*)
	echo "\033[31mUsage: './$name (start|stop|restart|reload|info)'\033[0m"
	;;
esac
exit 0
