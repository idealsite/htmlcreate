#!/bin/bash

file="$1"
css="$2"
script="$3"
css_before='<link rel="stylesheet" type="text/css" href="'
css_after='"/>'
script_before='<script type="text/javascript" src="'
script_after='"></script>'

function check_ext() {
  local name="$1"
  case "$2" in
    html)
      if [[ "$name" != *.html && "$name" != *.htm && "$name" != *.php ]] ; then
        name="$name.html"
      fi
      echo "$name"
      ;;
    js)
      if [[ "$name" != *.js ]] ; then
        name="$name.js"
      fi
      echo "$name"
      ;;
    css)
      if [[ "$name" != *.css ]] ; then
        name="$name.css"
      fi
      echo "$name"
      ;;
  esac
}

function show_help() {
  clear
  cat << HELP

htmlcreate is invoked as follows:
  htmlcreate [-h | --help] file_name [css js_script]
  (Parameters in the square brackets are optional)
Parameters:
  -h, --help    Displays this help message and exit
  file_name     The name of the html or php file you want to create
  css           The dir/name of the external css file [optional]
  js_script     The dir/name of the js script you want to include [optional]

HELP
}

function check_file_type() {
  case "$1" in
    *.php|*.htm)
        local type=4
        ;;
    *.html)
        local type=5
        ;;
  esac
  echo "$type";
}

function check_file() {
  if [ -s "$file" ] ; then
    echo "Replace it? (y/n)"
    read "answer"
    case "$answer" in
      y|Y|yes|Yes|YES)
        rm -rf "$file"
        touch "$file"
        ;;
      n|N|no|No|NO)
        echo "Tell me the new name."
        read "file"
        create
        ;;
      *)
        echo "Please answer yes (y) or no (n)."
        check_file
        ;;
    esac
  else
    touch "$file"
  fi
}

#function check_css() {

#}

#function check_script() {

#}

function print() {
  local type=$(check_file_type "$file")
  title=${file:0:`expr ${#file} - $type`}
  first_char=${title:0:1}
  first_char=${first_char^^}
  title=$first_char${title:1}
  echo "<!doctype html>" >> "$file"
  echo "<html>" >> "$file"
  echo "<head>" >> "$file"
  echo "  <title>$title</title>" >> "$file"
#
#
#
  echo "</head>" >> "$file"
  echo >> "$file"
  echo "<body>" >> "$file"
  echo "  ">> "$file"
  echo "</body>" >> "$file"
  echo "</html>" >> "$file"
}

function create() {
  if [[ "$file" = "-h" || "$file" = "--help" ]] ; then
    show_help
  elif [ ! "$file" ] ; then
    echo "I can't create an unnamed file. Tell me the name."
    read "file"
    create
  else
    file=$(check_ext "$file" "html")
    check_file
    print
  fi
}

create
exit 0
