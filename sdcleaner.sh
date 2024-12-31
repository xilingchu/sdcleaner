#!/bin/bash
# Clean your Steam Deck!

helpFunction()
{
	echo "Usage of $0"
	echo "-h: Manual"
	echo "-d: Path to steam. Default path is $HOME/.local/share/Steam"
	echo "-w: Whitelist of games."
	echo "-c: Clean compatdata only."
	echo "-s: Clean shadercache only."
	exit 1
}

# Default Whitelist
wl=""

# Default Parameters
path="$HOME/.local/share/Steam"
is=1
ic=1

while getopts "hd:w:cs" opt
do
	case "$opt" in
		d ) path=$OPTARG ;;
		w ) wl=$wl" "$OPTARG ;;
		c ) is=0 ;;
		s ) ic=0 ;;
		? ) helpFunction ;;
	esac
done

# Check if path exists
[[ ! -d $path ]] && echo "Path $path does not exist!" && exit 1

# Check if path is a steam directory
[[ ! -d $path/steamapps ]] && echo "Path $path is not a steam directory!" && exit 1

# Check the whitelist and press any key to continue
echo "Whitelist: $wl"
read -n 1 -s -r -p "Press any key to continue or CTRL+C to exit."; echo

# List of compatdata and shadercache
[[ $ic == 1 ]] && ls_compatdata=`ls $path/steamapps/compatdata` || ls_compatdata=""
[[ $is == 1 ]] && ls_shadercache=`ls $path/steamapps/shadercache` || ls_shadercache=""

# Clean shadercache
[[ $is == 1 ]] && echo "Clean shadercache start!"
for i in $ls_shadercache
do
	[[ $wl =~ (^|[[:space:]])$i($|[[:space:]]) ]] || (echo Clean $i ; rm -rf $path/steamapps/shadercache/$i)
done
[[ $is == 1 ]] && echo "Clean shadercache end!"

# Clean compatdata
[[ $ic == 1 ]] && echo "Clean compatdata start!"
for i in $ls_compatdata
do
	[[ $wl =~ (^|[[:space:]])$i($|[[:space:]]) ]] || (echo Clean $i ; rm -rf $path/steamapps/compatdata/$i)
done
[[ $ic == 1 ]] && echo "Clean compatdata end!"
