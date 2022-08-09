if status is-interactive
    # Commands to run in interactive sessions can go here
    oh-my-posh init fish --config ~/.config/oh-my-posh/themes/gruvbox.toml | source

    # Don't display a greeting when the shell starts
    set -g fish_greeting ""

    # Abbreviations
    ## Cargo
    abbr -ag c cargo
    abbr -ag cb cargo build
    abbr -ag cbr cargo build --release
    abbr -ag cr cargo run
    abbr -ag crr cargo run --release
    
    ## Git
    abbr -ag g git
    abbr -ag gs git status -su
    abbr -ag ga git add
    abbr -ag gaa git add -A
    abbr -ag gc git commit
    abbr -ag gca "git add -A && git commit"
    abbr -ag gco git checkout
    abbr -ag gst git stash
    abbr -ag gd git diff
    abbr -ag gds git diff --stat
    abbr -ag gl git log --oneline --graph
    abbr -ag gla git log --oneline --graph --branches --remotes --tags HEAD
    abbr -ag gll git log --graph

    ## Other
    abbr -ag cls "clear; printf '\e[3J'"

    # Environment Variables
    set -x EDITOR nvim

    # Zoxide
    zoxide init fish --cmd cd | source
    
    # Add cargo installs to path
    fish_add_path $HOME/.cargo/bin
end

