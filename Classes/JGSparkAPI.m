//
//  JGSparkAPI.m
//  
//
//  Created by Jon Gold on 25/01/2014.
//
//

#import "JGSparkAPI.h"
#import <AFNetworking/AFNetworking.h>

static NSURL *baseURL;

@implementation JGSparkAPI

- (id)init
{
  self = [super init];
  if (self) {
    self.baseURL = [NSURL URLWithString:@"https://api.spark.io/v1"];
  }
  return self;
}

# pragma mark - Public

+ (instancetype)sharedAPI
{
  static JGSparkAPI *sharedAPI = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedAPI = [[self alloc] init];
  });
  return sharedAPI;
}

- (void)getDevicesUsingBlock:(void (^)(NSArray *responseObject))callback
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
  NSURL *url = [self.baseURL URLByAppendingPathComponent:[NSString stringWithFormat:@"devices"]];
  
  NSMutableDictionary *params = [self defaultParams];
  
  [manager GET:[url description] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if (callback) {
      callback(responseObject);
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
  
}

- (void)getDeviceUsingBlock:(void (^)(NSDictionary *))callback
{
  [self getDeviceWithDeviceID:self.deviceID usingBlock:callback];
}

- (void)getDeviceWithDeviceID:(NSString *)deviceID usingBlock:(void (^)(NSDictionary *))callback
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
  NSURL *url = [self.baseURL URLByAppendingPathComponent:[NSString stringWithFormat:@"devices/%@", deviceID]];
  
  NSMutableDictionary *params = [self defaultParams];
  
  [manager GET:[url description] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if (callback) {
      callback(responseObject);
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
  
}

- (void)runCommand:(NSString *)command args:(NSArray *)args usingBlock:(void (^)(NSDictionary *responseObject))callback
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
  NSURL *url = [self.baseURL URLByAppendingPathComponent:[NSString stringWithFormat:@"devices/%@/%@", self.deviceID, command]];
  
  NSMutableDictionary *params = [self defaultParams];
  
  if (args) {
    [params setValue:[args componentsJoinedByString:@","] forKey:@"args"];
  }
  
  [manager POST:[url description] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if (callback) {
      callback(responseObject);
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
  
}

- (void)getVariable:(NSString *)variable usingBlock:(void (^)(NSDictionary *responseObject))callback
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
  NSURL *url = [self.baseURL URLByAppendingPathComponent:[NSString stringWithFormat:@"devices/%@/%@", self.deviceID, variable]];
  
  NSMutableDictionary *params = [self defaultParams];
  
  [manager GET:[url description] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if (callback) {
      callback(responseObject);
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
  
}

# pragma mark - Private

- (NSMutableDictionary *)defaultParams
{
  return [NSMutableDictionary dictionaryWithObject:self.accessToken forKey:@"access_token"];
}

@end
