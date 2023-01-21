//
//  MixpanelConfiguration.swift
//  Runner
//
//  Created by Erik Zier on 13.06.2021.
//  Copyright © 2021 The Chromium Authors. All rights reserved.
//

import Foundation
// import Mixpanel

class MixpanelConfiguration: IOSMixpanelConfiguration {
    
    init(binaryMessenger: FlutterBinaryMessenger) {
        IOSMixpanelConfigurationSetup(binaryMessenger, self)
    }
    
    func disableGeolocation(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        // Mixpanel.mainInstance().useIPAddressForGeoLocation = false
    }
}
