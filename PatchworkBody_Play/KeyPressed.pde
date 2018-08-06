void keyPressed() { //d or D key
  if (key == 68 || key == 100) { 
    if (debug == 0) {
      debug = 1;
    } else {
      debug = 0;
    } //end else
  }//key == 68 || key == 100


  else if (key == 70 || key == 102 ) { //f or F key
    if (fullscreen == 0) {
      fullscreen = 1;
    } else {
      fullscreen = 0;
    } //end else
  }// if key == 70 || 102

  else if (key == 49) {//1 key
    film = 1;
    
    filmSwitch();
  }//if key == 49 
  else if (key == 50) {//2 key
    film = 2;
    filmSwitch();
  }//if key == 50 
  
  else if (key == 51) {//3 key
    film = 3;
    filmSwitch();
  }//if key == 51 

else if (key == 52) {//4 key
    film = 4;
    filmSwitch();
  }//if key == 52 
  
else if (key == 53) {//5 key
    film = 5;
    filmSwitch();
  }//if key == 53 
  
  
  else if (key == CODED) {
    if (keyCode == LEFT) {//left arrow key
      if (state == 4) {
        state = 1;
      }
      if (state == 5) {
        state = 2;
      }
      if (state == 6) {
        state = 3;
      }
      if (state == 7) {
        state = 3;
      }
      if (state == 8) {
        state = 2;
      }
      if (state == 9) {
        state = 1;
      }
      if (state == 10) {
        state =7;
      }
      if (state == 11) {
        state = 8;
      }
      if (state == 12) {
        state = 9;
      }
      if (state == 13) {
        state = 7;
      }
      if (state == 14) {
        state = 8;
      }
      if (state == 15) {
        state = 9;
      }
      if (state == 16) {
        state = 13;
      }
      if (state == 17) {
        state = 14;
      }
      if (state == 18) {
        state = 15;
      }
      if (state == 19) {
        state = int(random(13, 15));
      }
      if (state == 20) {
        state = 19;
      }
    } else if (keyCode == RIGHT) {

      if (state == 4 || state == 1) {
        state = 7;
      }
      if (state == 5 || state == 2) {
        state = 8;
      }
      if (state == 6 || state == 3) {
        state = 9;
      }
      if (state == 7 || state == 10) {
        state = 13;
      }
      if (state == 8 || state == 11) {
        state = 14;
      }
      if (state == 9 || state == 12) {
        state = 15;
      }
      if (state == 13 || state == 14 || state == 15 || state == 16|| state == 17|| state == 18) {
        state = 19;
      }

      if (state == 19 || state == 20) {
        state = int(random(1, 3));
      }
    } //end else if
  }//end CODED
} // end keypressed
