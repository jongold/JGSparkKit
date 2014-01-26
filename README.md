# JGSparkKit

[![Version](http://cocoapod-badges.herokuapp.com/v/JGSparkKit/badge.png)](http://cocoadocs.org/docsets/JGSparkKit)
[![Platform](http://cocoapod-badges.herokuapp.com/p/JGSparkKit/badge.png)](http://cocoadocs.org/docsets/JGSparkKit)

## Usage

In your app…
```objective-c
#import <JGSparkKit/JGSparkAPI.h>
- (void)doSparkyStuff {

  NSString *accessToken = @"YOUR ACCESS TOKEN";
  NSString *deviceID = @"YOUR DEVICE ID";

  JGSparkAPI *sparkAPI = [JGSparkAPI sharedAPI];
  sparkAPI.accessToken = accessToken;
  sparkAPI.deviceID = deviceID;

  [sparkAPI getVariable:@"myVariable" usingBlock:^(id responseObject) {
    NSLog(@"%@", [(NSDictionary *)responseObject valueForKey:@"result"]);
  }];

  [[JGSparkAPI sharedAPI] runCommand:@"myCommand" args:@"foo,bar" usingBlock:^(id responseObject) {
    NSLog(@"%@", responseObject);
  }];
}
```

On Spark.io Build…
```c
int inputPin = A0;
int ledPin = D7;

int inputValue = 0;

void setup() {
    Spark.variable("myVariable", &inputValue, INT);
    pinMode(potPin, INPUT);

    Spark.function("myCommand", flash);
    pinMode(ledPin, OUTPUT);
}

void loop() {
    inputValue = analogRead(inputPin);
}

int myCommand(String args) {
    for (int i = 0; i < 20; i++) {
        digitalWrite(ledPin, HIGH);
        delay(60);
        digitalWrite(ledPin, LOW);
        delay(60);
    }

    return 1;
}
```

## Requirements

TODO

## Installation

JGSparkKit is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "JGSparkKit"

## Author

Jon Gold, hello@designedbygold.com

## License

JGSparkKit is available under the MIT license. See the LICENSE file for more info.

