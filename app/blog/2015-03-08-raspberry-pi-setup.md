---
title:  'Setting up my very first Raspberry Pi!'
created_at: '2015-03-08'
---

### The Equipment
1. Raspberry Pi 2 - [$35](http://www.mcmelectronics.com/product/83-16530)
1. SanDisk Extreme 16GB UHS-I/U3 Micro SDHC Memory Card - [$14](
http://www.amazon.com/gp/product/B00M55BX3G/)
1. Edimax EW-7811Un 150Mbps 11n Wi-Fi USB Adapter - [$9](
http://www.amazon.com/gp/product/B003MTTJOY)
1. AmazonBasics Wall Charger with USB Outlet - [$8](
http://www.amazon.com/gp/product/B005CG2ATQ)
1. Anker® 6ft / 1.8m Extra Long Premium Micro USB to USB Cable - [$5](
http://www.amazon.com/gp/product/B00MLP3JMS)
1. HDMI Cable
1. Monitor
1. Mouse
1. Keyboard

### Getting Started with Rasbian
1. Format Micro SD Card with [SD Formatter 4.0](
https://www.sdcard.org/downloads/formatter_4/)
1. [Download Raspbian Image](http://downloads.raspberrypi.org/raspbian_latest)
1. Load Raspbian Image onto Micro SD Card
  * Identify the disk with ```diskutil list```
  * Unmount the disk with ```diskutil unmountDisk /dev/<disk# from diskutil>```
  * Load Image onto SD Card with ```sudo dd bs=1m if=<path/to/2015-02-16-raspbian-wheezy.img> of=/dev/<disk# from diskutil>```
1. Plug in the equipment, but power cable last!!
1. Hopefully it all boots up... If not [http://www.raspberrypi.org/help/](
http://www.raspberrypi.org/help/)
1. Login with default credentials, login "pi", password "raspberry"

### First Things to do
1. raspi-config - ```sudo raspi-config```
  * Expand File System
  * Select suitable locale and keyboard
  * CHANGE USER PASSWORD :-)
1. [Setup Wifi!!](http://www.howtogeek.com/167425/how-to-setup-wi-fi-on-your-raspberry-pi-via-the-command-line/)
1. Touch up the screen resolution to fit your monitor, [see this](http://weblogs.asp.net/bleroy/getting-your-raspberry-pi-to-output-the-right-resolution)
1. Update & Upgrade
  * ```sudo apt-get update```
  * ```sudo apt-get disto-upgrade```
  * ```sudo rpi-update```
1. [Set Raspberry Pi's IP to be static](
http://elinux.org/RPi_Setting_up_a_static_IP_in_Debian)
1. Enable SSH-ing - ```sudo raspi-config``` -> Advanced Options -> SSH

### Questions or Comments?
Hit me up on twitter [@5280code](https://twitter.com/5280code)!
