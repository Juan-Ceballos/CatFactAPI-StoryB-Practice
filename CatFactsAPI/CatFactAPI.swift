//
//  CatFactAPI.swift
//  CatFactsAPI
//
//  Created by Juan Ceballos on 7/19/21.
//

import Foundation

class CatFactAPI {
    let baseURL = "https://catfact.ninja/"
    public static func fetchCatFact(completion: @escaping (Result<CatFact, AppError>) -> ()) {
        
        let urlEndpoint = "https://catfact.ninja/fact"
        
        guard let url = URL(string: urlEndpoint) else {
            completion(.failure(.badURL(urlEndpoint)))
            return
        }
        
        let urlRequest = URLRequest(url: url)
                
        NetworkHelper.shared.performDataTask(request: urlRequest) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let fact = try JSONDecoder().decode(CatFact.self, from: data)
                    completion(.success(fact))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}
