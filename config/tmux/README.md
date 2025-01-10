# README

`tmux` supports 256 colors you can see them by:
```
for i in {0..255}; do
    printf '\x1b[38;5;%dmcolour%d\x1b[0m\n' $i $i
done```

At the moment I'm fond of `kanagawa-dragon` and have configured those colors in `config/kitty/current-theme.conf`

There is an existing `tmux` theme for this here:
https://github.com/Nybkox/tmux-kanagawa/blob/master/scripts/colors.sh:
```
  # Kanagawa Dragon Color Pallette

    old_white='#c8c093'
	dragon_white='#c5c9c5'
	dragon_green='#87a987'
	dragon_orange_2='#b98d7b'
	dragon_gray_2='#9e9b93'
	dragon_gray_3='#7a8382'
	dragon_blue_2='#8ba4b0'
	dragon_violet='#8992a7'
	dragon_aqua='#8ea4a2'
	dragon_ash='#737c73'
	dragon_teal='#949fb5'
	dragon_yellow='#c4b28a'
	dragon_black_0='#0d0c0c'
	dragon_black_1='#12120f'
	dragon_black_2='#1D1C19'
	dragon_black_3='#181616'
	dragon_black_4='#282727'
	dragon_black_5='#393836'
	dragon_black_6='#625e5a'
```


Ideally I'd like to configure tmux to reference the colors already defined by the kitty config.

To do that I need to see the relationship between what the colors are called in this theme and how they are referenced in the theme.

Then I should be able to replace the references with globally named references that kitty can understand, and apply my kitty color settings to tmux components.


NVIM theme: https://github.com/rebelot/kanagawa.nvim/blob/master/lua/kanagawa/colors.lua
TMUX theme: https://github.com/Nybkox/tmux-kanagawa/blob/0d2db8d95e1b74643a06802043c7000a79ba0a0a/scripts/theme.sh

TMUX Theme                    HEX         Kitty Name
--------------------------------------------------------------
white=$old_white              #c8c093     Cursor, Selection_forgeround, Active_tab_foreground, color7 
gray=$dragon_black_4          #282727     Not used     
dark_gray=$dragon_black_2     #1D1C19     Not used
light_purple=$dragon_orange   #b98d7b     color17
dark_purple=$dragon_black_5   #393836     Not used
cyan=$dragon_teal             #949fb5     Not used
green=$dragon_ash             #737c73     Not used
orange=$dragon_yellow         #c4b28a     color3
red=$dragon_red               #c4746e     color1
pink=$dragon_orange           #b98d7b     color17
yellow=$dragon_yellow         #c4b28a     color3
