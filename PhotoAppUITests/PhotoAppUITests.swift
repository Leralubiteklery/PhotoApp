//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Lera Savchenko on 30.10.24.
//

import XCTest

final class PhotoAppUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var phone: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        
        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        phone = app.textFields["phoneTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        phone = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
        
        
    }
    
    func testSignupViewController_WhenViewLoaded_RequiredUIElemntsAreEnabled() throws {
        
        
        // Access elements via static values
        //        let firstName = app.textFields["First name"]
        //        let lastName = app.textFields["Last name"]
        //        let email = app.textFields["Email"]
        //        let phone = app.textFields["Mobile phone"]
        //        let password = app.secureTextFields["Password"]
        //        let repeatPassword = app.secureTextFields["Repeat password"]
        //        let signupButton = app/*@START_MENU_TOKEN@*/.staticTexts["Sign up"]/*[[".buttons[\"Sign up\"].staticTexts[\"Sign up\"]",".staticTexts[\"Sign up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        // Access elements via unique identifiers
//        let firstName = app.textFields["firstNameTextField"]
//        let lastName = app.textFields["lastNameTextField"]
//        let email = app.textFields["emailTextField"]
//        let phone = app.textFields["phoneTextField"]
//        let password = app.secureTextFields["passwordTextField"]
//        let repeatPassword = app.secureTextFields["repeatPasswordTextField"]
//        let signupButton = app.buttons["signupButton"]
        
        
        XCTAssertTrue(firstName.isEnabled, "First name text field is not enabled for user interaction")
        XCTAssertTrue(lastName.isEnabled, "Last name text field is not enabled for user interaction")
        XCTAssertTrue(email.isEnabled, "Email text field is not enabled for user interaction")
        XCTAssertTrue(phone.isEnabled, "Mobile phone text field is not enabled for user interaction")
        XCTAssertTrue(password.isEnabled, "Password text field is not enabled for user interaction")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password text field is not enabled for user interaction")
        XCTAssertTrue(firstName.isEnabled, "First name text field is not enabled for user interaction")
        XCTAssertTrue(signupButton.isEnabled, "Signup button is not enabled for user interaction")
    }
    
    func testSignupViewController_WhenInvalidFormIsSubmitted_PresentsErrorAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("L")
        
        lastName.tap()
        lastName.typeText("S")
        
        email.tap()
        email.typeText("e")
        
        phone.tap()
        phone.typeText("1")
        
        password.tap()
        password.typeText("111")
        
        repeatPassword.tap()
        repeatPassword.typeText("222")
                
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An error alert dialog was not presented when invalid signup form was submitted")
    }
    
    func testSignupViewController_WhenValidFormIsSubmitted_PresentsSuccessAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("Lera")
        
        lastName.tap()
        lastName.typeText("Savchenko")
        
        email.tap()
        email.typeText("test@mail.com")
        
        phone.tap()
        phone.typeText("0123456789")
        
//        password.tap()
//        password.typeText("0123456789")
        UIPasteboard.general.string = "mypassword"
        password.tap()
        password.doubleTap()
        app.menuItems["Paste"].tap()
        
//        repeatPassword.tap()
//        repeatPassword.typeText("123456789")
        UIPasteboard.general.string = "mypassword"
        repeatPassword.tap()
        repeatPassword.doubleTap()
        app.menuItems["Paste"].tap()
                
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 5), "A success alert dialog was not presented when valid signup form was submitted")
    }
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
