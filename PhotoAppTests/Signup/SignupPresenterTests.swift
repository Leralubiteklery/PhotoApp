//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 28.08.24.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
        // Arrange
        let signupFormModel = SignupFormModel(
            firstName: "Lera",
            lastName: "Savchenko",
            email: "test@test.com",
            password: "12345678",
            repeatPassword: "12345678"
        )
        
        let mockSignupModelValidator = MockSignupModelValidator()
        
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailFormatValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated)
    }
   
}
