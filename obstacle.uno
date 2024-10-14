const int trigPin = 11;
const int echoPin = 10;
const int in1 = 9;
const int in2 = 8;
const int in3 = 4;
const int in4 = 3;

void setup() 
{
  pinMode(trigPin, OUTPUT);    // Set Trig pin as output for ultrasonic sensor
  pinMode(echoPin, INPUT);     // Set Echo pin as input for ultrasonic sensor
  pinMode (in1, OUTPUT);       // Motor A control pin 1
  pinMode (in2, OUTPUT);       // Motor A control pin 2
  pinMode (in3, OUTPUT);       // Motor B control pin 1
  pinMode (in4, OUTPUT);       // Motor B control pin 2
}

long duration, distance;

void loop()
{
  // Ultrasonic Sensor Logic: Measure Distance
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);        // Ensure the trigger pin is low for a short time
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);       // Send a 10us pulse to trigger the ultrasonic sensor
  digitalWrite(trigPin, LOW);
  
  duration = pulseIn(echoPin, HIGH);     // Measure the echo pulse duration
  distance = duration / 58.2;            // Calculate the distance in cm (Speed of Sound formula)

  // Decision Making Based on Distance
  if (distance < 30)           // If an obstacle is closer than 30 cm
  {
    // Move Backwards/Turn (Reverse Motors)
    digitalWrite(in1, HIGH);   // Motor A turns in reverse direction
    digitalWrite(in2, LOW);
    digitalWrite(in3, LOW);    // Motor B turns in reverse direction
    digitalWrite(in4, HIGH);
    delay(1200);               // Reverse for 1.2 seconds to avoid obstacle
  }
  else
  {
    // Move Forward
    digitalWrite(in1, HIGH);   // Motor A moves forward
    digitalWrite(in2, LOW);
    digitalWrite(in3, HIGH);   // Motor B moves forward
    digitalWrite(in4, LOW);
  }

  delay(0);    // No delay between cycles
}
