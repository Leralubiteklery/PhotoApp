//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 16.09.24.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled = false
    
    required init(formModelValidator: any PhotoApp.SignupModelValidatorProtocol, webService: any PhotoApp.SignupWebServiceProtocol, delegate: any PhotoApp.SignupViewDelegateProtocol) {
        // TO DO
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
}
