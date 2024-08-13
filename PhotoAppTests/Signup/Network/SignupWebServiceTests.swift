//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Lera Savchenko on 12.08.24.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        let jsonString = "{\"status\":\"ok\" }"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebService(urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users")
        
        let signupFormRequestModel = SignupFormRequestModel(firstName: "Lera", lastName: "Savchenko", email: "test@test.com", password: "12345")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            // "{\"status\":\"ok\" }"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
}
