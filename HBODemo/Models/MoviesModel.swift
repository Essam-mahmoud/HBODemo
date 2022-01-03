//
//  MoviesModel.swift
//  HBODemo
//
//  Created by Essam Orabi on 01/01/2022.
//

import Foundation

class TrendingMovies: Codable {
    let results: [Movie]?

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Movie].self, forKey: .results)
    }

}

class Movie: Codable {
    let id: Int?
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int?
    let release_date: String?
    let vote_average: Double?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case media_type = "media_type"
        case original_name = "original_name"
        case original_title = "original_title"
        case poster_path = "poster_path"
        case overview = "overview"
        case vote_count = "vote_count"
        case release_date = "release_date"
        case vote_average = "vote_average"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
        original_name = try values.decodeIfPresent(String.self, forKey: .original_name)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
    }
}

