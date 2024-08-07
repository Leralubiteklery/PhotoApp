//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 7.08.24.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        let sut = SignupFormModelValidator()
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Lera")
        
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid should return TRUE for valid first name but returned FALSE")
    }

}
