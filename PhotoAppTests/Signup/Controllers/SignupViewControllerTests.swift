//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 12.09.24.
//

import XCTest
@testable import PhotoApp

final class SignupViewControllerTests: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: SignupViewController!

    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        sut = nil
    }

    func testSignupViewController_WhenCreated_HasRequiredFieldsEmpty() {
       
        XCTAssertEqual(sut.firstNameTextField.text, "", "First name text field was not empty whet the view controller initially laoded")
        XCTAssertEqual(sut.lastNameTextField.text, "", "Last name text field was not empty whet the view controller initially laoded")
        XCTAssertEqual(sut.emailTextField.text, "", "Email text field was not empty whet the view controller initially laoded")
        XCTAssertEqual(sut.passwordTextField.text, "", "Password text field was not empty whet the view controller initially laoded")
        XCTAssertEqual(sut.repeatPasswordTextField.text, "", "Repeat password text field was not empty whet the view controller initially laoded")
        
    }

}
