//
//  ApiService.swift
//  WaiterApp
//
//  Created by Datu on 27/4/24.
//

import Foundation
import Alamofire

protocol ApiServiceType {
    
    func signIn(signInDTO request: SignInRequest, completion: @escaping (Result<Void, Error>) -> Void)
    func sendConfirmation(for phoneNumber: String, confirmationCode: String, completion: @escaping (Result<JwtInfoResponse, Error>) -> Void)
}

class ApiService: NSObject, ApiServiceType {
    
    private static func urlSessionConfig() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        
        configuration.httpAdditionalHeaders = [:]
        configuration.httpAdditionalHeaders?["Accept"] = "application/json"
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = 20
        
        return configuration
    }
    
    internal let encoder: JSONEncoder = JSONEncoder()
    internal let decoder: JSONDecoder = JSONDecoder()
    internal let dateFormatter: DateFormatter = DateFormatter()
    internal let afSession: Session = Session(configuration: ApiService.urlSessionConfig())
    
    // MARK: - Handler
    func handleResponse<T: Decodable>(of type: T.Type, response: DataResponse<T, AFError>, completion: @escaping (Result<T, Error>) -> Void) {
        switch response.result {
        case .success(let t):
            completion(.success(t))
        case .failure(let err):
            completion(.failure(self.handleError(data: response.data, error: err)))
        }
    }
    
    func handleEmptyResponse(response: DataResponse<Data?, AFError>, completion: @escaping (Result<Void, Error>) -> Void) {
        switch response.result {
        case .success:
            completion(.success(()))
        case .failure(let err):
            completion(.failure(handleError(data: response.data, error: err)))
        }
    }
    
    private func handleError(data d: Data?, error: Error) -> Error {
        print(">>>>> Error: code \((error as? AFError)?.responseCode ?? 0), message: \(error.localizedDescription)")
        if let data = d, let message = String(data: data, encoding: .utf8) {
            print(">>>>> Error message: \(message)")
            return error
        } else {
            return error
        }
    }
    
    func signIn(signInDTO request: SignInRequest, completion: @escaping (Result<Void, any Error>) -> Void) {
        afSession.request(
            ApiConstants.Authorization.authorizeUser(),
            method: .post,
            parameters: SignInRequest(phoneNumber: request.phoneNumber),
            encoder: JSONParameterEncoder.default
        ).validate().response { [weak self] (response) in
            self?.handleEmptyResponse(response: response, completion: completion)
        }
    }
    
    func sendConfirmation(for phoneNumber: String, confirmationCode: String, completion: @escaping (Result<JwtInfoResponse, Error>) -> Void) {
        afSession.request(
            ApiConstants.Registration.confirmCode(),
            method: .post,
            parameters: [
                "code": confirmationCode,
                "phoneNumber": phoneNumber
            ],
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable { [weak self] (response) in
            self?.handleResponse(of: JwtInfoResponse.self, response: response, completion: completion)
        }
    }
}
