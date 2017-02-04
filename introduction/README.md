# Introduction

This is `Testing C++ Qt GUI applications', version 0.1, a tutorial about testing C++ GUI applications written with Qt.

For now, I only consider Qt applications under GNU/Linux, as I use 'xdotool' to manipulate windows.

Goal is to reliably test Qt GUI applications.

## Tools used

### Qt

![The Qt logo](Qt_logo_2015.png)

Qt is a cross-platform C++ library to create GUIs.

###  xdotool

xdotool is a GNU/Linux command-line tool.

### LDTP

Linux Desktop Testing Project, a GUI testing suite.

###  Travis CI

![The Travis CI logo](TravisCI.png)

Travis CI is a continuous integration (hence the 'CI') tool.

## Screenshots

I think it is important to use screenshots.
I do sometimes modify these for clarity. 
Usually this involves sliding things together:

![Before](introduction_minimal_project_1_before.png)
![After](introduction_minimal_project_1_after.png)

## Files

Most folders contain

 * Code for a GUI application
 * build script of that application
 * testing script of that application
 * Documentation of that application

In each of these folders: 

 * The build script builds the application
 * The test scripts pass

