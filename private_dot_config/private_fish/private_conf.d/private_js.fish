# setup javascript environment
set -gx NODE_REPL_HISTORY $XDG_DATA_HOME/node_repl_history
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

if type -q bun
    set -gx BUN_INSTALL $XDG_DATA_HOME/bun
end

if type -q deno
    set -gx DENO_INSTALL $XDG_DATA_HOME/deno
end

if type -q nvm
    set -gx NVM_DIR $XDG_DATA_HOME/nvm
end
