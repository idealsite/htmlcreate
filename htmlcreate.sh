#!/bin/bash

##### DATA #####

file="$1"
css="$2"
script="$3"
css_before='<link rel="stylesheet" type="text/css" href="'
css_after='"/>'
script_before='<script type="text/javascript" src="'
script_after='"></script>'

##### FUNCTIONS #####

function show_help() {
  clear
  cat << HELP

htmlcreate is invoked as follows:
  htmlcreate [-h | --help] file_name [css js_script]
Parameters:
  -h, --help    Displays this help message and exit
  file_name     The name of the html or php file you want to create
  css           The name of the external css file [optional]
    if you want to include a js script without including a css file, put this to "none"
  js_script     The name of the js script you want to include [optional]

HELP
}
function check_ext() {
  local name="$1"
  case "$2" in
    html)
      if [[ "$name" != *.html && "$name" != *.htm && "$name" != *.php ]] ; then
        name="$name.html"
      fi
      echo "$name"
      ;;
    css)
      if [[ "$name" != *.css ]] ; then
        name="$name.css"
      fi
      echo "$name"
      ;;
    js)
      if [[ "$name" != *.js ]] ; then
        name="$name.js"
      fi
      echo "$name"
      ;;
  esac
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
  file=$(check_ext "$file" "html")
  if [ -s "$file" ] ; then
    echo "The file already exists. Replace it? (y/n)"
    read "answer"
    case "$answer" in
      y|Y|yes|Yes|YES)
        rm -rf "$file"
        touch "$file"
        ;;
      n|N|no|No|NO)
        echo "Tell me the new name."
        read "file"
        check_file
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
function check_css() {
  if [[ "$css" != "none" ]] ; then
    yeah_css="Yeah"
    css=$(check_ext "$css" "css")
    if [ -s "$css" ] ; then
      echo "The css file alreay exists. Replace it? (y/n)"
      read "answer"
      case "$answer" in
        y|Y|yes|Yes|YES)
          rm -rf "$css"
          touch "$css"
          ;;
        n|N|no|No|NO)
          echo "Tell me the new name."
          read "css"
          check_css
          ;;
        *)
          echo "Please answer yes (y) or no (n)."
          check_css
          ;;
      esac
    else
      touch "$css"
    fi
  fi
}
function check_script() {
  if [ "$script" ] ; then
    script=$(check_ext "$script" "js")
    if [ -s "$script" ] ; then
      echo "The script file alreay exists. Replace it? (y/n)"
      read "answer"
      case "$answer" in
        y|Y|yes|Yes|YES)
          rm -rf "$script"
          touch "$script"
          ;;
        n|N|no|No|NO)
          echo "Tell me the new name."
          read "css"
          create
          ;;
        *)
          echo "Please answer yes (y) or no (n)."
          check_script
          ;;
      esac
    else
      touch "$script"
    fi
  fi
}
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
  if [ "$yeah_css" ] ; then
    echo "  $css_before$css$css_after" >> "$file"
  fi
  if [ "$script" ] ; then
    echo "  $script_before$script$script_after" >> "$file"
  fi
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
    check_file
    check_css
    check_script
    print
  fi
}

##### MAIN #####

create
exit 0
