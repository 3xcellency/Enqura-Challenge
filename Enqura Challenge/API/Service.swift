//
//  Service.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

import Foundation
import Alamofire
struct ServiceResult<T> {
    let response: T?
    let error: Error?
}
 
struct Service {
    
    static let shared = Service()
     
    func request<T:Codable>(endpoint url: String, model: T.Type, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, completion: @escaping (ServiceResult<T>) -> ()) {
        do{
            let urlConvertible = try Router.shared.generateUrl(endpoint: url, method: method, parameters: paramsWithTokens(parameters), encoding: encoding)
            AF.request(urlConvertible).responseData(dataPreprocessor: DataResponseSerializer.defaultDataPreprocessor, completionHandler: {
                response in
                switch response.result {
                    
                case .success(let success):
                    do {
                        let result = try JSONDecoder().decode(T.self, from: success)
                        completion(ServiceResult(response: result, error: nil))
                    }catch let error{
                        print(error)
                        completion(ServiceResult(response: nil, error: error))
                    }
                case .failure(let error):
                    completion(ServiceResult(response: nil, error: error))
                }
            })
        }catch let urlRequestError{
            completion(ServiceResult(response: nil, error: urlRequestError))
        }
    }
    let paramsWithTokens = { (params: Parameters?)  -> (Parameters?) in
        if var parameters = params {
            let timestamp = "\(Date().timeIntervalSince1970)"
            parameters["ts"] = timestamp
            parameters["hash"] = "\(timestamp)\(ServiceValues.privateKey.rawValue)\(ServiceValues.accessToken.rawValue)".md5
            parameters["apikey"] = ServiceValues.accessToken.rawValue
            return parameters
        }
        return params
    }
}
