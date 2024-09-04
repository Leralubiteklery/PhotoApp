//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 4.09.24.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(
        withForm formModel: SignupFormRequestModel,
        completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void
    )
}
