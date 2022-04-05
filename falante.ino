// parte 1
#include <Servo.h>
int led1 = 10;
Servo myservo;
int pos = 0;

//parte 2
myservo.attach(9);

// parte 3
for (pos = 45; pos <= 60; pos += 1) {       
    myservo.write(pos);              
    delay(1);                       
}
for (pos = 60; pos >= 45; pos -= 1) { 
    myservo.write(pos);              
    delay(1);                       
}
digitalWrite(led1, HIGH);    
delay(10);
digitalWrite(led1, LOW);