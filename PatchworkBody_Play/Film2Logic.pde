void Film2Logic(){
   if (film == 2) {
  changeSpeedTimer(); //changing the speed timed for all films equal
   
   if (vt1 > 389) {//loop the film at the end
    PlayAll++;
    //changeSpeed();  
    video1.jump(0.0);
  }//if film == 2 
}
}
