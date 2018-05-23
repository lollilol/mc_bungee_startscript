#!/bin/sh

#location of bungeecord and minecraft servers
bungee=/home/minecraft/bungeecord/
mc1=/home/minecraft/lobby/
mc2=/home/minecraft/bedwars/
mc3=/home/minecraft/survival

##screen
#names
bungee_screen=bungeecord
mc1_screen=lobby
mc2_screen=bedwars
mc3_screen=survival
#RAM
# usage 
# 1 Gigabyte, write: 1G
# 1 Gigabyte in Megabyte, write: 1024M
# 512 Megabyte, write: 512M
# 256 Megabyte, write: 256M
# etc..

ram_server1=1G
ram_server2=1G
ram_server3=1G

#no changes beyond this line

name=`basename "$0"`

case "$1" in
start)
	cd $bungee && screen -AmdS $bungee_screen java -jar BungeeCord.jar
	cd $mc1 && screen -AmdS $mc1_screen java -Xms$ram -Xmx$ram_server1 -jar minecraft_server.jar nogui
	cd $mc2 && screen -AmdS $mc2_screen java -Xms$ram -Xmx$ram_server2 -jar minecraft_server.jar nogui
	cd $mc3 && screen -AmdS $mc3_screen java -Xms$ram -Xmx$ram_server3 -jar minecraft_server.jar nogui
	sleep 1
	echo "\033[32mBungeeCord and all Minecraft-Servers were started..\033[0m"
	;;
stop)
	screen -S $bungee_screen -p 0 -X stuff "end^M"
	screen -S $mc1_screen -p 0 -X stuff "stop^M"
	screen -S $mc2_screen -p 0 -X stuff "stop^M"
	screen -S $mc3_screen -p 0 -X stuff "stop^M"
	sleep 1
	echo "\033[31mBungeeCord and all Minecraft-Servers were stopped..\033[0m"
	;;
reload)
	screen -S $bungee_screen -p 0 -X stuff "greload^M"
	screen -S $mc1_screen -p 0 -X stuff "reload^M"
	screen -S $mc2_screen -p 0 -X stuff "reload^M"
	screen -S $mc3_screen -p 0 -X stuff "reload^M"
	sleep 1
	echo "\033[31mBungeeCord and all Minecraft-Servers were reloaded..\033[0m"
	;;
restart)
	$0 stop
	$0 start
	;;
info)
	echo "\033[32m$bungee_screen\033[0m is in: \033[32m$bungee\033[0m"
	echo "\033[32m$mc1_screen\033[0m server is in: \033[32m$mc1\033[0m and has \033[32m$ram_server1\033[0m Ram."
	echo "\033[32m$mc2_screen\033[0m server is in: \033[32m$mc2\033[0m and has \033[32m$ram_server2\033[0m Ram."
	echo "\033[32m$mc3_screen\033[0m server is in: \033[32m$mc3\033[0m and has \033[32m$ram_server3\033[0m Ram."
	;;
*)
	echo "\033[31mUsage: './$name (start|stop|restart|reload|info)'\033[0m"
	;;
esac
exit 0
