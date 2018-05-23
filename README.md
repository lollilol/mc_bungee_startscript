# Startscript for Bungeecord and several Minecraft Servers.
A customizable, little script to start your bungeecord &amp; minecraft servers.

[Click here to get the raw script](https://raw.githubusercontent.com/lollilol/mc_bungee_startscript/master/startscript.sh)

# Overview
Features:
+ Start your Bungeecord & Minecraft Servers
+ You dont need any start.sh in your minecraft & bungeecord folders!

+ currently im supporting only Debian 8 with Java 8.

# How to use:

+ Connect to your VPS via SSH.
+ Go to the directory where you want to download the file
+ Type in `wget https://raw.githubusercontent.com/lollilol/mc_bungee_startscript/master/startscript.sh`
+ Customize it with `nano startscript.sh`
+ make it runnable with `chmod a+x startscript.sh`
+ done.

or just paste this: `cd && wget https://raw.githubusercontent.com/lollilol/mc_bungee_startscript/master/startscript.sh && nano startscript.sh && chmod a+x startscript.sh` into ssh.

Now you can use your startscript with `./startscript.sh (start|stop|restart|reload|info)`

# Required
+ screen (apt install screen)
+ java [How to install](debian8_java8.md)
+ 1 bungeecord server
+ several minecraft servers
+ yea! thats all!

## Autostart integration
+ Please make sure you have crontab/cron installed
+ Type in: `crontab -e`
+ you may have to choose your editor: i would recommend "nano"
+ now the crontab file is opened. scroll to the end of the file
+ now insert `@reboot /file/to/your/startscript.sh start`
+ done.
