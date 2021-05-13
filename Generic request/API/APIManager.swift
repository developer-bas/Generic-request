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
                    
//                case .failure(let error):
//                    completion(.failure(error))
                
                default:
                    break
                }
                
            
            }
            .response(responseSerializer: ErrorResponseSerializer()) { [weak self] response in
                guard let self = self else { return }
                print(response.value)
            }
    }
    
    func sendData<T>(data: Data, url: URLRequestConvertible, completion: @escaping (Result<T, Error>) -> Void)where T: Codable {
        session.upload(data, with: url, interceptor: genericRequestInterceptor())
            .responseDecodable(of: T.self) { response in
                debugPrint(response)
            }
    }
    
    
    // Pendiente 
    
    func sendMultipart<T: Codable>(completion: @escaping (Result<T, Error>) -> Void){
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(Data("one".utf8), withName: "one")
            multipartFormData.append(Data("two".utf8), withName: "two")
        }, to: "https://httpbin.org/post")
            .responseDecodable(of: T.self) { response in
                debugPrint(response)
            }

    }
        
    
}
