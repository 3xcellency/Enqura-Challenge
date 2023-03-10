//
//  AnalyticsModel.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//

public struct AnalyticsModel {
    
    public var screenName = ""
    public var event = ""
 
    public func convertToDictionary() -> [String: Any] {
        return [
            "screenName":screenName,
            "event":event
        ]
    }
    
}
enum AnalyticsEvents: String {
    case opened = "Opened"
    case closed = "Closed"
}
