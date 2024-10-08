//
//  SignupPresenterPrtocol.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 16.09.24.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    
    init(
        formModelValidator: SignupModelValidatorProtocol,
        webService: SignupWebServiceProtocol,
        delegate: SignupViewDelegateProtocol
    )
    
    func processUserSignup(formModel: SignupFormModel)
}
