fzf_base_dir='/usr/local/Cellar/fzf/0.18.0'

if [[ ! -z $fzf_base_dir ]]; then
    set -o vi
    # Options to fzf command
    export FZF_COMPLETION_OPTS='+c -x'
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    # Use fd (https://github.com/sharkdp/fd) instead of the default find
    # command for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
        fd --hidden --follow --exclude ".git" . "$1"
    }

      # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
        fd --type d --hidden --follow --exclude ".git" . "$1"
    }

    if [[ -z $fzf_no_completion ]]; then
        source $fzf_base_dir/shell/completion.zsh
    fi
    if [[ -z $fzf_no_bindings ]]; then
        source $fzf_base_dir/shell/key-bindings.zsh
    fi
fi

