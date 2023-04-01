//
//  EndpointCases.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import Foundation

enum EndpointCases: Endpoint {
    
    case tvShow
    case tvShowDetail(id: Int)
    
    var httpMethod: String {
        switch self {
        case .tvShow:
            return "GET"
        case .tvShowDetail:
            return "GET"
        }
    }
    
    var baseURLString: String {
        switch self {
        case .tvShow:
            return "https://mam.eitb.eus/mam/REST/ServiceMultiweb/Grouplist/Clasification/MULTIWEBTV/8/"
        case .tvShowDetail:
            return "https://mam.eitb.eus/mam/REST/ServiceMultiweb/Grouplist/ByGroup/MULTIWEBTV/8/"
        }
    }
    
    var path: String {
        switch self {
        case .tvShow:
            return "PROGRAMAS"
        case .tvShowDetail(let id):
            return "\(id)"
        }
    }
    
    var headers: [String : Any]? {
        switch self {
        case .tvShow:
            return nil
        case .tvShowDetail:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .tvShow:
            return nil
        case .tvShowDetail:
            return nil
        }
    }
    
}
