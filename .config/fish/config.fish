# always set private mode
set -g fish_private_mode private
umask 0077

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
    # Commands to run in login sessions can go here
end
