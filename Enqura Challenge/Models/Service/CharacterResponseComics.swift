//
//  CharacterResponseComics.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

public struct CharacterResponseComics: Codable {

    public let available: Int?
    public let collectionURI: String?
    public let items: [CharacterResponseComicsItems]?
    
}
public struct CharacterResponseComicsItems: Codable {
    public let resourceURI,name: String?
}
