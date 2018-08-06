void Film1Logic(){
 if (film == 1) {
   changeSpeedTimer(); //changing the speed timed for all films equal
    //play A1
    if (state == 1) {
      //changeSpeed();    
      video1.jump(jumppoint[0]+0.08);
      state = 4;
    }  //end play state 1 if loop

    if ((state == 4) && (vt1 > jumppoint[1])) {
      state = int(random(7, 9));
    } 

    //playA2 
    if (state == 2) {
      //changeSpeed();
      video1.jump(jumppoint[2]);
      state = 5;
    } //end A2 if loop

    if ((state == 5) && (vt1 > jumppoint[3])) { 
      state = int(random(7, 9));
    } 

    //playA3 
    if (state == 3) {
      //changeSpeed();
      video1.jump(jumppoint[4]);   
      state = 6;
    } //end A3 loop

    if ((state == 6 ) && (vt1 > jumppoint[5])) { 
      state = int(random(7, 9));
    } 

    //play B1
    if (state == 7) {
      //changeSpeed();
      video1.jump(jumppoint[6]);
      state = 10;
    }  //end play B1 if loop

    if ((state == 10) && (vt1 > jumppoint[7])) {
      state = int(random(13, 15));
    } 

    //play B2
    if (state == 8) {
      //changeSpeed();
      video1.jump(jumppoint[8]);
      state = 11;
    }  //end play B2 if loop

    if ((state == 11) && (vt1 > jumppoint[9])) {
      state = int(random(13, 15));
    } 

    //play B3
    if (state == 9) {
      //changeSpeed();
      video1.jump(jumppoint[10]);
      state = 12;
    }  //end play B3 if loop

    if ((state == 12) && (vt1 > jumppoint[11])) {
      state = int(random(13, 15));
    } 

    //play C1
    if (state == 13) {
      //changeSpeed();
      video1.jump(jumppoint[12]);
      state = 16;
    }  //end play C1 if loop

    if ((state == 16) && (vt1 > jumppoint[13])) {
      state = 19;
    } 

    //play C2
    if (state == 14) {
      //changeSpeed();
      video1.jump(jumppoint[14]);
      state = 17;
    }  //end play C2 if loop

    if ((state == 17) && (vt1 > jumppoint[15])) {
      state = 19;
    } 

    //play C3
    if (state == 15) {
      //changeSpeed();
      video1.jump(jumppoint[16]);
      state = 18;
    }  //end play C1 if loop

    if ((state == 18) && (vt1 > jumppoint[17])) {
      state = 19;
    } 

    //play D
    if (state == 19) {
      //changeSpeed();
      video1.jump(jumppoint[18]);
      //video1.play();
      state = 20;
    }  //end play C1 if loop

    if ((state == 20) && (vt1 > jumppoint[19])) {
      PlayAll++;

      jump = int(random(1, 3));
      if (jump == 1) {

        video1.jump(jumppoint[jump-1]);
        state = jump;
        //video1.play();
      }
      if (jump == 2) {

        video1.jump(jumppoint[jump]);
        state = jump;
        video1.play();
      }
      if (jump == 3) {

        video1.jump(jumppoint[jump+1]);
        state = jump;
        video1.play();
      }
    }//if
  }//film 1 
}
