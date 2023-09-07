#!/bin/bash

# REF: https://stackoverflow.com/questions/44218327/how-can-i-change-a-video-frame-rate-with-ffmpeg-lossless-and-keeping-the-same-t

#If your video codec is H.264/5, then this two-step method works, and is lossless.

#1 Demux to raw bitstream
#ffmpeg -i in.mov -c copy in.264
#2 Remux with new framerate
#ffmpeg -r 24 -i in.264 -c copy out.mov

# with extension .mov with or without the actual extension
in=$1

if [ -z $2 ];
then
	FR=30
else
	FR=$2
fi

name_in=$(basename ${in} .mov)
name_out=${name_in}_FR30

movie_in=${name_in}.mov
movie_out=${name_out}.mov

#1 Demux to raw bitstream
ffmpeg -i $movie_in -c copy ${name_in}.264
#2 Remux with new framerate
ffmpeg -r $FR -i ${name_in}.264 -c copy ${movie_out}

rm ${name_in}.264
