//
//  TVShowPlaylistEpisode.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-09.
//

import Foundation

struct TVShowPlaylistEpisode: Codable {
    let id: String
    let startDate: Date
    let endDate: Date?
    let pubDate: Date
    let imageURL: String
    let length: Int
    let language: String
    let title_EU: String
    let description_EU: String
}
