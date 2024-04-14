//
//  SignInResponseModel.swift
//  Nalbur
//
//  Created by MERT MUTLU on 6.02.2024.
//

import Foundation



struct SignInResponseModel {
    var result: Bool
    var errorCode: String?
    var errorMessage: String?
    var user: UserModel?
}
