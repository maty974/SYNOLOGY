# SYNOLOGY


##### **All** scripts that will be made by wuseman is licensed under GPL Version 3 under this repository, feel free to share the cheatsheet anywhere & anytime

##### A notice to all nerds. If you will copy the wiki and steal the real developers work will not make you a hacker.

#### Be careful, some commands may wipe DATA so read carefully please.


##### Install various packages on your Synology NSA via OPKG:

![Screenshot](misc/synology-opkg.gif)


# CHEATSHEET

#### Print general info:

      synoservice --status

#### Setup mail via cli:

      synosyslogmail

#### Check upgrades:

      synoupgrade --check 3

#### Dump data about your nas:

     syno_system_dump

#### Print network info:

     synonet --show

#### Reset your Synology NAS (Settings Only)

     /usr/syno/sbin/./synodsdefault --reset

#### Reset your Synology Nas to Factory Default (OBS OBS OBS ALL DATA WILL BE WIPED)

     /usr/syno/sbin/./synodsdefault --factory-default

#### Reinstall your Synology Nas Station, all data will be kept:

     /usr/syno/sbin/./synodsdefault --reinstall; reboot

#### The proper way to restart SSHD of your NAS via cli:

     synoservicectl --restart sshd

#### List, uninstall or install a .spk package file (available locally)

      synopkg

#### Install a set a networking and ELF binary debugging tools (and drop into a root session)

     synogear

#### Write and read an .ini style file with lines of key=value pairs

     synosetkeyvalue
     synogetkeyvalue

#### Shut down and power off the NAS (much like shutdown -h now)

     synopoweroff

#### Show installed packages

     synopkg list | sed 's/: .*$//' 

#### Uninstall a package

     sudo synopkg uninstall 

#### Synology Shutdown and Poweroff Too

     syno_poweroff_task

#### Set/establish password to local user

     synoauth local_username password

#### Manage IP autoblock feature

     synoautoblock OPTIONS 

#### Manage blog feature

     synoblog_backup [-r|-b] p [-u username] [-o]

#### Synology disk control device: something like /dev/hda or /dev/sda

     syno_disk_ctl OPTIONS DEVICE  

#### Synology clear .tbd-File Tool

     SYNOClearTdb FILE 

#### Different ways to print various info about your NAS

     more /etc.defaults/VERSION 
     cat /etc/synoinfo.conf
     cat /proc/cmdline
     synoshare --enum ALL 
     synonet --show 
     synodisk --enum 
     synospace --enum -a 

#### Restart index

     synoservicectl --restart synoindexd

#### Check for upgrades

     sudo synoupgrade --check

#### Restart webserver

     /usr/syno/sbin/synoservicecfg --restart httpd-user 
     /usr/syno/sbin/synoservicectl --restart pkgctl-WebStation

#### Generate a list for what you can control

     /usr/syno/sbin/synoservice --list

#### DSM API - Provide DSM information

     syno dsm getInfo --pretty 

#### File Station API - Provide File Station information

     syno fs getInfo --pretty 

#### File Station API - Enumerate files in a given folder

     syno fs listFiles --payload '{"folder_path":"/path/to/folder"}' --pretty 

#### Download Station API - List download tasks

     syno dl listFiles --payload '{"limit":5, "offset":10}' --pretty 

#### Download Station API - Create a download task

     syno dl createTask --payload '{"uri":"https://link"}'

#### Audio Station API - Search a song

     syno as searchSong --payload '{"title":"my_title_song"}' --pretty

#### Video Station API - List movies

     syno vs listMovies --payload '{"limit":5}' --pretty

#### Video Station DTV API - List channels

     syno dtv listChannels --payload '{"limit":1}' --pretty 

#### Surveillance Station API - Get camera information

     syno ss getInfoCamera --payload '{"cameraIds":8}' --pretty 

#### Restart, enable, stop samba

     /usr/syno/etc/rc.sysv/S80samba.sh --help

#### Get synology date

     synodate --getSysDate

#### Printer stuff

    synoprint

#### Update index older

    indexfolder --type={SHARE_CREATE|SHARE_REMOVE} --share=<SHARED_FOLDER> --share_path=<SHARED_FOLDER>

#### Start mediaserver

    /usr/syno/bin/mediaserver.sh start

#### CAREFUL, KILLING NAS

    servicetool --get-service-volume download 

#### Get 2FA key if lost

    ssh root@nas cat /usr/syno/etc/preference/wuseman/google_authenticator

#### List disk info on a very fancy way

    dhm_tool -s 
