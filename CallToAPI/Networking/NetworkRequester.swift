//
//  NetworkRequester.swift
//  CallToAPI
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import Foundation

struct NetworkRequester {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default) ) {
        self.session = session
    }
    
    func requestService<T: Decodable>(request: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void) {
        session.dataTask(with: request.request, completionHandler: { data, response, requestError in
            if let requestError = requestError {
                completion(.failure(requestError))
                return
            }
            guard let dataResponse = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            // handling errors
            if let urlResponse = response as? HTTPURLResponse {
                switch urlResponse.statusCode {
                case 401:
                    completion(.failure(APIError.error401))
                    return
                case 404:
                    completion(.failure(APIError.error404))
                    return
                case 500:
                    if let jsonResponse = try? JSONDecoder().decode([String: String].self, from: dataResponse),
                        let message = jsonResponse["message"] {
                        completion(.failure(APIError.default(description: message)))
                        return
                    }
                    completion(.failure(APIError.error500))
                    return
                default: break
                }
            }
            do {
                let mappedResponse = try mapResponse(data: dataResponse, dataType: T.self)
                completion(.success(mappedResponse))
            } catch {
                print(error.localizedDescription)
                completion(.failure(APIError.invalidJSON))
            }
        }).resume()
    }
    
    private func mapResponse<T: Decodable>(data: Data, dataType: T.Type) throws -> T {
        let decoder: JSONDecoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
