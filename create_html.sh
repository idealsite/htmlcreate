jquery_src='<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>'
jqueryui_src='<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js"></script>'
css_src_one='<link rel="stylesheet" type="text/css" href="'
css_src_two='">'

file="$1"
include_one="$2"
include_two="$3"
include_three="$4"

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
  if [ "$already_asked" ] ; then
    echo "Replace it? (y/n)"
  else
    echo "The file already exist. Replace it? (y/n)"
    already_asked="yeah"
  fi
  read "answer"
  case "$answer" in
    y|Y|yes)
      rm -rf "$file"
      touch "$file"
      ;;
    n|N|no)
      echo "Tell me the new file name"
      read "file"
      create
      ;;
    *)
      echo "Please answer yes (y) or no (n)"
      create
      ;;
  esac
}

function create() {
  file=$(check_ext $file html)
  if [ -f "$file" ] ; then
    check_file
  else
    touch "$file"
  fi
}

create

case "$include_one" in
  jquery)
    include_one="$jquery_src"
    jquery_included="yeah"
    ;;
  jqueryui)
    include_one="$jqueryui_src"
    jqueryui_included="yeah"
    ;;
  *.css)
    check_file "$include_one"
    include_one=$css_src_one$include_one$css_src_two
    stylesheet_included="yeah"
    ;;
  *)
    
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
  *.css)
    if [ -z "$stylesheet_included" ] ; then
      check_file "$include_two"
      include_two=$css_src_one$include_two$css_src_two
      stylesheet_included="yeah"
    fi
    ;;
  *)
    
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
  *.css)
    if [ -z "$stylesheet_included" ] ; then
      check_file "$include_three"
      include_three=$css_src_one$include_three$css_src_two
      stylesheet_included="yeah"
    fi
    ;;
  *)
    
    ;;
esac

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

