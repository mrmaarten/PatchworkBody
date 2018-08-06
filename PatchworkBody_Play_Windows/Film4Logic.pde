void Film4Logic(){
   if (film == 4) {
     changeSpeedTimer(); //changing the speed timed for all films equal
    if (vt1 > 225.00) {
      PlayAll++;
      //changeSpeed();  
      video1.jump(0.0);
    }//if film == 3 
  }
}
