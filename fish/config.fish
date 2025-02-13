if status is-interactive
    source ~/.config/fish/functions/ALIAS_NAME.fish

    set fish_greeting_timeout 0


    set fish_guess_type_guess false

    function fish_command_not_found
        echo "fish: command not found: $argv"
    end

    set fish_greeting
    set -x GOPATH "$HOME/go"
    set -x PATH "$PATH:$GOPATH/bin"
    set -x PATH "$HOME/tools/node-v14.15.4-linux-x64/bin:$PATH"
    set -x PATH "/home/superb00y/.local/bin:$PATH"
    set -x PATH "/home/superb00y/.cargo/bin:$PATH"
    set -x PATH "/root/.local/bin:$PATH"
    set -x PATH "$PATH:/home/$USER/.local/bin"

    set -x JAVA_HOME "/opt/jdk-21.0.2/"
    set -x PATH "$PATH:$JAVA_HOME/bin"

end

set -x MY_GROQ_API_KEY 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

# bun
set --export BUN_INSTALL "$HOME/.local/share/reflex/bun"
set --export PATH $BUN_INSTALL/bin $PATH
