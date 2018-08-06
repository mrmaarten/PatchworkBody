void debugger () {
  if (debug == 1) {
    noStroke(); //grijs vlak met ronde hoeken
    fill(0, 0, 0, 120);
    rect(2, 8, 160, 200, 12);  

    stroke(1);
    fill(255, 255, 255, 255);
    //debug text
    textSize(10);
    text("state: " + state, 14, 20); 
    // 
    textSize(10);
    String sf = nf(vt1, 4, 2);
    text("time: " + sf, 14, 35);

    textSize(10);
    text("video duration: " + vd1, 14, 50);

    textSize(10);
    text("counterTresh: " + counterTresh, 14, 65);

    textSize(10);
    text("film " + film, 14, 80);

    textSize(10);
    text("videoSpeed: " + videoSpeed, 14, 95);

    textSize(10);
    text("times fully played: " + (PlayAll), 14, 110);

    /*
    textSize(10);
     text("millis()/ "+ switchTime + " : " + millis() % switchTime, 14, 125);
     
     */

    textSize(10);
    text("timerBegin: " + timerBegin, 14, 140);

    textSize(10);
    text("timeLength: " + timeLength, 14, 155);

    textSize(10);
    text("timeStamp1: " + timeStamp1, 14, 170);

    textSize(10);
    text("timeDifference: " + (millis() - timeStamp1), 14, 185);
  } //end debug if
}
