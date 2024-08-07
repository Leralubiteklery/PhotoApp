//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 7.08.24.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        sut = nil
    }

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
                
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Lera")
        
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid should return TRUE for valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameIsProvided_ShouldReturnFalse() {
                
        let isFirstNameValid = sut.isFirstNameValid(firstName: "L")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameIsProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "LeraLeraLeraLera")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
}
