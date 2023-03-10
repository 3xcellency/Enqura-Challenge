//
//  AnalyticsHelper.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//

import FirebaseAnalytics
class AnalyticsHelper: NSObject {
    
    static let shared = AnalyticsHelper()
    
    func sendAnalyticsEvents(data : AnalyticsModel) {
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName : data.screenName])
    }
    func logEvent(name: String, title: String) {
        Analytics.logEvent(name, parameters: [
          AnalyticsParameterItemID: "id-\(title)",
          AnalyticsParameterItemName: title,
          AnalyticsParameterContentType: "cont",
        ])
    }
}
