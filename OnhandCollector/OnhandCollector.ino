#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_LSM303_U.h>
#include <Adafruit_L3GD20_U.h>
#include <Adafruit_9DOF.h>
#include <SPI.h>
#include <SD.h>
const int chipSelect = 4;

Adafruit_9DOF                dof   = Adafruit_9DOF();
Adafruit_LSM303_Accel_Unified accel = Adafruit_LSM303_Accel_Unified(30301);
Adafruit_LSM303_Mag_Unified   mag   = Adafruit_LSM303_Mag_Unified(30302);


void initSensors()
{

  Serial.begin(115200);
  if (!accel.begin())
  {
    
    Serial.println(F("Ooops, no LSM303 detected ... Check your wiring!"));
    //displayt("Ooops, no LSM303 detected ... Check your wiring!");
    while (1);
  }
  if (!mag.begin())
  {
   
    Serial.write("Ooops, no LSM303 detected ... Check your wiring!");
    //displayt("Ooops, no LSM303 detected ... Check your wiring!");
    while (1);
  }

  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    //displayt("Card failed, or not present");
    // don't do anything more:
    return;
  }
  //Serial.println("card initialized.");
  delay(1000);
   
}

int trainNo = 105;
int startTrainNo = 105;
String value = "";
String msg;
int noOfDataPoints = 120;

void setup(void)
{
  initSensors();
}



void loop(void)
{


  for (int j = startTrainNo; j <= trainNo; j++) {
    
for(int x = 3; x> 0 ; x--){
  msg = "";
  msg += "Training example no ";
  msg +=  j;
  msg += " in ";
  msg += x;
  msg += " seconds";
  Serial.println( msg );
  delay(500);

}

  Serial.println("Training ...");
  delay(500);
  
    for ( int i = 1; i <= noOfDataPoints; i++) {
      value = "";
      sensors_event_t accel_event;
      sensors_event_t mag_event;
      sensors_vec_t   orientation;

      accel.getEvent(&accel_event);
      if (dof.accelGetOrientation(&accel_event, &orientation))
      {

        value += j;
        value += " ";
        value += i;
        value += " ";
        value += orientation.roll;
        value += " ";
        value += orientation.pitch;
        value += " ";
      }

      mag.getEvent(&mag_event);
      if (dof.magGetOrientation(SENSOR_AXIS_Z, &mag_event, &orientation))
      {



        value += orientation.heading;

      }
      File dataFile = SD.open("data.txt", FILE_WRITE);

      

      if (dataFile) {
        dataFile.println(value);
        dataFile.close();
        Serial.println(value);
      }
      else {
        Serial.println("error opening data.txt");
      }
      delay(10);
    }
    
    msg = "";
    msg += "Done with example no " ;
    msg += j;
    Serial.println(msg);
    delay(1000);
  }

  trainNo = -1;
}

