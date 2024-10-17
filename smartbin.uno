#include <Servo.h>

const int trigPin = 9; // Define pins for the ultrasonic sensor
const int echoPin = 10;
Servo myServo; // Define the servo motor
long duration; // Variable for the duration of the ultrasonic pulse

int distance; // Variable for the distance measurement
void setup() {
  Serial.begin(9600); // Initialize serial communication for debugging
   pinMode(trigPin, OUTPUT);  // Set the trigPin as an output
    pinMode(echoPin, INPUT);// Set the echoPin as an input

 
  myServo.attach(3); // Attach the servo motor to pin 3
 myServo.write(0);// Initialize the servo motor to the closed position
}

void loop() {
   digitalWrite(trigPin, LOW);  // Clear the trigPin by setting it LOW
  delayMicroseconds(2);

 digitalWrite(trigPin, HIGH); // Set the trigPin HIGH for 10 microseconds to send out the pulse
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  // Read the duration of the pulse from the echoPin
  duration = pulseIn(echoPin, HIGH);

  // Calculate the distance in centimetres
  distance = duration * 0.034 / 2;

  // Print the distance for debugging
  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

   if (distance < 20) {
    myServo.write(90); // Open the dustbin lid
    delay(5000);       // Wait for 5 seconds
  } else {
    myServo.write(0);  // Close the dustbin lid
  }
 
  delay(500);  // Small delay before the next loop
}
