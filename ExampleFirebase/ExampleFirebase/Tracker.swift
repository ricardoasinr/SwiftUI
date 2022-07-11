//
//  Tracker.swift
//  NotasFirebase
//
//  Created by Ricardo Asin on 7/7/22.
//

import Foundation
import FirebaseAnalytics

final class Tracker {
    static func trackCreateLinkEvent (url: String){
        
        Analytics.logEvent("CreateLinkEvent", parameters: ["url" : url])
        
    }
    
    static func trackSaveLinkEvent(){
        Analytics.logEvent("SaveLinkEvent", parameters: nil)
    }
    
    static func trackErrorSaveLinkEvent(error: String ){
        Analytics.logEvent("ErrorEvent", parameters: ["error": error])
        
    }
}

