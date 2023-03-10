//
//  String+Extension.swift
//  Enqura Challenge
//
//  Created by Ozan on 10.03.2023.
//
import UIKit
extension String {
    public var md5: String {
        return encodeMD5(digest: md5Digest)
    }
    
    public var md5Digest: [Byte] {
        let bytes = [Byte](self.utf8)
        let digest = calculateMD5(bytes)
        return digest.digest
    }
    func dateFormat() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let newdate = dateFormatter.string(from: date ?? Date())
        return newdate
    }
}
