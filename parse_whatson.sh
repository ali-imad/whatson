#!/bin/bash

compact=false
time_only=false
name_only=false
while getopts "ctnh" opt; do
    case $opt in
        c) compact=true ;;
        t) time_only=true ;;
        n) name_only=true ;;
        *) echo "Usage: $0 [-c] [-t] [-n]" >&2
           echo "  -c  Compact output (one line)" >&2
           echo "  -t  Time only" >&2
           echo "  -n  Name only" >&2
           echo "  -h  Help" >&2
           exit 1 ;;
    esac
done

page=$(curl -s "https://whatsonnow.criterionchannel.com/")

title=$(echo "$page" | grep -o '<[^>]*class="whatson__title"[^>]*>[^<]*<' | \
    sed 's/<[^>]*>//g' | sed 's/<.*//' | grep -v '^$' | sort -u)

time=$(echo "$page" | grep -o 'class="whatson__eyebrow--bold">[^<]*' | \
    sed 's/.*>//' | \
    grep -E '(minute)' | head -n 1)

# Output based on flags
if $name_only; then
    echo "$title"
elif $time_only; then
    echo "$time"
elif $compact; then
    echo "$title - Next film starts in: $time"
else
    echo "$title"
    echo "Next film starts in: $time"
fi
