//
//  SignupConstants.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 7.08.24.
//

import Foundation

struct SignupConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    static let lastNameMinLength = 2
    static let lastNameMaxLength = 15
    static let passwordMinLength = 8
    static let passwordMaxLength = 16
    static let phoneMinLength = 8
    static let phoneMaxLength = 15
    static let signupURLString = "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users"
}
