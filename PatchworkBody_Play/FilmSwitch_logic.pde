void filmSwitch() {
  if (film == 1) {
    if (FirstPlay == 0) {
    video1.stop();
    }
    FirstPlay = 0;
    video1 = new Movie(this, Videos[0]);
    PlayAll = 0;
    videoSpeed = random(0.4, 1.0);
    video1.speed(videoSpeed);
    video1.play();
    vd1=video1.duration();
    state = int(random(1, 3));
  }//if film = 1

  if (film == 2) {
    if (FirstPlay == 0) {
    video1.stop();
    }
    FirstPlay = 0;
    video1 = new Movie(this, Videos[1]);
    PlayAll = 0;
    videoSpeed = random(0.6, 1.0);
    video1.speed(videoSpeed);
    video1.play();
    vd1=video1.duration();
    video1.loop();
  }//if film = 2
  
  if (film == 3) {
    if (FirstPlay == 0) {
    video1.stop();
    }
    FirstPlay = 0;
    video1 = new Movie(this, Videos[2]);
    PlayAll = 0;
    videoSpeed = random(0.6, 1.0);
    video1.speed(videoSpeed);
    video1.jump(200.0);
    video1.play();
    vd1=video1.duration();
    video1.loop();
  }
  
  if (film == 4) {
    if (FirstPlay == 0) {
    video1.stop();
    }
    FirstPlay = 0;
    video1 = new Movie(this, Videos[3]);
    PlayAll = 0;
    videoSpeed = random(0.6, 1.0);
    video1.speed(videoSpeed);
    video1.jump(200.0);
    video1.play();
    vd1=video1.duration();
    video1.loop();
  }
  
  if (film == 5) {
    if (FirstPlay == 0) {
    video1.stop();
    }
    FirstPlay = 0;
    video1 = new Movie(this, Videos[4]);
    PlayAll = 0;
    videoSpeed = random(0.6, 1.0);
    video1.speed(videoSpeed);
    video1.jump(200.0);
    video1.play();
    vd1=video1.duration();
    video1.loop();
  }
}// filmSwitch

void NextMovieFromList() {
  film++;
  if (film == 1) {
    filmSwitch();
  }
  else if (film == 2) {
    filmSwitch();
  }
  else if (film == 3) {
    filmSwitch();
  }
  else if (film == 4) {
    filmSwitch();
  }
  else if (film == 5) {
    filmSwitch();
  }   
  else {
    film = 1;
  }
}
