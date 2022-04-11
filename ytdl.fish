#!/bin/fish
function ytdled

  argparse -i 'v/video' 'u/url=' 's/start=' 'e/end=' 'o/output=' -- $argv

  command youtube-dl $_flag_url --extract-audio --audio-format mp3 -o "TEMPORARYDOWNLOAD.%(ext)s"
  if test $status != 0
    return
  end

  ffmpeg -i TEMPORARYDOWNLOAD.mp3 -ss $_flag_s -to $_flag_e -c copy $_flag_o
  rm TEMPORARYDOWNLOAD.mp3
end

ytdled $argv
