# create_html

## Overview
create_html is a Shell script to be used to create simply a new html template file into the current directory.  
It writes the html code dynamically depending on the name of the file and what to include.

## Installation
> 1. git clone git://github.com/idealsite/silus-script.git
> 2. cd silus-script
> 3. su
> 4. cp create_html /usr/local/bin
> 5. chmod 755 /usr/local/bin/create_html
> 6. exit

## Usage
#### create_html is invoked as follows:  
    create_html [-h | --help] file_name [jquery jqueryui css_name]  
#### Parameters:  
    -h, --help    Display this help message and exit  
    file_name     The name of the html file you want to create
    jquery        Include jQuery in the html file [optional]
    jqueryui      Include jQuery User Interface in the html file [optional]
    css_name      The name of the external css file [optional]

## Examples
