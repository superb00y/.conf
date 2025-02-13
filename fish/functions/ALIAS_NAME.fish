function la
    ls -a $argv
end

function nv -d 'nv alias for nvim'
    nvim $argv
end

function h -d 'h alias for helix'
    helix $argv
end

function vi -d 'vi alias for vim'
    vim $argv
end

function y -d 'y alias for yazi'
    yazi $argv
end

function rg -d 'rg alias for ranger'
    ranger $argv
end

function ll -d 'ls with icons'
    eza --icons $argv
end

function lt -d 'tree with icons'
    eza --icons --tree $argv
end

function lt1 -d 'tree with icons one level'
    eza --icons --tree -L 1 $argv
end

function lt2 -d 'tree with icons one level'
    eza --icons --tree -L 2 $argv
end

function lla -d 'ls with icons'
    eza --icons -a $argv
end


function nvconf -d 'nvim config dir'
    cd ~/.config/nvim/
end

function hconf -d 'helix config dir'
    helix ~/.config/helix/
end

function aweconf -d 'awesome config dir'
    cd ~/.config/awesome/
end

function aweauto -d 'nvim awesome auto luncher dir'
    nvim ~/.config/awesome/base/auto.lua
end

function conf -d '~/.config dir'
    cd ~/.config/
end

function study -d '~/STUDY dir'
    cd ~/STUDY/
end

function dow -d '~/Downloads dir'
    cd ~/Downloads/
end

function pct -d '~/Pictures dir'
    cd ~/Pictures/
end

function std -d '~/STUDY dir'
    yazi ~/STUDY/l3/l3:s5/
end

function sct -d '~/STUDY dir'
    yazi ~/Pictures/Screenshots/
end

function ypfe -d 'yazi ../PFE dir'
    yazi ~/STUDY/l3/PFE
end

function pfe -d '../PFE dir'
    cd ~/STUDY/l3/PFE
end

function ythesis -d 'yazi ../PFE dir'
    yazi ~/STUDY/l3/THESIS
end

function thesis -d '../PFE dir'
    cd ~/STUDY/l3/THESIS
end


function doc -d '~/Documents dir'
    yazi ~/Documents/
end

function projects -d '~/PORJECT dir'
    cd ~/Projects/
end

function ankifill -d 'ankifill dir'
    cd ~/Projects/ankifill
end

function fldir -d flutter
    cd ~/Projects/flutter
end

function vision -d 'feh vision image'
    feh --bg-fill ~/Pictures/gimp/vision.png
end

function timetab -d 'feh time table'
    feh ~/Pictures/gimp/Timetable-wallpaper.png
end

function live -d 'live server'
    python -m http.server 8080
end
