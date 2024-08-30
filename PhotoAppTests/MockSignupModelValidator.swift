//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 29.08.24.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool {
        <#code#>
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        <#code#>
    }
    
    func isEmailFormatValid(email: String) -> Bool {
        <#code#>
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        <#code#>
    }
    
    var isFirstNameValidated: Bool = false
}
