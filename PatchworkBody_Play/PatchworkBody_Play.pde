/* PatchWork Bodies 2012 - 2018 
 Initiative, Choreography Martina Marini
 Film, Direction, software Maarten van der Glas
 Dancers: Anastasia Kostner, Evelyn Petruzzino, Santija Bieza
 */

// FIX
// changing the speed algorithm: smoothing/ ramp up down to next speed

//ADD

import processing.video.*;

// FULLSCREEN OR NOT, finding location of movies is automatic
int fullscreen = 0;

Movie video1;
String SketchPath;
char DevDrive_temp;
String DevDrive;
String DevPath = "";
String[] SplitPath;
String LocalPath = "";
String FilmPath = "\\films\\1280-F1";

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

int speedTimer = 1;
int timeSpeedStamp = 1000;
int timeLengthSpeedChange = 1000;
int film = 1;
int FirstPlay = 1;

String[] Videos = {};
String[] VideosOrdered = {"01-egg-1280x720-NO-BLOOD-F1.mp4", "02-garage-1280x720-F1.mp4",  "03-street-1280x720-F1.mp4", "04-heels-1280x720-F1.mp4", "05-hand-1280x720-F1.mp4"};;

void setup() {
  fullScreen(2);
  /* The fullScreen() function should always be the first line in setup() or (if running in another IDE) it should appear inside of the settings() function. 
  If the computer has one screen, the software will open on that screen. 
  If the computer has more than one screen, the software will appear on the screen specified in the “Run sketches on display” option in Preferences (see below).
  */
    //surface.setResizable(true);

  frameRate(50);
  noSmooth();
  
  //get the path of the current sketch
  SketchPath = sketchPath("");
  println("SketchPath: "+ SketchPath);
  println();
  //video1 = new Movie(this, "/media/pi/USB/egg-all-h264.mp4", GLVideo.MUTE);

/////////////////////////////////////////
/// Check if sketch is on C drive or not

    //get the first character of the drive path = the windows drive
    char DevDrive_temp = SketchPath.charAt(0);
    //cast the drive path as a String
    String DevDrive = str(DevDrive_temp);
    //check if sketch is on c: drive
    if (DevDrive.equals("C") == true || DevDrive.equals("c") == true) {
      //println("C drive!");
      
      // get path, parse Desktop, add films
  
  ///////////////////////////////////////////////
  // PARSE DESKTOP FOLDER for local use

  String[] ListPath = split(SketchPath, '\\');
  //printArray (ListPath);
  for (int i = 0; i < ListPath.length; i++) {
    //println(ListPath[i]);
    if (i == 0) {
      DevPath = DevPath + ListPath[i];
      //println (DevPath);
    } else {
    DevPath = DevPath +"\\"+ListPath[i];
    //println (DevPath);
    if (ListPath[i].equals("Desktop") == true) {
      DevPath = DevPath + FilmPath;
      //println("breakpoint");
      //println (DevPath);
      break;
      }//if
    }// else
  }//for
  
  /// end parse desktop folder
  //////////////////////////////////////////////
  
    Videos = listFileNames(DevPath);
    DevPath = DevPath + "\\";

    
    for (int i=0;i<Videos.length;i++) {
    Videos[i] = DevPath + Videos[i];
    } 

    } else { //////// if not on C drive
      //println("No C drive");
    
    // add : to the drive letter
    DevDrive = DevDrive + ":";
    
    //complete the path to the films on the usb drive
    DevPath = DevDrive + FilmPath;

    Videos = listFileNames(DevPath);
    
    DevPath = DevPath + "\\";
    println("Film path: ");
    println(DevPath);
    
    arrayCopy(Videos, VideosOrdered);

    ///// put the videos in the right order
    //for (int j=0; j<Videos.length; j++){
    //  char DevPath_temp = Videos[j].charAt(1);
    //  //cast the drive path as a String
    //  String MovNumber = str(DevPath_temp);
    //  if (MovNumber.equals("1") == true) {
    //   VideosOrdered[0] = Videos[j]; 
    //  }
    //  if (MovNumber.equals("2") == true) {
    //     VideosOrdered[1] = Videos[j]; 
    //    }
    //  if (MovNumber.equals("3") == true) {
    //   VideosOrdered[2] = Videos[j]; 
    //  }
    //  if (MovNumber.equals("4") == true) {
    //     VideosOrdered[3] = Videos[j]; 
    //    }
    //  if (MovNumber.equals("5") == true) {
    //   VideosOrdered[4] = Videos[j]; 
    //    }
    //  }

    //arrayCopy(VideosOrdered, Videos);
      
      for (int i=0;i<Videos.length;i++) {
      Videos[i] = DevPath + Videos[i];
      }
    /// add drive name in front of video names
      //printArray(Videos);
    } ///else (not c drive)
  
  
//// C drive check  
///////////////////////////////////////////////  


// full screen or not 
  if (fullscreen == 0) {
    surface.setSize(1024, 576);
    surface.setLocation(100,80);
    
  } else {
   noCursor(); 
  }
    
  state = int(random(1,3));
  //println("firstate: "+state);
  film = int(random(1, 5));
  debugger();
  debug = 1;
  delay(150);
  filmSwitch();
  debug = 0;
  counterTresh = vt1 + random(4.0, 20.0);
  
} //setup

void movieEvent(Movie m) {
  m.read();
}

String[] listFileNames(String dir) {
  File file = new File(dir);
    String Videos[] = file.list();
    //printArray (Videos);
    //println();
    
    /// put the videos in the right order
    for (int j=0; j<Videos.length; j++){
      char DevPath_temp = Videos[j].charAt(1);
      //cast the drive path as a String
      String MovNumber = str(DevPath_temp);
      if (MovNumber.equals("1") == true) {
       VideosOrdered[0] = Videos[j]; 
      }
      if (MovNumber.equals("2") == true) {
         VideosOrdered[1] = Videos[j]; 
        }
      if (MovNumber.equals("3") == true) {
       VideosOrdered[2] = Videos[j]; 
      }
      if (MovNumber.equals("4") == true) {
         VideosOrdered[3] = Videos[j]; 
        }
      if (MovNumber.equals("5") == true) {
       VideosOrdered[4] = Videos[j]; 
        }
      }
      arrayCopy(VideosOrdered, Videos);
      println("Ordered video list from folder: ");
      printArray(Videos);
      println();
      
    return Videos; 
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
