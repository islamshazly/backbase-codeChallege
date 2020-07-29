//
//  APIService.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//
import Foundation
import Combine
 
// MARK: - App Error

enum AppError: Error {
    case impossible
    case errorDecode
}

// MARK: - APIClient

protocol APIClient {
    func fetchData<T: Decodable>(fileName: String) -> AnyPublisher<T, Error>
}

// MARK: - APIClientImplmentation
struct APIClientImplmentation: APIClient {
    
    func fetchData<T: Decodable>(fileName: String) -> AnyPublisher<T, Error> {
        
        let data =  LocalJsonReader.loadJson(name: fileName)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(T.self, from: data)
            
            return Just(response).mapError({ _ in AppError.impossible }).eraseToAnyPublisher()
        } catch {
            return Fail(error: AppError.errorDecode).eraseToAnyPublisher()
        }
        
    }
}
