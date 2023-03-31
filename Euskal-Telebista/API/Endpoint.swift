//
//  Endpoint.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import Foundation

protocol Endpoint {
    
    var httpMethod: String { get }
    var baseURLString: String { get }
    var path: String { get }
    var headers: [String: Any]? { get }
    var body: [String: Any]? { get }
    
}

extension Endpoint {
    
    var url: String {
        return baseURLString + path
    }
    
}
