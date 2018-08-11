/* PatchWork Bodies 2012 - 2018 
 Initiative, Choreography Martina Marini
 Film, Direction, software Maarten van der Glas
 Dancers: Anastasia Kostner, Evelyn Petruzzino, Santija Bieza
 */

// FIX
// changing the speed algorithm: smoothing/ ramp up down to next speed


import processing.video.*;
Movie video1;

String DriveDev = "H:\\films\\1280-F1\\";
String DriveLocal = "C:\\Users\\maarten\\Desktop\\films\\1280-F1\\";

// dev or on location
int Dev = 1;

float vd1; //video duration
float vt1; //video time
int state = 1;
int timerBegin = 1;
int timeLength = 1000*60*60*13; //millisec * 1000 to get seconds *60 = minutes *60 = hours * 4 = hours
int timeStamp1 = 0;
//values with NO BLOOD
float[] jumppoint = {4.0, 36.68, 40.72, 73.36, 77.40, 110.08, 114.12, 154.2, 158.24, 198.32, 202.36, 242.64, 246.68, 293.16, 297.20, 343.68, 347.72, 394.2, 398.24, 482.67};
// values with blood
/*float[] jumppoint = {4.0, 36.68, 40.72, 73.36, 77.40, 110.08, 114.12, 154.2, 158.24, 198.32, 202.36, 242.64, 246.68, 293.16, 297.20, 343.68, 347.72, 394.2, 398.24, 507.28};
*/

float videoSpeed = 1.0;
int PlayAll = 0;
float switchframe = 0;
int debug = 1;
float counterTresh = 25.0;
int jump;
int fullscreen = 0;
String path = sketchPath("");
int speedTimer = 1;
int timeSpeedStamp = 1000;
int timeLengthSpeedChange = 1000;

//String sketchFile = sketchFile("PatchworkBody_Play_Windows.pde");
//findPathSketch = sketchPath("data/target.app"); 

String[] Videos = {"01-egg-1280x720-NO-BLOOD-F1.mp4", "02-garage-1280x720-F1.mp4",  "03-street-1280x720-F1.mp4", "04-heels-1280x720-F1.mp4", "05-hand-1280x720-F1.mp4"};

/*
String[] Videos = {"01egg1920x1080_F1.mp4", "02Evelyn-garage-1920x1080-F1mp4.mp4",  "03Santy-Street-1920x1080-F1.mp4", "04heels1920x1080_F1_8-10.mp4", "05hand1920x1080_F72.mp4"};


String file2 =  "02Evelyn-garage-1920x1080-F1mp4.mp4";
String file3 =  "03Santy-Street-1920x1080-F1.mp4";
String file4 =  "04heels1920x1080_F2.mp4";
String file5 =  "05hand1920x1080_F2.mp4";
*/

int film = 1;
int FirstPlay = 1;

void setup() {
  fullScreen(2);
  /* The fullScreen() function should always be the first line in setup() or (if running in another IDE) it should appear inside of the settings() function. 
  If the computer has one screen, the software will open on that screen. 
  If the computer has more than one screen, the software will appear on the screen specified in the “Run sketches on display” option in Preferences (see below).
  */
  //surface.setResizable(true);

  frameRate(50);
  noSmooth();
  
  //print (path);
  //print (sketchFile);
  //video1 = new Movie(this, "/media/pi/USB/egg-all-h264.mp4", GLVideo.MUTE);
  //vd1=video1.duration();
  if (Dev == 1) {
    surface.setSize(1024, 576);
    //size (1024, 576); //this does not
    surface.setLocation(100,80);
    //surface.setTitle("Patchwork Body"); 
    
    for (int i=0;i<Videos.length;i++) {
    Videos[i] = DriveDev + Videos[i];
    } 
  } else {
      for (int i=0;i<Videos.length;i++) {
        Videos[i] = DriveLocal + Videos[i];
      }
    noCursor();
    }
  //print (file1);
  state = int(random(1,3));
  //println("firstate: "+state);
  film = int(random(1, 5));

  debugger();
  debug = 1;
  delay(500);
  filmSwitch();
  debug = 0;
  counterTresh = vt1 + random(4.0, 20.0);
} //setup

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(0);
  image(video1, 0, 0, width, height);
  videoTime();
  debugger();
  //resizeWindow();
  timedFilmSwitch();
  Film1Logic();
  Film2Logic();
  Film3Logic();
  Film4Logic();
  Film5Logic();
} //draw

void timedFilmSwitch() {
  //switch a film after x hours (timeLength)
  if (timerBegin == 1) {
    timeStamp1 = millis(); // set a timestamp to compare elapsed time to
    timerBegin = 0;
  } 
  if (millis() - timeStamp1 >= timeLength) {
    timerBegin = 1;
    NextMovieFromList();
  }
}//void timer()

//simple change video speed at changing interval
void changeSpeed() {
  videoSpeed = random(0.3, 1.4);
  video1.speed(videoSpeed);
}//end changeSpeed function

void changeSpeedTimer() {
  if (speedTimer == 1) {
    timeSpeedStamp = millis(); // set a timestamp to compare elapsed time to
    speedTimer = 0;
  } 
  if (millis() - timeSpeedStamp >= timeLengthSpeedChange) {
    speedTimer = 1;
    videoSpeed = random(0.3, 1.6);
    video1.speed(videoSpeed);
    if (videoSpeed <= 1.0){
    timeLengthSpeedChange = int(random(12000,125000));
    }
    if (videoSpeed > 1.0 && videoSpeed < 1.3){
    timeLengthSpeedChange = int(random(4000,12000));
    }
    if (videoSpeed >= 1.3 && videoSpeed < 1.7){
    timeLengthSpeedChange = int(random(1000,3000));
    }
  }
}

void videoRead() {
  video1.read(); // read video1
}

void videoTime() {
  vt1 = video1.time();  
  //video1.play();
}

void resizeWindow() {
  if (fullscreen == 0) {
    surface.setSize(640, 360);
  } else if (fullscreen == 1) {
    surface.setSize(1280, 720); 
    frame.setLocation(50, 50);
  }
} //resize window
