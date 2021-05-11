//
//  APIManager.swift
//  Generic request
//
//  Created by PROGRAMAR on 10/05/21.
//

import Alamofire
import Foundation

class APIManager {
  
    
    static let shared = APIManager()
    let session = Session.default
    public var baseURLString =
        "https://swapi.dev/api/films/"
    
    
    func genericRequest<T: Codable>(_ urlRequest: URLRequestConvertible,
                                    completion: @escaping (Result<T, Error>) -> Void ){
        session.request(urlRequest,interceptor: genericRequestInterceptor())
            .responseDecodable(of:T.self) { response  in
                
                
                switch response.result {
                case .success(let res):
                    if let code = response.response?.statusCode {
                        switch code {
                        case 200...299:
                            completion(.success(res))
                        default:
                            let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                            completion(.failure(error))
                            
                        }
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
                
            
            }
    }
        
    
}
