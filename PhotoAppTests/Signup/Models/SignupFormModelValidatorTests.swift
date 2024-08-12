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
    
    func testSignupFormModelValidator_WhenValidLastNameIsProvided_ShouldReturnTrue() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "Savchenko")
        
        XCTAssertTrue(isLastNameValid, "The isLastNameValid should return TRUE for valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameIsProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "S")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should return FALSE for a first name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameIsProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "SavchenkoSavchenkoSavchenko")
        
        XCTAssertFalse(isLastNameValid, "The isFirstNameValid() should return FALSE for a first name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidEmailIsProvided_ShouldReturnTrue() {
        
        let isValidEmail = sut.isEmailFormatValid(email: "lera@gmail.com")
        
        XCTAssertTrue(isValidEmail, "The isEmailValid should return TRUE for valid email but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "12345678")
        
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch should return TRUE for matching passwords, but it returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNonMatchingPasswordsProvided_ShouldReturnFalse() {
        
        let doPasswordsMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234567")
        
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch should return FALSE for non-matching passwords, but it returned TRUE")
    }
}
