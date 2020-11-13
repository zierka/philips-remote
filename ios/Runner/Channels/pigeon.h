// Autogenerated from Pigeon (v0.1.9), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class ChannelRequest;
@class RequestPayload;
@class Credential;
@class ChannelResponse;
@class Error;

@interface ChannelRequest : NSObject
@property(nonatomic, strong, nullable) NSNumber * id;
@property(nonatomic, copy, nullable) NSString * method;
@property(nonatomic, strong, nullable) RequestPayload * payload;
@end

@interface RequestPayload : NSObject
@property(nonatomic, copy, nullable) NSString * url;
@property(nonatomic, copy, nullable) NSString * body;
@property(nonatomic, strong, nullable) Credential * credential;
@end

@interface Credential : NSObject
@property(nonatomic, copy, nullable) NSString * username;
@property(nonatomic, copy, nullable) NSString * password;
@end

@interface ChannelResponse : NSObject
@property(nonatomic, strong, nullable) NSNumber * id;
@property(nonatomic, copy, nullable) NSString * status;
@property(nonatomic, strong, nullable) FlutterStandardTypedData * result;
@property(nonatomic, strong, nullable) Error * error;
@end

@interface Error : NSObject
@property(nonatomic, copy, nullable) NSString * error;
@property(nonatomic, strong, nullable) NSNumber * code;
@end

@protocol NetworkChannelApiRequest
-(void)sendRequest:(ChannelRequest*)input error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void NetworkChannelApiRequestSetup(id<FlutterBinaryMessenger> binaryMessenger, id<NetworkChannelApiRequest> _Nullable api);

@interface NetworkChannelApiResponse : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)onResult:(ChannelResponse*)input completion:(void(^)(NSError* _Nullable))completion;
@end
NS_ASSUME_NONNULL_END