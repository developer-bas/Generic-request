//
//  ResponseError.swift
//  Generic request
//
//  Created by PROGRAMAR on 12/05/21.
//

import Foundation

enum ResponseError: Error {
  case connection
  case authentication(message: String)
  case server(message: String)
}

extension ResponseError {
  var localizedDescription: String {
    switch self {
    case let .authentication(message):
      return message
    case let .server(message: message):
      return message
    case .connection:
      return "Check your internet connection"
    }
  }
  
  var isAuthenticationError: Bool {
    if case .authentication = self {
      return true
    }
    return false
  }
}
