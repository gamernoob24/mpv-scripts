### [pitchchanger](./pitchchanger.lua) for mpv

Control audio pitch by 0.01.
<kbd>Ctrl+]</kbd> increases,
<kbd>Ctrl+[</kbd> decreases,
Reset audio pitch 
<kbd>Ctrl+ENTER</kbd>


## Installation

Download the file or use this command

```bash
curl -s -o pitchchanger.lua https://github.com/gamernoob24/pitchchanger/raw/master/pitchchanger.lua
```
put them in the <kbd>~/.config/mpv/scripts</kbd>

and add this line to mpv.conf

<kbd>af=@rb:rubberband</kbd>

## some notes
finaly implemented the reset pitch
but it goes back to the pitch that was set before
