//
//  TVShowPlaylist.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-09.
//

import Foundation

struct TVShowPlaylist: Codable {
    let id: String
    let language: String
    let title_EU: String
    let description_EU: String
    let episodes: [TVShowPlaylistEpisode]
}
