//
//  Episode.swift
//  
//
//  Created by Данил Менделев on 30.09.2022.
//

import Foundation

public struct Episode: Codable, Identifiable{

    public var id: Int
    public var name: String
    public var airDate: String?
    public var episode: String
    public var url: String
    public var created: String?

    public init(id: Int, name: String, airDate: String? = nil, episode: String, url: String, created: String? = nil) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.url = url
        self.created = created
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case airDate = "air_date"
        case episode
        case url
        case created
    }

}
