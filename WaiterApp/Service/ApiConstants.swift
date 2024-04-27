//
//  ApiConstants.swift
//  WaiterApp
//
//  Created by Yryskeldi Nurlanbek on 27/4/24.
//

import Foundation

enum ApiConstants {
    
    static let baseUrl = URL(string: "http://34.16.203.253:8085/")!
    
    
    // MARK: - Registration
    enum Registration {
        static func registerUser() -> URL {
            baseUrl.appendingPathComponent("client/registration")
        }
        
        static func confirmCode() -> URL {
            baseUrl.appendingPathComponent("client/activate")
        }
    }
    
    // MARK: - Authorization
    enum Authorization {
        static func authorizeUser() -> URL {
            baseUrl.appendingPathComponent("user/auth")
        }
        
        static func confirmAuthorizationCode() -> URL {
            baseUrl.appendingPathComponent("client/login")
        }
    }
}
