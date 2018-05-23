# Startscript for Bungeecord and several Minecraft Servers.
A customizable, little script to start your bungeecord &amp; minecraft servers.

[Click here to get the raw script](https://raw.githubusercontent.com/lollilol/mc_bungee_startscript/master/startscript.sh)

# How to use:

+ Connect to your VPS via SSH.
+ Go to the directory where you want to download the file
+ Type in `wget https://raw.githubusercontent.com/lollilol/mc_bungee_startscript/master/startscript.sh`
+ Customize it with `nano startscript.sh`
+ make it runnable with `chmod a+x startscript.sh`
+ done.

or just paste this: `cd && wget https://raw.githubusercontent.com/lollilol/mc_bungee_startscript/master/startscript.sh && nano startscript.sh && chmod a+x startscript.sh` into ssh.

Now you can use your startscript with `./startscript.sh (start|stop|restart|reload)`

## Autostart integration
+ Please make sure you have crontab/cron installed
+ Type in: `crontab -e`
+ you may have to choose your editor: i would recommend "nano"
+ now the crontab file is opened. scroll to the end of the file
+ now insert `@reboot /file/to/your/startscript.sh start`
+ done.

# Informations
+ You dont need anything like a start.sh in every minecraft folder. You only need an bungeecord & several minecraft folder(s).
+ Please make sure you have screen & java installed.
