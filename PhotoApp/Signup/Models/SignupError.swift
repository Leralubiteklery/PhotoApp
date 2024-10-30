//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 12.08.24.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case invalidFirstName
    case invalidLastName
    case invalidEmail
    case invalidPhone
    case invalidPassword
    case invalidRepeatPassword
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        case .invalidFirstName:
            return "invalidFirstName"
        case .invalidLastName:
            return "invalidLastName"
        case .invalidEmail:
            return "invalid email"
        case .invalidPhone:
            return "invalid phone"
        case .invalidPassword:
            return "invalid password"
        case .invalidRepeatPassword:
            return "invali repeat password"
        }
    }
    
}



