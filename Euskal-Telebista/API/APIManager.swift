//
//  APIManager.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import Foundation

final class APIManager {
    
    // MARK: - Properties (from APIManagerProtocol)
    
    var session: URLSession {
        let configuration = URLSessionConfiguration.ephemeral // Doesn't persist data.
        let session = URLSession(configuration: configuration)
        return session
    }
    
    // MARK: -
    
    var interactor: MainAPIManagerToInteractorProtocol?
    
}

// MARK: - APIManager Protocol

extension APIManager: APIManagerProtocol {
    
    func request<T>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        
        // URL
        let url: URL = URL(string: endpoint.url)!
        var urlReques = URLRequest(url: url)
        
        // HTTP Method
        urlReques.httpMethod = endpoint.httpMethod
        
        // Headers fields
        endpoint.headers?.forEach({ header in
            urlReques.setValue(header.value as? String, forHTTPHeaderField: header.key)
        })
        
        // Body
        if let bodyFields = endpoint.body {
            do {
                let jsonData: Data = try JSONSerialization.data(withJSONObject: bodyFields, options: [])
                urlReques.httpBody = jsonData
            } catch let error {
                print("Error creating the body fields in the Request method. \(error)")
            }
        }
        
        let task = session.dataTask(with: urlReques) { data, response, error in
            if let responseData = data {
                let receivedData: String = String(data: responseData, encoding: .utf8) ?? ""
                debugPrint("Data : \(receivedData) - Response")
                do {
                    let response = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        
    }
    
}


extension APIManager: MainInteractorToAPIManagerProtocol {
    
    func fetchTVShows() {
        let tvShowsEndpoint = EndpointCases.tvShow
        request(endpoint: tvShowsEndpoint) { (result: Result<TVShowResponse, Error>) in
            switch result {
            case .success(let tvShowSuccess):
                print("Success \(tvShowSuccess)")
                self.interactor?.fetchTVShowsSuccess()
            case .failure(let error):
                print("Error : \(error)")
                self.interactor?.fetchTVShowsFailure()
            }
        }
    }
    
}
