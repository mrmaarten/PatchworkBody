void Film3Logic(){
   if (film == 3) {
     changeSpeedTimer(); //changing the speed timed for all films equal
    if (vt1 > 316.68) {
      PlayAll++;
      //changeSpeed();  
      video1.jump(0.0);
    }//if film == 3 
  }
}
