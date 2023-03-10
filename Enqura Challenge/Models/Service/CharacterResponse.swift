//
//  CharacterResponse.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

typealias CharacterItems = [CharacterResponseResult]

public struct CharacterResponse: Codable {

    public let data: CharacterResponseData?
    public let succeeded: Bool?
    public let code: Int?
    public let status,copyright,etag: String?
}
public struct CharacterResponseData: Codable {

    public let results: [CharacterResponseResult]?
    public var offset,limit,total,count: Int?
}
public struct CharacterResponseResult: Codable {

    public let id,limit,total,count: Int?
    public let title,name,description,modified,resourceURI: String?
    public let thumbnail: CharacterResponseThumbnail?
    public let comics: CharacterResponseComics?

}
