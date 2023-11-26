
//Assignment of Arduino digital pins that are connected to Motor1 via motor drive controller  
int in1 = 8;
int in2 = 9;
int ena = 10;

void setup() {
  //Arduino pin configuration
  pinMode(ena, OUTPUT);
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
}

void loop() {
  //Clockwise direction
  digitalWrite(in1,HIGH);
  digitalWrite(in2,LOW); 
  analogWrite(ena, 67); //pwm: [0,255]
}
