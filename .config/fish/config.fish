if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cl="clear"
alias lgit="lazygit"
alias ldocker="lazydocker"
alias conf="z ~/.config"
alias nixos="z /etc/nixos"
alias store="z /nix/store"
alias nswitch="sudo nixos-rebuild switch --flake /etc/nixos#bagage"
alias nswitchu="sudo nix flake update --flake /etc/nixos --extra-experimental-features flakes --extra-experimental-features nix-command; and sudo nixos-rebuild switch --flake /etc/nixos#bagage --upgrade"
alias nsgc="sudo nix-store --gc; and sudo nix-collect-garbage -d; and sudo /run/current-system/bin/switch-to-configuration boot"

# NixOS
alias commitsetup="cd ~/linux-nixos-hyprland-config-dotfiles; and cp -r ~/.config/* ./home/.config; and cp -r /etc/nixos/* ./nixos; and lgit; and cd -"

# Runs Remnux cli in current directory
alias remnux='podman run --rm -it -u remnux -v "$(pwd)":/home/remnux/files -w /home/remnux/files remnux/remnux-distro:focal bash'

# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]
#   exec Hyprland
# end

set -gx EDITOR hx
set -gx VOLUME_STEP 5
set -gx BRIGHTNESS_STEP 5

set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.npm-packages/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.pub-cache/bin $PATH

set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line blink
set fish_cursor_visual underscore blink

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

if test -e /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
    alias brup="brew update; brew upgrade; brew upgrade --cask --greedy"
end

starship init fish | source
zoxide init fish | source
direnv hook fish | source
