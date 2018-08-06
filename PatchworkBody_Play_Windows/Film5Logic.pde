void Film5Logic(){
   if (film == 5) {
     changeSpeedTimer(); //changing the speed timed for all films equal
    if (vt1 > 287.68) {
      PlayAll++;
      //changeSpeed();  
      video1.jump(0.0);
    }//if film == 3 
  }
}
