//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 5.09.24.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    
    func successfulSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignupError) {
        //
    }
    
    

}
