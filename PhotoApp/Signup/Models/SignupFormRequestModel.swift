//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Lera Savchenko on 12.08.24.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
