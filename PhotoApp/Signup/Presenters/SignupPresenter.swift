//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 29.08.24.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    init(
        formModelValidator: SignupModelValidatorProtocol,
        webService: SignupWebServiceProtocol,
        delegate: SignupViewDelegateProtocol
    ) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return 
        }
        
        if !formModelValidator.isEmailFormatValid(email: formModel.email) {
            return 
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: requestModel) { [weak self] responseModel, error in
            // TO DO
            
            if let _ = responseModel {
                self?.delegate?.successfulSignup()
                return
            }
        }
        
    }
}
