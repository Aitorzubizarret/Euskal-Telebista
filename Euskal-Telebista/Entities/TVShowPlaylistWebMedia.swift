//
//  TVShowPlaylistWebMedia.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-03.
//

import Foundation

struct TVShowPlaylistWebMedia: Codable {
    let ID_WEB_MEDIA: String
    let ID: String
    let START_DATE: String
    //let END_DATE: ¿? // Nul
    let STILL_URL: String
    let THUMBNAIL_URL: String
    let LENGTH: Int
    let ASSET_ID: String
    let AUDIO_LANG_ID: String
    let IDIOMA: String
    let PRODUCT_CODE: String
    let ITEM_STATE: String
    let NAME_EU: String
    let NAME_ES: String
    let NAME_EN: String
    let NAME_FR: String
    let PARENTAL_RATING: String?
    let CHAPTER_EU: String
    let CHAPTER_ES: String
    let CHAPTER_EN: String
    let CHAPTER_FR: String
    let SHORT_DESC_EU: String
    let SHORT_DESC_ES: String
    let IS_ARCHIVE: String
    let ID_GEO_TYPE: String
    let CLASIF_AGE_ID: String
    let PUB_DATE: String
    let TAGS: [String]
    let BROADCST_DATE: String
    let BROADCST_CHANNEL: String
    let LAST_BROADCST_DATE: String
    let LAST_BROADCST_CHANNEL: String
    let STR_HLS_URL: String?
    //let STR_DASH_URL: ¿? // nil
    //let STR_DSH_URL: ¿? // nil
    let STR_DSH_AST: Int
    let STR_DVR: Int
    //let STR_START: ¿? // nil
    //let STR_END: ¿? // nil
    //let STR_MOD: ¿? // nil
    //let RELIABLE_START: ¿? // nil
    //let RELIABLE_END: ¿? // nil
    let STR_DELAY: Int
    let STR_START_DSH: Int
    let UNDEFINED_END: Int
    let CHAPTER: String
    let ID_WEB_PLAYLIST: String
    let PLAY_ORDEN: Int
    //let BALIOAK": [¿?]
}
