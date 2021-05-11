//
//  Authetication.swift
//  Generic request
//
//  Created by PROGRAMAR on 10/05/21.
//

import Alamofire
import Foundation



class genericRequestInterceptor : RequestInterceptor  {
    
    var token: String?
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1NiwidXNlcm5hbWUiOiJqdWFuLmdhcmNpYUBkYWNvZGVzLmNvbS5teCIsImV4cCI6MTY1MjIzMTI0NywiZW1haWwiOiJqdWFuLmdhcmNpYUBkYWNvZGVzLmNvbS5teCJ9.J0XYwO5LzCBwrWeLVcaMcQkDwYHVO33zeOxHuEQlnro"
        
        var urlRequest = urlRequest
        
        if let token = token {
            urlRequest.headers.add(.authorization(bearerToken: token))
                  
                  completion(.success(urlRequest))
        }else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [:]  )))
        }
    }
    
}


struct OAuthCredential: AuthenticationCredential {
    let accessToken: String
    let refreshToken: String
    let userID: String
    let expiration: Date

    // Require refresh if within 5 minutes of expiration
    var requiresRefresh: Bool { Date(timeIntervalSinceNow: 60 * 5) > expiration }
}

//class OAuthAuthenticator: Authenticator {
//    func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
//        urlRequest.headers.add(.authorization(bearerToken: credential.accessToken))
//    }
//
//    func refresh(_ credential: OAuthCredential,
//                 for session: Session,
//                 completion: @escaping (Result<OAuthCredential, Error>) -> Void) {
//        // Refresh the credential using the refresh token...then call completion with the new credential.
//        //
//        // The new credential will automatically be stored within the `AuthenticationInterceptor`. Future requests will
//        // be authenticated using the `apply(_:to:)` method using the new credential.
//    }
//
//    func didRequest(_ urlRequest: URLRequest,
//                    with response: HTTPURLResponse,
//                    failDueToAuthenticationError error: Error) -> Bool {
//        // If authentication server CANNOT invalidate credentials, return `false`
//        return false
//
//        // If authentication server CAN invalidate credentials, then inspect the response matching against what the
//        // authentication server returns as an authentication failure. This is generally a 401 along with a custom
//        // header value.
//        // return response.statusCode == 401
//    }
//
//    func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
//        // If authentication server CANNOT invalidate credentials, return `true`
//        return true
//
//        // If authentication server CAN invalidate credentials, then compare the "Authorization" header value in the
//        // `URLRequest` against the Bearer token generated with the access token of the `Credential`.
//        // let bearerToken = HTTPHeader.authorization(bearerToken: credential.accessToken).value
//        // return urlRequest.headers["Authorization"] == bearerToken
//    }
//}
//




//
//
//var token: String?
//
//func adapt(_ urlRequest: URLRequest,
//           for session: Session,
//           completion: @escaping (Result<URLRequest, Error>) -> Void) {
//  var urlRequest = urlRequest
//
//    let accessToken: String?
//
//  if let accessToken = accessToken {
//    urlRequest.headers.add(.authorization(bearerToken: accessToken))
//    completion(.success(urlRequest))
//  } else {
//    completion(.failure(NSError(domain: "", code: 0, userInfo: [:])))
//  }
//}
