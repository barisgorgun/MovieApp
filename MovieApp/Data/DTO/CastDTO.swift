//
//  CastDTO.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

struct CreditsResponseDTO: Decodable {
    let cast: [CastDTO]
}

struct CastDTO: Decodable {
    let id: Int?
    let name: String?
    let character: String?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case character
        case profilePath = "profile_path"
    }
}
