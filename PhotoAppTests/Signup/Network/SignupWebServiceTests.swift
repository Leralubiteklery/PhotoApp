//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 12.08.24.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!
    
    override func setUp(){
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signupFormRequestModel = SignupFormRequestModel(firstName: "Lera", lastName: "Savchenko", email: "test@test.com", password: "12345")
        
    }
    
    override func tearDown() {
        
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        
        // Arrange
        let jsonString = "{\"status\":\"ok\" }"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            //Assert
            // "{\"status\":\"ok\" }"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains different JSON structure")
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unkown JSON response should have been nil")
            XCTAssertEqual(error, SignupErrors.responseModelParsingError, "The signup() method didn't return expected error")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expected")
        
        sut = SignupWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupErrors.invalidRequestURLStringError, "The signup() method did not return expected error for an invalidRequestURLStringError")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString takes place, the response model should be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}
