#!/bin/sh

_split_line()
{
    line="$1"
    field=$(echo "$line" | sed -e 's/^"\(.*\)":"\?\(.*[^"]\)"\?$/\1/')
    value=$(echo "$line" | sed -e 's/^"\(.*\)":"\?\(.*[^"]\)"\?$/\2/')
    echo "$field" "$value"
}

_print_split_line()
{
    field="$1"; shift
    value="$@"

    case "$field" in
        subject) echo "$value" ;;
        id) echo " [#${value}]" ;;
        done_ratio) echo "${value}% complete" ;;
        description) echo "$value" ;;
    esac
}

_print_lines()
{
    while read line; do
        _print_split_line $(_split_line "$line")
    done
}


if [ -n `which jq` ]; then
    jq -r '@text "#\(.id): \(.subject) / \(.done_ratio)% complete.\n\n\(.description)"'
else

    sed -e 's/[{}]/''/g' \
        | awk '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' \
        | _print_lines

fi



