//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 29.08.24.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isEmailFormatValid(email: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
    
}
