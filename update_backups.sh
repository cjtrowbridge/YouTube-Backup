#!/bin/bash

# Make sure software is up to date
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
sudo yt-dlp -U

file=$(cat channels.txt)
for channel in $file
do
    echo "Updating Local Copy Of Channel: $channel"
    yt-dlp --merge-output-format mkv \
    -f 22 \
    --verbose --all-subs --embed-subs \
    -ciw -o '%(uploader)s/%(playlist)s/%(title)s.%(ext)s' "$channel"
done
