//
//  EndpointCases.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import Foundation

enum EndpointCases: Endpoint {
    
    case tvShows
    case tvShowDetail(id: Int)
    case tvShowPlaylistDetail(id: Int)
    
    var httpMethod: String {
        switch self {
        case .tvShows:
            return "GET"
        case .tvShowDetail:
            return "GET"
        case .tvShowPlaylistDetail:
            return "GET"
        }
    }
    
    var baseURLString: String {
        switch self {
        case .tvShows:
            return "https://mam.eitb.eus/mam/REST/ServiceMultiweb/Grouplist/Clasification/MULTIWEBTV/8/"
        case .tvShowDetail:
            return "https://mam.eitb.eus/mam/REST/ServiceMultiweb/Grouplist/ByGroup/MULTIWEBTV/8/"
        case .tvShowPlaylistDetail:
            return "https://mam.eitb.eus/mam/REST/ServiceMultiweb/Playlist2/MULTIWEBTV/"
        }
    }
    
    var path: String {
        switch self {
        case .tvShows:
            return "PROGRAMAS"
        case .tvShowDetail(let id):
            return "\(id)"
        case .tvShowPlaylistDetail(let id):
            return "\(id)"
        }
    }
    
    var headers: [String : Any]? {
        switch self {
        case .tvShows:
            return nil
        case .tvShowDetail:
            return nil
        case .tvShowPlaylistDetail:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .tvShows:
            return nil
        case .tvShowDetail:
            return nil
        case .tvShowPlaylistDetail:
            return nil
        }
    }
    
}
