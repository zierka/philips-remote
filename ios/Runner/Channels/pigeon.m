// Autogenerated from Pigeon (v0.1.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary* wrapResult(NSDictionary *result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = [NSDictionary dictionaryWithObjectsAndKeys:
        (error.code ? error.code : [NSNull null]), @"code",
        (error.message ? error.message : [NSNull null]), @"message",
        (error.details ? error.details : [NSNull null]), @"details",
        nil];
  }
  return [NSDictionary dictionaryWithObjectsAndKeys:
      (result ? result : [NSNull null]), @"result",
      errorDict, @"error",
      nil];
}

@interface ChannelRequest ()
+(ChannelRequest*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end
@interface RequestPayload ()
+(RequestPayload*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end
@interface Credential ()
+(Credential*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end
@interface RequestOptions ()
+(RequestOptions*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end
@interface ChannelResponse ()
+(ChannelResponse*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end
@interface Error ()
+(Error*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end

@implementation ChannelRequest
+(ChannelRequest*)fromMap:(NSDictionary*)dict {
  ChannelRequest* result = [[ChannelRequest alloc] init];
  result.id = dict[@"id"];
  if ((NSNull *)result.id == [NSNull null]) {
    result.id = nil;
  }
  result.method = dict[@"method"];
  if ((NSNull *)result.method == [NSNull null]) {
    result.method = nil;
  }
  result.payload = [RequestPayload fromMap:dict[@"payload"]];
  if ((NSNull *)result.payload == [NSNull null]) {
    result.payload = nil;
  }
  result.options = [RequestOptions fromMap:dict[@"options"]];
  if ((NSNull *)result.options == [NSNull null]) {
    result.options = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.id ? self.id : [NSNull null]), @"id", (self.method ? self.method : [NSNull null]), @"method", (self.payload ? [self.payload toMap] : [NSNull null]), @"payload", (self.options ? [self.options toMap] : [NSNull null]), @"options", nil];
}
@end

@implementation RequestPayload
+(RequestPayload*)fromMap:(NSDictionary*)dict {
  RequestPayload* result = [[RequestPayload alloc] init];
  result.url = dict[@"url"];
  if ((NSNull *)result.url == [NSNull null]) {
    result.url = nil;
  }
  result.body = dict[@"body"];
  if ((NSNull *)result.body == [NSNull null]) {
    result.body = nil;
  }
  result.credential = [Credential fromMap:dict[@"credential"]];
  if ((NSNull *)result.credential == [NSNull null]) {
    result.credential = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.url ? self.url : [NSNull null]), @"url", (self.body ? self.body : [NSNull null]), @"body", (self.credential ? [self.credential toMap] : [NSNull null]), @"credential", nil];
}
@end

@implementation Credential
+(Credential*)fromMap:(NSDictionary*)dict {
  Credential* result = [[Credential alloc] init];
  result.username = dict[@"username"];
  if ((NSNull *)result.username == [NSNull null]) {
    result.username = nil;
  }
  result.password = dict[@"password"];
  if ((NSNull *)result.password == [NSNull null]) {
    result.password = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.username ? self.username : [NSNull null]), @"username", (self.password ? self.password : [NSNull null]), @"password", nil];
}
@end

@implementation RequestOptions
+(RequestOptions*)fromMap:(NSDictionary*)dict {
  RequestOptions* result = [[RequestOptions alloc] init];
  result.timeout = dict[@"timeout"];
  if ((NSNull *)result.timeout == [NSNull null]) {
    result.timeout = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.timeout ? self.timeout : [NSNull null]), @"timeout", nil];
}
@end

@implementation ChannelResponse
+(ChannelResponse*)fromMap:(NSDictionary*)dict {
  ChannelResponse* result = [[ChannelResponse alloc] init];
  result.id = dict[@"id"];
  if ((NSNull *)result.id == [NSNull null]) {
    result.id = nil;
  }
  result.status = dict[@"status"];
  if ((NSNull *)result.status == [NSNull null]) {
    result.status = nil;
  }
  result.result = dict[@"result"];
  if ((NSNull *)result.result == [NSNull null]) {
    result.result = nil;
  }
  result.error = [Error fromMap:dict[@"error"]];
  if ((NSNull *)result.error == [NSNull null]) {
    result.error = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.id ? self.id : [NSNull null]), @"id", (self.status ? self.status : [NSNull null]), @"status", (self.result ? self.result : [NSNull null]), @"result", (self.error ? [self.error toMap] : [NSNull null]), @"error", nil];
}
@end

@implementation Error
+(Error*)fromMap:(NSDictionary*)dict {
  Error* result = [[Error alloc] init];
  result.error = dict[@"error"];
  if ((NSNull *)result.error == [NSNull null]) {
    result.error = nil;
  }
  result.code = dict[@"code"];
  if ((NSNull *)result.code == [NSNull null]) {
    result.code = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.error ? self.error : [NSNull null]), @"error", (self.code ? self.code : [NSNull null]), @"code", nil];
}
@end

void NetworkChannelApiRequestSetup(id<FlutterBinaryMessenger> binaryMessenger, id<NetworkChannelApiRequest> api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.NetworkChannelApiRequest.sendRequest"
        binaryMessenger:binaryMessenger];
    if (api) {
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        ChannelRequest *input = [ChannelRequest fromMap:message];
        [api sendRequest:input error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface NetworkChannelApiResponse ()
@property (nonatomic, strong) NSObject<FlutterBinaryMessenger>* binaryMessenger;
@end

@implementation NetworkChannelApiResponse
- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger>*)binaryMessenger {
  self = [super init];
  if (self) {
    self.binaryMessenger = binaryMessenger;
  }
  return self;
}

- (void)onResult:(ChannelResponse*)input completion:(void(^)(NSError* _Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NetworkChannelApiResponse.onResult"
      binaryMessenger:self.binaryMessenger];
  NSDictionary* inputMap = [input toMap];
  [channel sendMessage:inputMap reply:^(id reply) {
    completion(nil);
  }];
}
@end
