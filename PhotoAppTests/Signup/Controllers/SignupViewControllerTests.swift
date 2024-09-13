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

    func testSignupViewController_WhenCreated_HasRequiredFieldsEmpty() throws {
       
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The firstNameTextField is not connected to IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lasttNameTextField is not connected to IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty whet the view controller initially loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Last name text field was not empty whet the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty whet the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty whet the view controller initially loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "", "Repeat password text field was not empty whet the view controller initially loaded")
        
    }

}
