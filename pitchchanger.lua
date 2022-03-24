-- pitchcontrol.lua
--
-- Version: 0.2.0
-- URL: https://github.com/FichteFoll/mpv-scripts
-- License: ISC

-- Commands for key bindings:
--
-- * script-message-to pitchcontrol increase
--     Increase pitch by one half-tone. Bound to Ctrl+].
-- * script-message-to pitchcontrol decrease
--     Increase pitch by one half-tone. Bound to Ctrl+[.
-- * script-message-to pitchcontrol toggle
--     Toggle pitching.
-- * script-message-to pitchcontrol set_halftone_pitch <number>
--     Sets pitch to <number> half-tones - positive, negative or 0.


-- Copyright 2016-2017 FichteFoll
--
-- Permission to use, copy, modify, and/or distribute this software for any
-- purpose with or without fee is hereby granted, provided that the above
-- copyright notice and this permission notice appear in all copies.
--
-- THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
-- WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
-- MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
-- SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-- WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-- ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
-- IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


 utils = require 'mp.utils'
 msg = require('mp.msg')
 options = require('mp.options')
 script_name = mp.get_script_name() -- "pitchcontrol"


 RUBBERBAND_LABEL = string.format("rb", script_name)

 current_pitch = 0
 active = true


function set_halftone_pitch(pitch, activate)
    if activate == nil then
        activate = true
    end
    pitch = tonumber(pitch)
     pitch_scale = pitch /100 +1
	
    if active then
        mp.command(("af add @%s:rubberband=pitch-scale=%s"):format(RUBBERBAND_LABEL, pitch_scale))
        active = true
    else
        mp.osd_message(("'%s' is inactive"):format(script_name))
        return
    end

    current_pitch = pitch

    -- output new pitch
    mp.osd_message(("Pitch: %+d"):format(pitch))
end


function increase_handler()
    set_halftone_pitch(current_pitch + 1, false)
end


function decrease_handler()
    set_halftone_pitch(current_pitch - 1, false)
end


mp.add_key_binding("Ctrl+[", 'increase', decrease_handler)
mp.add_key_binding("Ctrl+]", 'decrease', increase_handler)
mp.register_script_message('set_halftone_pitch', set_halftone_pitch)
