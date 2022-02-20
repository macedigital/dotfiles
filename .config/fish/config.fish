# always set private mode
set -g fish_private_mode private

if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -d ~/.local/bin
        fish_add_path ~/.local/bin
    end
end

if status is-login
    # Commands to run in login sessions can go here
end
