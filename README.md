Comic Builder
=============
This little web app lets users build a simple 3 picture comic strip.  Comic Strip Builder is created with Ruby on Rails with a dash of  JavaScript & JQuery and [TinyColorPicker](http://www.dematte.at/tinyColorPicker/).  The app was build in only 3.5 days as a project to learn how to develop applications.

Instructions
------------
View the webapp on Heroku: http://comic-builder.herokuapp.com/

To run locally, please do the following:
```
$ git clone https://github.com/Rob-rls/comic-builder.git
$ cd comic-builder/
$ rails s
```
* Then use your browser to navigae to http://localhost:3000/

![home](/Comic Builder.png)

Known Issues
------------
* The colour picker does not always load when creating or editing a comic.  To workaround this, refresh the page and the colour picker should be available when you click on the comic boarder.
* The comic view does not scale properly for mobile screens.

Contributors
------------
* Francesco Nunez - https://github.com/Frunez
* Karol Lebiedzinski - https://github.com/liskowsky
* Luke Cartledge - https://github.com/lukecartledge
* Robert Summers - https://github.com/Rob-rls
