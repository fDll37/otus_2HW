//
//  EpisodeList.swift
//  
//
//  Created by Данил Менделев on 30.09.2022.
//

import Foundation

public struct EpisodeList: Codable {

    public var info: Info
    public var results: [Episode]

    public init(info: Info, results: [Episode]) {
        self.info = info
        self.results = results
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case info
        case results
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(results, forKey: .results)
    }

}
