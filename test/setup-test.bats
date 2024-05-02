#!/usr/bin/env bats

setup() {
    test_dir=$(mktemp -d)
    pattern="^export PATH=.*(/.local/bin).*"
    original_home="$HOME"
    original_path="$PATH"

    ### Determine the shell rc file to be used.
    case "$SHELL" in
        */zsh)  shell_rc=".zshrc"  ;;
        */bash) shell_rc=".bashrc" ;;
    esac

    cd "$test_dir"
    mkdir mass-git
    cp "$BATS_TEST_DIRNAME/../setup.sh" "$test_dir"
    cp "$BATS_TEST_DIRNAME/../mass-git" "$test_dir/mass-git"
    echo 'export PATH="/usr/local/opt/curl/bin:/usr/local/sbin"' >> "$test_dir/$shell_rc"

    export HOME="$test_dir"
    ./setup.sh
}

teardown() {
    export HOME="$original_home"

    # For debugging purposes.
    #ls -la "$test_dir"

    rm -r "$test_dir"
}

@test "mass-git symlinked in ~/.local/bin/" {
    [ -L "$HOME/.local/bin/mass-git" ]
}
