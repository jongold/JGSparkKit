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

+ (instancetype)sharedAPI;
- (void)runCommand:(NSString *)command args:(NSArray *)args usingBlock:(void (^)(NSDictionary *))callback;
- (void)getVariable:(NSString *)variable usingBlock:(void (^)(NSDictionary *))callback;

@end
