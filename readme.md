# htmlcreate

## Overview
htmlcreate is a Shell script for the laziest people.

It can be used to create without spending a lot of time a new html or php file.

It writes the code dynamically depending on  what to include (css or js files).

## Installation
1. git clone git://github.com/idealsite/htmlcreate.git
2. cd htmlcreate
3. su
4. chmod 755 htmlcreate.sh
5. cp htmlcreate.sh /usr/local/bin/htmlcreate
6. exit

## Usage
#### htmlcreate is invoked as follows:
    htmlcreate [-h | --help] file_name [css js_script]
#### Parameters:
    -h, --help    Displays this help message and exit
    file_name     The dir/name or the name of the html or php file you want to create
    css           The dir/name or the name of the external css file [optional]
      if you want to include a script without including a css, set this to "none"
    js_script     The dir/name or the name of the js script you want to include [optional]

## Examples
    htmlcreate index.php style.css script.js
    htmlcreate ProPage ProStyle ProScript
    htmlcreate newpage.htm none newscript.js
