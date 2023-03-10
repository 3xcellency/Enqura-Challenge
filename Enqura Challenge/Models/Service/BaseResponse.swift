//
//  BaseResponse.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

public struct BaseResponse: Codable {

    public let data: Bool?
    public var succeeded: Bool?

    public var message: String?
    public init(data: Bool? = nil, succeeded: Bool? = nil, message: String? = nil) {
        self.data = data
        self.succeeded = succeeded
        self.message = message
    }

}
