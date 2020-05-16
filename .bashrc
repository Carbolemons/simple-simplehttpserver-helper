#Custom Functions
httphere() {
PORT=$1
if [ "$1" == "" ]
    then
        echo "Please specify port number to run the server on"
    else
	echo "There is now an HTTP server on localhost:$PORT\n\npython -m SimpleHTTPServer $PORT is now running in the background\n\n$PWD is the current webroot\n\nAll STDOUT from SimpleHTTPServer is redirected to \n$PWD/SimpleHTTPServer.log"  
	nohup python -m SimpleHTTPServer $PORT &>>SimpleHTTPServer.log &
	LASTHTTPSERVERTASKID=$!
	echo "$LASTHTTPSERVERTASKID" > .httphereprocess 
	echo "\nIf you want to end the server, \"killhttphere\" if you want to kill a server that is in this directory\n  Or, you may do \"kill -9 $LASTHTTPSERVERTASKID\" if you wish to do this manually"
fi
}
killhttphere() {
if [ -f $PWD/.httphereprocess ]
    then
	kill -9 $(< $PWD/.httphereprocess)
	echo "kill -9 $(< $PWD/.httphereprocess)"
	echo "Please remember to check if the server has shutdown properly :)"
	rm $PWD/.httphereprocess
    else
	echo "There _could_ be no running webroot in this directory. if the process is still running, find the python task and manually kill it."
fi
}

phphere() {
PORT=$1
if [ "$1" == "" ]
    then
        echo "Please specify port number to run the server on for example: \'8080\'"
    else
        echo "There is now a PHP server on localhost:$PORT\n\n\"php -S 127.0.0.1:$PORT -t .\"  is now running in the background\n\n$PWD is the current webroot\n\nAll STDOUT from php is redirected to \n$PWD/PHPServer.log"
        nohup php -S 127.0.0.1:$PORT -t . &>>PHPServer.log &
        LASTPHPSERVERTASKID=$!
        echo "$LASTPHPSERVERTASKID" > .phphereprocess
        echo "\nIf you want to end the server, \"killphphere\" if you want to kill a server that is in this directory\n  Or, you may do \"kill -9 $LASTPHPSERVERTASKID\" if you wish to do this manually"
fi
}
killphphere() {
if [ -f $PWD/.phphereprocess ]
    then
        kill -9 $(< $PWD/.phphereprocess)
        echo "kill -9 $(< $PWD/.phphereprocess)"
        echo "Please remember to check if the server has shutdown properly :)"
        rm $PWD/.phphereprocess
    else
        echo "There _could_ be no running webroot in this directory. if the process is still running, find the python task and manually kill it."
fi
}
