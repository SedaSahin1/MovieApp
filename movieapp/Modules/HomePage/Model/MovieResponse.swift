//
//  MovieResponse.swift
//  movieapp
//
//  Created by Seda Şahin on 17.09.2023.
//

import Foundation

final class MovieResponse: Decodable {
    let Search: [Movie]?
}
final class Movie: Decodable {
    let Title: String?
    let Year: String?
    let imdbID: String?
    let `Type`: String?
    let Poster: String?
}
