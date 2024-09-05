//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 5.09.24.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
