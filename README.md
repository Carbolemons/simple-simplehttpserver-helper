# simple-simplehttpserver-helper
Simple functions to implement into .bashrc or .zshrc to make running the python process SimpleHTTPServer easier to use and kill

Once appended onto your respective shell, 

httphere [a port number]
  - will start a simple HTTP server bound to said port argument on localhost in the _CURRENT_ directory
  - creates a log file in the _CURRENT_ directory aswell
  - logs the process ID, as SimpleHTTPServer is executed as a background process with no hangup, so the terminal can be freely closed
  
killhttphere
  - if httphere has been executed in the current directory, it will end the process from the logged task id of python SimpleHTTPServer
  
## REQUIRES
This requires Python libraries to be installed on your machine, and all other Python doodads
A terminal, BASH, ZSH, whatever. I think the BASH one will work for most, but there was a weird quirk with ZSH that required double brackets

### Use cases!
Makes web dev simpler, if all you need to do is worry about aesthetics before implementing or pushing to a live server that has all the PHP and database bells and whistles. Obv, if you want to use PHP and DB stuff, you will need to set up an apache or nginx environment on your dev machine, but for now I wanted this and it works
