//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 4.09.24.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
   
    var isSignupMethodCalled: Bool = false
    
    func signup(withForm formModel: PhotoApp.SignupFormRequestModel, completionHandler: @escaping (PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        let responseModel = SignupResponseModel(status: "Ok")
        completionHandler(responseModel, nil)
    }
}
