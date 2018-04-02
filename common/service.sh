#!/system/bin/sh

# Copyright EarlyMon @ XDA 2018 March 15

# Usage: no arguments (see what I mean?)
# Run at init, late service, in a Magisk module

# Creative Commons Attribution-ShareAlike (CC BY-SA) 
# Comparable to the GPL, used by Wikipedia
# Free to reuse and build derivatives, just credit me forever
# and license your derivatives under the same terms

# This script is designed to be a universal swap assassin
# Yes, that includes zram, zram is just one type of swapregion
# But it's not limited to only zram
# And it's not limited to just a single swapregion
# The swapregion(s) must be block or logical device(s)
# swapoff is required, toybox version is fine
# awk is required, toybox is ok if it has it

# Returns
#   0 - no swap, or no swap in /dev, or time's up

# Exit if no swap in use,
#   wish virtual beer upon the enlightened rom devs

alias SWAPT='grep -i SwapTotal /proc/meminfo | tr -d "[a-zA-Z :]"'

TL=45
Step=3
k=0

while [ `SWAPT` -eq 0  ]
do
    k=$(( $k + $Step ))
    if [ $k -gt $TL  ] ; then
        exit 0
    fi
    sleep $Step
done

SR="\/dev\/"
PS="/proc/swap*"

if [ -f /system/bin/swapoff ] ; then
    SO="/system/bin/swapoff"
else
    SO="swapoff"
fi

# You would think that there's only ever zram0
# And you would be wrong
# Samsung had a different method at least once (vmswap) 
# HTC used four zram swap partitions at least once
# They can't even all agree if it's swap or swaps in /proc
# Find all swapregions and target each one for swapoff
# Don't assume it's in the first field of swaps, find it

DIE=`awk -v SBD="$SR" ' $0 ~ SBD {
      for ( i=1;i<=NF;i++ )
        {
          if ( $i ~ ( "^" SBD ) )
           {
              printf "%s;", $i
           }
        }
      }' $PS`

saveifs=$IFS
IFS=';'

# I could have put all this in awk and just eval'd it 
# But where's the fun in that

for i in $DIE
do
    case $i in
        *zram*)
              j=`echo $i | sed 's/.*zram//'`
             ( ( 
                 echo $j > /sys/class/zram-control/hot_remove
                 echo 1 > /sys/block/zram${j}/reset
                 $SO $i
              ) & )
              ;;
        *)
              if [ -n $i ]; then
                  ( ( $SO $i ) & ) 
              fi
              ;;
    esac
done

IFS=$saveifs

# Enjoy a better Android experience, and be kind to someone

exit 0
