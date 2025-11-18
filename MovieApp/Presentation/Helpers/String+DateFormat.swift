//
//  String+DateFormat.swift
//  MovieApp
//
//  Created by Gorgun, Baris on 18.11.2025.
//

import Foundation

extension String {
    var formattedDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        if let date = formatter.date(from: self) {
            formatter.dateFormat = "MMM d, yyyy"
            return formatter.string(from: date)
        }
        return self
    }
}
