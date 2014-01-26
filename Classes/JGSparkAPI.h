//
//  JGSparkAPI.h
//  
//
//  Created by Jon Gold on 25/01/2014.
//
//

#import <Foundation/Foundation.h>

@interface JGSparkAPI : NSObject

@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *deviceID;
@property (nonatomic, strong) NSURL *baseURL;

+ (instancetype)sharedAPI;
- (void)getDevicesUsingBlock:(void (^)(NSArray *responseObject))callback;
- (void)getDeviceUsingBlock:(void (^)(NSDictionary *responseObject))callback;
- (void)getDeviceWithDeviceID:(NSString *)deviceID usingBlock:(void (^)(NSDictionary *responseObject))callback;
- (void)runCommand:(NSString *)command args:(NSArray *)args usingBlock:(void (^)(NSDictionary *responseObject))callback;
- (void)getVariable:(NSString *)variable usingBlock:(void (^)(NSDictionary *responseObject))callback;

@end
