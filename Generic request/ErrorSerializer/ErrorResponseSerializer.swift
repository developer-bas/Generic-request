//
//  ErrorResponseSerializer.swift
//  Generic request
//
//  Created by PROGRAMAR on 12/05/21.
//

import Foundation
import Alamofire
class ErrorResponseSerializer: ResponseSerializer {
  func serialize(request: URLRequest?,
                 response: HTTPURLResponse?,
                 data: Data?,
                 error: Error?) throws -> ResponseError {
    
    guard let data = data else {
      return .connection
    }
    
    let errorResponse = try DecodableResponseSerializer<GenericErrorResponse>()
        .serialize(request: request, response: response, data: data, error: nil)
    
    return errorResponse.statusCode.isAuthenticationErrorCode() ? .authentication(message: errorResponse.message) : .server(message: errorResponse.message)
    
  }
    
    
}

extension Int {
  func isAuthenticationErrorCode() -> Bool {
    [401, 403].contains(self)
  }
}
