# htmlcreate

<!--## Overview-->
<!--htmlcreate is a Shell script for the laziest people.-->
<!--It can be used to create without spending a lot of time a new html template file into the current directory.  -->
<!--It writes the html code dynamically depending on the name of the file and what to include.-->

<!--## Installation-->
<!--> 1. git clone git://github.com/idealsite/create_html.git-->
<!--> 2. cd create_html-->
<!--> 3. su-->
<!--> 4. cp create_html /usr/local/bin-->
<!--> 5. chmod 755 /usr/local/bin/create_html-->
<!--> 6. exit-->

<!--## Usage-->
<!--#### create_html is invoked as follows:  -->
<!--    create_html [-h | --help] file_name [jquery jqueryui css_name]  -->
<!--#### Parameters:  -->
<!--    -h, --help    Display this help message and exit  -->
<!--    file_name     The name of the html file you want to create-->
<!--    jquery        Include jQuery in the html file [optional]-->
<!--    jqueryui      Include jQuery User Interface in the html file [optional]-->
<!--    css_name      The name of the external css file [optional]-->

<!--## Examples-->
<!--    create_html new_page jquery newstyle.css-->
<!--    create_html nicePage.html jqueryui BadStYlE-->
<!--    create_html test jqueryui jquery style-->
