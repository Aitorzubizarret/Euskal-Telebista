//
//  TVShowPlaylistResponse.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-03.
//

import Foundation

struct TVShowPlaylistResponse: Codable {
    let timestamp: String
    let id_web_playlist: String
    let id: String
    let name: String
    let name_playlist: String
    let desc_playlist: String
    let id_web_group: String
    let name_group: String
    let desc_group: String
    let audio_lang_id: String
    let idioma: String
    let clasificacion: String
    let tags: [String]
    let orden_field: String
    let orden_type: String
    let num: Int
    let web_media: [TVShowPlaylistWebMedia]
}
