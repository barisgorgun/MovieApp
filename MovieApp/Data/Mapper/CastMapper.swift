//
//  CastMapper.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

extension CastDTO {

    func toDomain() -> Cast {
        Cast(
            id: id ?? 0,
            name: name ?? "",
            character: character ?? "",
            profilePath: profilePath
        )
    }
}

extension CreditsResponseDTO {
    
    func toDomain() -> [Cast] {
        cast.map { $0.toDomain() }
    }
}
