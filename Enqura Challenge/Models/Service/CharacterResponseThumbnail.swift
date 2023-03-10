//
//  CharacterResponseThumbnail.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

public struct CharacterResponseThumbnail: Codable {

    public let path,extensionType: String?
    
    enum CodingKeys: String, CodingKey {
           case path
           case extensionType = "extension"
       }
}
