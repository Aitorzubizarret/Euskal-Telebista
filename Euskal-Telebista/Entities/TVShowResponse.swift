//
//  TVShowResponse.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import Foundation

struct TVShowResponse: Codable {
    let timestamp: String
    let vod_url: String
    let num: Int
    let web_group: [TVShow]
}
