//
//  NSObject+Extension.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

import Foundation

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return String(describing: self)
    }
}
