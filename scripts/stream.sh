#!/bin/bash
# stream from URL with mpv and youtube-dl
mpv --ytdl-raw-options=format=bestvideo+bestaudio --loop=inf ${1} || mpv --loop=inf ${1}
