# Swap Torpedo - A Magisk Module

## Universal swap (zram, vmswap, etc etc) destroyer - run faster and more reliably!

By EarlyMon - version 1.0

Swap is a way to expand your RAM using clever software and some unused storage space. You see it a lot in Android as zram or vmswap.

Swap is a fine thing for desktops with sufficient resources and for Android devices really hampered with too little ram.

It was originally intended for devices with less than 1 GB RAM. 

If you have an Android One or another small-memory device, this is NOT the module for you. 

But if you have 2 GB of RAM or more, you want this. 

Do you suffer from lag, random UI pauses, apps not running correctly and consistently, and background apps failing even when you have them marked for protection? Do you have to reboot every day or so to restore speed? 

All of that is 
almost always caused by having swap implemented and the Swap Torpedo fixes it. 

Manufacturers, including Google, have fallen in love with swap because it allows your Android to synthetically appear better at multitasking. In reality, it ruins multitasking. 

Why? For large memory devices you want the swap space to be at minimum the square root of your RAM size and ideally the same size as, or up to double the size of, your RAM. 

The problem is that they don't use enough space because they can't - they're basically using a compressed RAM disk as a swap partition. 

If you think about that, it will raise the right questions. 

Does it make sense to use RAM for something other than apps and the operating system? Does it make sense to constantly have the operating system pause while it shuffles and reorganizes your RAM? Does it make sense for you to wait on everything while various pieces of RAM are getting zipped and unzipped to support this scheme? Does it make sense to do all of that incorrectly in the first place because you can't get enough swap space to properly support multitasking, by design? 

No. No it does not. 

Swap Torpedo is the answer. 

I designed it to be universal for any Android that Magisk version 16 and above supports. If you're not using swap, or if you installed your own swap solution that writes to a special file in storage, Swap Torpedo harmlessly does nothing. 

Verify your swap situation with [RAM Truth](https://play.google.com/store/apps/details?id=sa.ramtruth) available on the Play Store. It's free and it will never spy on you or ask for special permissions.

Donations are humbly and gratefully received at EarlyMonAF@gmail.com but not expected. My personal reward is knowing that I helped and you are having a better day now. 

This module was developed entirely on an honor View 10. 


Changelog - 

v1.0 - 2018 March 17 -  initial release 
