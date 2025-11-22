function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

# No greeting
set fish_greeting
nitch

starship init fish | source

alias s 'yay -Ss'
alias i 'yay -S'
alias r 'yay -R'
alias u 'sudo pacman -Syu'
alias gc 'git clone'
