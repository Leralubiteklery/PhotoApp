//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 7.08.24.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < SignupConstants.passwordMinLength ||
            password.count > SignupConstants.passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength ||  firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isPhoneValid(phone: String) -> Bool {
        var returnValue = true
        
        if phone.count < SignupConstants.phoneMinLength || phone.count > SignupConstants.phoneMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isEmailFormatValid(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        
        return password == repeatPassword
    }
}
