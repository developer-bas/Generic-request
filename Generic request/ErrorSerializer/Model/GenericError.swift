//
//  GenericError.swift
//  Generic request
//
//  Created by PROGRAMAR on 12/05/21.
//

// {
//    "message" : "Authentication required"
//    "status" : 401
//}


struct GenericErrorResponse: Decodable {
  let message: String
  let statusCode: Int
  
  
  enum CodingKeys: String, CodingKey {
    case message = "messaage"
    case statusCode = "status"
  }
  
  init(from decoder: Decoder) throws {
    let dataRootContainer = try decoder.container(keyedBy: CodingKeys.self)
   
    statusCode = try dataRootContainer.decode(Int.self, forKey: .statusCode)
    message = try dataRootContainer.decode(String.self, forKey: .message)
  }
}
