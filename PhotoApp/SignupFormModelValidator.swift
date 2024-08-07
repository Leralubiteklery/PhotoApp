//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 7.08.24.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.isEmpty {
            returnValue = false
        }
        
        return returnValue
    }
}
