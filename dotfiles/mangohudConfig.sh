#!/usr/bin/env sh
mangohudConfig(){
    mkdir -p $HOME/.config/MangoHud
    criarArqv2 '### pre defined presets
# -1 = default
#  0 = no display
#  1 = fps only
#  2 = horizontal view
#  3 = extended
#  4 = high detailed information
preset=3
### VSync [0-3] 0 = adaptive; 1 = off; 2 = mailbox; 3 = on
vsync=1
### OpenGL VSync [0-N] 0 = off; >=1 = wait for N v-blanks, N > 1 acts as a FPS limiter (FPS = display refresh rate / N)
gl_vsync=0
### Change toggle keybinds for the hud & logging
# toggle_hud=Shift_R+F12
# toggle_hud_position=Shift_R+F11
# toggle_fps_limit=Shift_L+F1
# toggle_logging=Shift_L+F2
# reload_cfg=Shift_L+F4
# upload_log=Shift_L+F3
###
fps_limit=0+24+30+48+60+75+120
fps_limit_method=early
gpu_stats
cpu_stats
fps
frametime
throttling_status
frame_timing
text_outline' "$HOME/.config/MangoHud/MangoHud.conf"
}