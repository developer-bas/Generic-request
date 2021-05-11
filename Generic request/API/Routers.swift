//
//  Routers.swift
//  Generic request
//
//  Created by PROGRAMAR on 10/05/21.
//

import Foundation
import Alamofire

let headers: HTTPHeaders = [
    "Authorization": "",
    "Accept": "application/json"
]

enum  Router: URLRequestConvertible {
   
    
    case getFils
    case me
    
    
    var method : HTTPMethod{
        switch self {
        case .getFils:
            return .get
        case .me:
            return .get
        }
    }
        var path: String {
            switch self {
            case .getFils:
                return ""
            case .me:
               return "/me/"
            }
        }
        
    
   
    
        func asURLRequest() throws -> URLRequest {
            var urlRequest = try URLRequest(url: APIManager.shared.baseURLString + path, method: method)
            urlRequest.headers = headers
            
            switch self {
            case .getFils, .me:
              return  urlRequest
        
            default:
                break
            }
            return urlRequest
        }
        
}





