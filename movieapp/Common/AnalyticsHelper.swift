//
//  AnalyticsHelper.swift
//  movieapp
//
//  Created by Seda Şahin on 18.09.2023.
//

import Foundation
import FirebaseAnalytics

class AnalyticsHelper: NSObject {
    static let shared = AnalyticsHelper()
    static var eventName: String?
    static var module: String!
    static var itemId: String!
    public func sendEvent(eventName: String, module: String, itemId: String) {
        Analytics.logEvent("eventName", parameters: [
            "eventName": eventName as NSObject,
            "module": module as NSObject,
            "itemId": itemId as NSObject
        ])
    }
}
