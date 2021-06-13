// Autogenerated from Pigeon (v0.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class ChannelRequest;
@class RequestPayload;
@class Credential;
@class RequestOptions;
@class ChannelResponse;
@class NetworkError;

@interface ChannelRequest : NSObject
@property(nonatomic, strong, nullable) NSNumber * id;
@property(nonatomic, copy, nullable) NSString * method;
@property(nonatomic, strong, nullable) RequestPayload * payload;
@property(nonatomic, strong, nullable) RequestOptions * options;
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

@interface RequestOptions : NSObject
@property(nonatomic, strong, nullable) NSNumber * timeout;
@property(nonatomic, copy, nullable) NSString * protocol;
@property(nonatomic, copy, nullable) NSString * ip;
@property(nonatomic, strong, nullable) NSNumber * port;
@property(nonatomic, strong, nullable) NSNumber * apiVersion;
@end

@interface ChannelResponse : NSObject
@property(nonatomic, copy, nullable) NSString * status;
@property(nonatomic, strong, nullable) FlutterStandardTypedData * result;
@property(nonatomic, strong, nullable) NetworkError * error;
@property(nonatomic, strong, nullable) ChannelRequest * request;
@end

@interface NetworkError : NSObject
@property(nonatomic, copy, nullable) NSString * error;
@property(nonatomic, strong, nullable) NSNumber * code;
@end

@protocol IOSMixpanelConfiguration
-(void)disableGeolocation:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void IOSMixpanelConfigurationSetup(id<FlutterBinaryMessenger> binaryMessenger, id<IOSMixpanelConfiguration> _Nullable api);

@protocol AndroidLifecycleHelper
-(void)sendToBackground:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void AndroidLifecycleHelperSetup(id<FlutterBinaryMessenger> binaryMessenger, id<AndroidLifecycleHelper> _Nullable api);

@protocol NetworkChannelApiRequest
-(void)sendRequest:(ChannelRequest*)input error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void NetworkChannelApiRequestSetup(id<FlutterBinaryMessenger> binaryMessenger, id<NetworkChannelApiRequest> _Nullable api);

@interface NetworkChannelApiResponse : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)onResult:(ChannelResponse*)input completion:(void(^)(NSError* _Nullable))completion;
@end
NS_ASSUME_NONNULL_END
