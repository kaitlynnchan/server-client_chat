//2017-10-11

import processing.net.*;

Client myClient;

String myMsg, theirMsg, myMsgh;
float myy, theiry;

void setup(){
  size(400, 600);
  myClient = new Client(this, "127.0.01", 1234);
  myMsg = "Client: ";
  myMsgh = "Client: ";
  theirMsg = "";
  background(255);
  myy = height - 50;
}

void draw(){
  background(255);
  
  if(myClient.available() > 0){
    theirMsg = myClient.readString();
    println(theirMsg);
  }
  
  fill(0);
  textSize(25);
  text(myMsg, 10, myy, 390, height - 50);
  text(theirMsg, 10, theiry, 390, height - 50);
  text(myMsgh, 10, theiry - 50, 390, height - 50);
  theiry = myy - 50;
}

void keyTyped(){
  if(key == ENTER && myMsg.length() != 8){
     myClient.write(myMsg);
     myMsg = "Client: ";
     background(255);
  } else if (key == BACKSPACE && myMsg.length() > 8) {
    myMsg = myMsg.substring(0, myMsg.length()-1);
  } else if(key != BACKSPACE){
    myMsg = myMsg + key;
  }

  //checking for symbols
  if(key == 'A');
}