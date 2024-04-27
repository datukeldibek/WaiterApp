//
//  AuthApiService.swift
//  WaiterApp
//
//  Created by Datu on 27/4/24.
//

import Foundation

import Foundation
import KeychainAccess
import Alamofire

protocol AuthServiceType: RequestInterceptor {
    var isAuthorizing: Bool { get }
    var isAuthorized: Bool { get }
    
    func logout()
    
    // MARK: - Authorization
    func authorizeUser(user: SignInRequest, completion: @escaping (Result<Void, Error>) -> Void)
    func confirmAuthCode(for phoneNumber: String, confirmationCode: String, completion: @escaping (Result<JwtInfoResponse, Error>) -> Void)
}

class AuthApiService: NSObject, AuthServiceType {
    
    enum SignInResult: Hashable {
        case authorized
    }
    
    enum AuthError: String, Error {
        case tokenExpired
    }
    
    private var webApi: ApiServiceType!
    private var currentToken: JwtInfoResponse?
    private let keychain: Keychain = Keychain()
    private var keyValueStore: KeyValueStoreType
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private let lock = NSLock()
    private var requestsToRetry: [(RetryResult) -> Void] = []
    
    let tokenKey = "waiter.app.datuberry"

    var isAuthorized: Bool {
        guard let token = currentToken else { return false }
        return !token.jwtTokenExpired
    }
    
    private(set) var isAuthorizing: Bool = false
    
    init(keyValueStore: KeyValueStoreType) {
        self.keyValueStore = keyValueStore
        self.webApi = ApiService()
        super.init()
        self.configure()
    }
    
    
    func configure() {
        if let data = try? keychain.getData(tokenKey),
           let token = try? decoder.decode(JwtInfoResponse.self, from: data) {
            self.currentToken = token
        } else {
            try? keychain.remove(tokenKey)
        }
    }
    
    func authorizeUser(user: SignInRequest, completion: @escaping (Result<Void, any Error>) -> Void) {
        webApi.signIn(signInDTO: user, completion: completion)
    }
    
    func confirmAuthCode(for phoneNumber: String, confirmationCode: String, completion: @escaping (Result<JwtInfoResponse, any Error>) -> Void) {
        webApi.sendConfirmation(for: phoneNumber, confirmationCode: confirmationCode, completion: completion)
    }
    
    func logout() {
        currentToken = nil
        try? keychain.remove(tokenKey)
        
        keyValueStore.removeValue(forKey: .currentUser)
        keyValueStore.removeValue(forKey: .userLoggedIn)
    }
}

