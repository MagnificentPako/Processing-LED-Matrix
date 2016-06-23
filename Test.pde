import processing.serial.*;

int value = 0;
Serial myPort;
boolean synced = false;
long interval = 1000;
long lastMillis = 0;

void setup() {
 //printArray(Serial.list());
 myPort = new Serial(this, Serial.list()[0], 9600);
 
 //myPort.write("a"); //This tells the Arduino to "start"
}

void draw() {
  if(synced){
      fill(value);
  rect(25, 25, 50, 50);
  long current = millis();
  if(current - lastMillis >= interval) {
    lastKey = 0;
    lastMillis = current;
  }
  }else{
    myPort.write("a");
  }

}

int lastKey = 0;

void keyPressed() {

  if(lastKey != keyCode) {
      if (value == 0) {
      value = 255;
    } else {
      value = 0;
    }
    
    println(keyCode);
    
      switch(keyCode) {
    case 37: {myPort.write(3); return;}
    case 38: {myPort.write(0); return;}
    case 39: {myPort.write(1); return;}
    case 40: {myPort.write(2); return;}
    case 10: {myPort.write(5); return;}
    case 8: {myPort.write(6); return;}
  }
    
  }
  
  lastKey = keyCode;
  
}

void serialEvent(Serial p) {
  int inString = p.read();
    println(keyCode  );
  println(inString);
  if(inString == 11) {
    synced = true;
  }
}