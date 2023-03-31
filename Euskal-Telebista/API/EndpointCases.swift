//
//  EndpointCases.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import Foundation

enum EndpointCases: Endpoint {
    
    case tvShow
    
    var httpMethod: String {
        switch self {
        case .tvShow:
            return "GET"
        }
    }
    
    var baseURLString: String {
        switch self {
        case .tvShow:
            return "https://mam.eitb.eus/mam/REST/ServiceMultiweb/Grouplist/Clasification/MULTIWEBTV/8/"
        }
    }
    
    var path: String {
        switch self {
        case .tvShow:
            return "PROGRAMAS"
        }
    }
    
    var headers: [String : Any]? {
        switch self {
        case .tvShow:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .tvShow:
            return nil
        }
    }
    
}
