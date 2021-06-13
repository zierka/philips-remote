import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    private var networkChannel: NetworkChannel?
    private var mixpanelConfiguration: MixpanelConfiguration?
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let flutterVC = window!.rootViewController as! FlutterViewController
        let messenger = flutterVC.engine!.binaryMessenger
        
        networkChannel = NetworkChannel(binaryMessenger: messenger)
        
        mixpanelConfiguration = MixpanelConfiguration(binaryMessenger: messenger)
        
        GeneratedPluginRegistrant.register(with: self)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
