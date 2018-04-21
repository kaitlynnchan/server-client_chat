//2017-10-11

import processing.net.*;

Server myServer;

String myMsg, theirMsg, myMsglog;
float myx, myy, theiry;
//ArrayList<History> log;

void setup() {
  size(400, 600);
  myServer = new Server(this, 1234);
  myMsg = "Server: ";
  theirMsg = "";
  background(0);
  myy = height - 50;
}

void draw() {
  background(0);

  Client c = myServer.available();
  if ( c != null) {
    theirMsg = c.readString();
    println(theirMsg);
  }

  textSize(25);
  text(myMsg, 10, myy, 390, height - 50);
  text(theirMsg, 10, theiry, 390, height - 50);
  //text(myMsglog, 10, myy - theiry, 390, height - 50);
  theiry = myy - 50;
  
  //if(myServer.write(myMsg)){
    
  //}
}

void keyTyped() {
  if (key == ENTER && myMsg.length() != 8) {
    myServer.write(myMsg);
    myMsg = "Server: ";
    //background(0);
    //myMsglog = (myMsg);
  } else if (key == BACKSPACE && myMsg.length() > 8) {
    myMsg = myMsg.substring(0, myMsg.length()-1);
  } else if (key != BACKSPACE) {
    myMsg = myMsg + key;
  }

  //checking for symbols
  //if (key == 'A');
}