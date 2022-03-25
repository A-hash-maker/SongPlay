//
//  Artist.swift
//  SongPlay
//
//  Created by Mac on 24/03/22.
//

import Foundation
import SwiftyJSON

// MARK: - Artist
struct ArtistModel: Codable {
    let results: [Artist]
    let resultCount: Int
}

// MARK: - Result
struct Artist: Codable {
    let collectionExplicitness: String?
    let artistName: String?
    let previewURL: String?
    let artworkUrl100: String?
    let primaryGenreName: String?
    let releaseDate: String?
    let trackExplicitness: String?
    let collectionCensoredName: String?
    let collectionViewURL: String?
    let trackCensoredName: String?
    let trackViewURL: String?
    let collectionHDPrice, trackHDRentalPrice: Double?
    let collectionID: Int?
    let collectionPrice: Double?
    let kind: String?
    let collectionName: String?
    let trackHDPrice, trackRentalPrice: Double?
    let longDescription: String?
    let hasITunesExtras: Bool?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    let shortDescription: String?
    let artworkUrl30: String?
    let trackTimeMillis: Int?
    let wrapperType: String?
    let trackID: Int?
    let artworkUrl60: String?
    let trackCount: Int?
    let trackName: String?
    let contentAdvisoryRating: String?
    let country: String?
    let trackNumber: Int?
    let trackPrice: Double?
    let currency: String?
    let isStreamable: Bool?
    let artistID, discCount, discNumber: Int?
    let artistViewURL: String?
    let collectionArtistName: String?

    enum CodingKeys: String, CodingKey {
        case collectionExplicitness
        case artistName
        case previewURL
        case artworkUrl100, primaryGenreName, trackExplicitness, collectionCensoredName, releaseDate
        case collectionViewURL
        case trackCensoredName
        case trackViewURL
        case collectionHDPrice
        case trackHDRentalPrice
        case collectionID
        case collectionPrice, collectionName, kind
        case trackHDPrice
        case trackRentalPrice, longDescription, hasITunesExtras
        case collectionArtistID
        case collectionArtistViewURL
        case shortDescription, artworkUrl30, trackTimeMillis, wrapperType
        case trackID
        case artworkUrl60, trackCount, trackName, contentAdvisoryRating, country, trackNumber, trackPrice, currency, isStreamable
        case artistID
        case discCount, discNumber
        case artistViewURL
        case collectionArtistName
    }
}

//enum Explicitness: String, Codable {
//    case notExplicit = "notExplicit"
//}

//enum Country: String, Codable {
//    case usa = "USA"
//}
//
//enum Currency: String, Codable {
//    case usd = "USD"
//}

//enum Kind: String, Codable {
//    case featureMovie = "feature-movie"
//    case song = "song"
//}
