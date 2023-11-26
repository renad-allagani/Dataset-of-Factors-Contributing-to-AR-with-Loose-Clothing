
//Definition of Arduino pins that are connected to the motor encoder 
#define encoderRevolutions 16 //16 pulses per revolution based on motor datasheet 
#define encoderA 2 //Pulse count tracking 
#define encoderB 4 //Rotation direction tracking 
 
boolean forwardDirection = true; //True for forward direction, false for reverse direction 
volatile long pulseCount = 0;   
long previousMS = 0;
long currentMS = 0;
float rpm = 0;
float angVelocity = 0;

void setup() { 
  Serial.begin(9600); 
 
  //Arduino pin configuration
  pinMode(encoderA , INPUT_PULLUP);
  pinMode(encoderB , INPUT);
 
  //pulseFunction (ISR) is called everytime the interrupt occurs during the rising mode 
  attachInterrupt(digitalPinToInterrupt(encoderA), pulseFunction, RISING);
}
 
void loop() {
 
  //Recording time 
  currentMS = millis();
 
  //Printing motor speed every second
  if (currentMS - previousMS > 1000) {

    previousMS = currentMS;
 
    //Calculating revolutions per minute with motor gear ratio of 30:1
    rpm = (float)((pulseCount*60/encoderRevolutions)/30);
    angVelocity = rpm*0.1047198; //rpm * ((2*pi)/60) to convert to angular velocity
     
    Serial.print("RPM_Speed:");
    Serial.print(rpm);
    Serial.print(" ");
    // Serial.println("RPM");
    Serial.print(" Angular_Velocity:");
    Serial.print(angVelocity);
    Serial.print(" ");
    // Serial.print(" rad per second");
    Serial.println();
    pulseCount = 0; //reset of pulseCount 
  }
}

//When called, pulseCount is incremented/decremented when in forward/reverse direction respectively.  
void pulseFunction() {
   
  //Reading the value of encoderB for the rotation direction
  int value = digitalRead(encoderB);
 
  if(value == LOW) {
    forwardDirection = false; // Reverse
  }
  else {
    forwardDirection = true; // Forward
  }
   
  if (forwardDirection) {
    pulseCount++;
  }
  else {
    pulseCount--;
  }
}