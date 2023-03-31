//
//  APIManagerProtocol.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import Foundation

protocol APIManagerProtocol: AnyObject {
    
    var session: URLSession { get }
    
    func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
    
}
