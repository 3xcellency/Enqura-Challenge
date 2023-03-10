//
//  Router.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

import Foundation
import Alamofire

struct Router {
    
    static let shared = Router()
 
    private var baseUrl: URL {
        URL(string: ServiceValues.baseURL.rawValue)!
    }
    
    public func generateUrl(endpoint: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, isMultipart: Bool = false) throws -> URLRequest {
        var request = URLRequest(url: baseUrl.appendingPathComponent(endpoint))
        request.httpMethod = method.rawValue
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue(isMultipart ? "multipart/form-data" : "application/json", forHTTPHeaderField: "Content-Type")
        return try encoding.encode(request, with: parameters)
    }
}
