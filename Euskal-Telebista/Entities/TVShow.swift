//
//  TVShow.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import Foundation

struct TVShow: Codable {
    let ID_WEB_GROUP: Int
    let ORDEN: Int
    let NOMBRE_GROUP: String
    let SHORT_DESC: String
    let VIEW_MODE: Int
    let images: [ImageData]
    let web_playlist: [Playlist]
    // let balioak: [¿?] // Array of something.
}
