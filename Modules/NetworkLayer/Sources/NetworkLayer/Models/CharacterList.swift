//
// CharacterList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CharacterList: Codable, JSONEncodable, Hashable {

    public var info: Info
    public var results: [CharacterModel]

    public init(info: Info, results: [CharacterModel]) {
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

