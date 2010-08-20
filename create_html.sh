##### DATA #####
jquery_src='<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>'
jqueryui_src='<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js"></script>'
css_src_one='<link rel="stylesheet" type="text/css" href="'
css_src_two='">'
file="$1"
include_one="$2"
include_two="$3"
include_three="$4"
##### FUNCTIONS #####
function write_phrase() {
  phrase="$1"
  phraseLength="${#phrase}"
  lastLetter=`expr "$phraseLength" - 1`
  speed="$2"
  case $speed in
    1)
      speed=0.4
      ;;
    2)
      speed=0.2
      ;;
    3)
      speed=0.1
      ;;
    4)
      speed=0.05
      ;;
    5)
      speed=0.025
      ;;
  esac
  for (( i = 0 ; i < "$phraseLength" ; i++ )) ; do
    letter="${phrase:$i:1}"
    echo -n "$letter"
    sleep $speed
    if [ "$i" -eq "$lastLetter" ] ; then
      echo
    fi
  done
}
function check_ext() {
  spliced="$1"
  case "$2" in
    html)
      if [[ "$spliced" != *.html && "$spliced" != *.htm ]] ; then
        spliced="$spliced.html"
      fi
      echo "$spliced"
      ;;
    css)
      if [[ "$spliced" != *.css ]] ; then
        spliced="$spliced.css"
      fi
      echo "$spliced"
      ;;
  esac
}
function check_file() {
  if [ -s "$file" ] ; then
    if [ "$already_asked" ] ; then
      write_phrase "Replace it? (y/n)" "4"
    else
      write_phrase "The file already exists. Replace it? (y/n)" "4"
      already_asked="yeah"
    fi
    read "answer"
    case "$answer" in
      y|Y|yes)
        rm -rf "$file"
        touch "$file"
        ;;
      n|N|no)
        write_phrase "Tell me the new name." "4"
        read "file"
        create
        ;;
      *)
        write_phrase "Please answer yes (y) or no (n)" "4"
        create
        ;;
    esac
  else
    touch "$file"
  fi
}
function check_included() {
  case "$include_one" in
    jquery)
      include_one="$jquery_src"
      jquery_included="yeah"
      ;;
    jqueryui)
      include_one="$jqueryui_src"
      jqueryui_included="yeah"
      ;;
    ""|" ")
      ;;
    *)
      include_one=$(check_ext "$include_one" "css")
      touch "$include_one"
      include_one="$css_src_one$include_one$css_src_two"
      stylesheet_included="yeah"
      ;;
  esac
  case "$include_two" in
    jquery)
      if [ -z "$jquery_included" ] ; then
        include_two="$jquery_src"
        jquery_included="yeah"
      fi
      ;;
    jqueryui)
      if [ -z "$jqueryui_included" ] ; then
        include_two="$jqueryui_src"
        jqueryui_included="yeah"
      fi
      ;;
    ""|" ")
      ;;
    *)
      if [ -z "$stylesheet_included" ] ; then
        include_two=$(check_ext "$include_two" "css")
        touch "$include_two"
        include_two="$css_src_one$include_two$css_src_two"
        stylesheet_included="yeah"
      fi
      ;;
  esac
  case "$include_three" in
    jquery)
      if [ -z "$jquery_included" ] ; then
        include_three="$jquery_src"
        jquery_included="yeah"
      fi
      ;;
    jqueryui)
      if [ -z "$jqueryui_included" ] ; then
        include_three="$jqueryui_src"
        jqueryui_included="yeah"
      fi
      ;;
    ""|" ")
      ;;
    *)
      if [ -z "$stylesheet_included" ] ; then
        include_three=$(check_ext "$include_three" "css")
        touch "$include_three"
        include_three="$css_src_one$include_three$css_src_two"
        stylesheet_included="yeah"
      fi
      ;;
  esac
}
function print() {
  echo "<!doctype html>" >> "$file"
  echo "<html>" >> "$file"
  echo "<head>" >> "$file"
  echo "  <title></title>" >> "$file"
  if [ "$include_one" ] ; then
    echo "  $include_one" >> "$file"
  fi
  if [ "$include_two" ] ; then
    echo "  $include_two" >> "$file"
  fi
  if [ "$include_three" ] ; then
    echo "  $include_three" >> "$file"
  fi
  echo "</head>" >> "$file"
  echo >> "$file"
  echo "<body>" >> "$file"
  echo "  " >> "$file"
  echo "</body>" >> "$file"
  echo "</html>" >> "$file"
}
function create() {
  if [ ! "$file" ] ; then
    write_phrase "I can't create a no-name file. Tell me the name." "4"
    read "file"
    create
  fi
  file=$(check_ext "$file" "html")
  check_file
  check_included
  print
}
##### MAIN #####
create
exit 0
