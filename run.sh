# export DISPLAY=172.17.160.1:0
ORICUTRON_PATH="/mnt/c/Users/plifp/OneDrive/oric/oricutron_wsl/oricutron"

cl65 -ttelestrat example/pbar.c pbar.lib -o pbar
cp pbar $ORICUTRON_PATH/sdcard/bin


cd $ORICUTRON_PATH
./oricutron
cd -

