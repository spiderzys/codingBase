//
//  UIDevice.swift
//  CNBMobile
//
//  Created by Steven Dai on 2019-04-24.
//  Copyright © 2019 IBM Corporation. All rights reserved.
//
import AVFoundation
import Foundation
import UIKit

extension UIDevice {
    
    static var isIphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isIpad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isSmallScreenIphone: Bool {
        return UIDevice.current.name == "iPhone 5s" || UIDevice.current.name == "iPhone 5" || UIDevice.current.name == "iPhone SE"
    }
    
    static func requestCameraAccess(completionHandler handler: @escaping (Bool) -> Void) {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: handler)
        case .authorized:
            handler(true)
        default:
            handler(false)
        }
    }
    
    static func isSimulator() -> Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    class func modelIdentifier() -> String {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] { return simulatorModelIdentifier }
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }
}
