#!/bin/bash
set -euo pipefail

CMD="${1:-status}"
DARKMODE="'prefer-dark'"
DARKDIR="$HOME/.local/share/dark-mode.d"
DARKSYMBOL=""
#LIGHTMODE="'prefer-light'"
LIGHTDIR="$HOME/.local/share/light-mode.d"
LIGHTSYMBOL=""
TEXT="$LIGHTSYMBOL"

function getcurrent() {
    if [[ -x $(type -p darkman) ]]; then
        CURRENT="'prefer-$(darkman get)'"
    else
        CURRENT=$(gsettings get org.gnome.desktop.interface color-scheme)
    fi
}

function runscripts() {
    local folder=$1

    for f in "$folder"/*.sh; do
        command "$f" >/dev/null 2>&1
    done
}

function renderjson() {
	# remove single-quotes from class
	CLASS=$(echo "$CURRENT" | tr -d "'")

	# return JSON payload
	printf '{"text": "%s", "tooltip": "%s", "class": "%s"}\n' "$TEXT" "$CURRENT" "$CLASS"
}

function parsecmd() {
    case "$CMD" in
        "toggle")
        if [[ -x $(type -p darkman) ]]; then
            darkman toggle
        else
    	    if [[ "$CURRENT" == "$DARKMODE" ]]; then
    	        runscripts "$LIGHTDIR"
    	    else
    	        TEXT="$DARKSYMBOL"
    	        runscripts "$DARKDIR"
    	    fi
    	fi
    	getcurrent
        ;;
        *)
        if [[ "$CURRENT" == "$DARKMODE" ]]; then
            TEXT="$DARKSYMBOL";
        fi
        ;;
    esac
}

getcurrent

parsecmd

renderjson
