//
//  JGSparkAPI.m
//  
//
//  Created by Jon Gold on 25/01/2014.
//
//

#import "JGSparkAPI.h"
#import <AFNetworking/AFNetworking.h>

@implementation JGSparkAPI

# pragma mark - Public

+ (instancetype)sharedAPI
{
  static SparkAPI *sharedAPI = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedAPI = [[self alloc] init];
  });
  return sharedAPI;
}

- (void)runCommand:(NSString *)command args:(NSArray *)args usingBlock:(void (^)(NSDictionary *))callback
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
  NSString *url = [NSString stringWithFormat:@"https://api.spark.io/v1/devices/%@/%@", self.deviceID, command];
  
  NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:self.accessToken forKey:@"access_token"];
  
  if (args) {
    [params setValue:[args componentsJoinedByString:@","] forKey:@"args"];
  }
  
  [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if (callback) {
      callback(responseObject);
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
  
}

- (void)getVariable:(NSString *)variable usingBlock:(void (^)(NSDictionary *))callback
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
  NSString *url = [NSString stringWithFormat:@"https://api.spark.io/v1/devices/%@/%@", self.deviceID, variable];
  
  NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:self.accessToken forKey:@"access_token"];
  
  [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if (callback) {
      callback(responseObject);
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
  
}

@end
