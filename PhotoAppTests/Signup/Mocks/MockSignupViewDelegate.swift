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
    
    func successfulSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignupError) {
        //
    }
    
    

}
