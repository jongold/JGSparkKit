# JGSparkKit CHANGELOG

## 0.0.5

Add methods for the rest of the API -
```objective-c
- (void)getDevicesUsingBlock:(void (^)(NSArray *responseObject))callback;
- (void)getDeviceUsingBlock:(void (^)(NSDictionary *responseObject))callback;
- (void)getDeviceWithDeviceID:(NSString *)deviceID usingBlock:(void (^)(NSDictionary *responseObject))callback;
```

## 0.0.1

Initial release.
