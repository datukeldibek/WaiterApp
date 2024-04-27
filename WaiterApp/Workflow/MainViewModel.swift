//
//  MainViewModel.swift
//  WaiterApp
//
//  Created by Datu on 27/4/24.
//

import Foundation

protocol AuthViewModelType {
    func authorizeUser(user: SignInRequest, completion: @escaping (Result<Void, Error>) -> Void)
    func confirmAuthCode(for phoneNumber: String, confirmationCode: String, completion: @escaping (Result<JwtInfoResponse, Error>) -> Void)
}

class MainViewModel: ObservableObject, AuthViewModelType {
    private let authService: AuthServiceType
    
    init(authService: AuthServiceType) {
        self.authService = authService
    }
    
    func authorizeUser(user: SignInRequest, completion: @escaping (Result<Void, Error>) -> Void) {
        authService.authorizeUser(user: user, completion: completion)
    }
     
    func confirmAuthCode(for phoneNumber: String, confirmationCode: String, completion: @escaping (Result<JwtInfoResponse, Error>) -> Void) {
        authService.confirmAuthCode(for: phoneNumber, confirmationCode: confirmationCode, completion: completion)
    }
}

