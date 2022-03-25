//
//  Artist.swift
//  SongPlay
//
//  Created by Mac on 24/03/22.
//

import Foundation
import SwiftyJSON


struct ArtistModel: Codable {
    
//    var resultCount: Int
    var results: [Artist]
    
    enum CodingKeys: String, CodingKey {
//        case resultCount
        case results
      }
    
    init(from decoder: Decoder) throws {
        let contianer = try decoder.container(keyedBy: CodingKeys.self)
//        self.resultCount = try contianer.decode(Int.self, forKey: .resultCount)
        self.results = try contianer.decode([Artist].self, forKey: .results)
    }
    
    
}


struct Artist: Codable {

//    var wrapperType: String
//    var artistId: Int
//    var collectionId: Int
    var artistName: String
//    var collectionName: String
//    var collectionCensoredName: String
//    var artistViewUrl: String
//    var collectionViewUrl: String
//    var artworkUrl60: String
    var artworkUrl100: String
//    var collectionPrice: Double
//    var collectionExplicitness: String
//    var trackCount: Int
//    var copyright: String
//    var country: String
//    var currency: String
//    var releaseDate: String
//    var primaryGenreName: String
    var previewUrl: String
//    var description: String
    
    enum CodingKeys: String, CodingKey {
//        case wrapperType
//        case artistId
//        case collectionId
        case artistName
//        case collectionName
//        case collectionCensoredName
//        case artistViewUrl
//        case collectionViewUrl
//        case artworkUrl60
        case artworkUrl100
//        case collectionPrice
//        case collectionExplicitness
//        case trackCount
//        case copyright
//        case country
//        case currency
//        case releaseDate
//        case primaryGenreName
        case previewUrl
//        case description
      }
    
    init(from decoder: Decoder) throws {
        let contianer = try decoder.container(keyedBy: CodingKeys.self)
        self.artworkUrl100 = try contianer.decode(String.self, forKey: .artworkUrl100)
        
//        self.wrapperType = try contianer.decode(String.self, forKey: .wrapperType)
//        self.artistId = try contianer.decode(Int.self, forKey: .artistId)
//        self.collectionId = try contianer.decode(Int.self, forKey: .collectionId)
        self.artistName = try contianer.decode(String.self, forKey: .artistName)
        self.previewUrl = try contianer.decode(String.self, forKey: .previewUrl)
//        self.collectionName = try contianer.decode(String.self, forKey: .collectionName)
    }
    
    
    
}
