#!/bin/sh

mu cfind \
  | sed 's/\([^ ]\+@[^ ]\+\)$/<\1>/' \
  | rofi -multi-select -dmenu \
  | perl -pe 'chomp if eof' \
  | tr '\n' ',' \
  | xclip -selection clipboard
