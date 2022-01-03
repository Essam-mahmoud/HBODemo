//
//  AppConstant.swift
//
//  Created by Essam Orabi on 19/09/2021.
//

import Foundation

class AppConstant: NSObject {

    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let  apiDomain = "https://api.themoviedb.org"

    static public var trendingMovies : String {
        return "\(apiDomain)/3/trending/movie/day?api_key=\(API_KEY)"
    }
    static public var trendingTV : String {
        return "\(apiDomain)/3/trending/tv/day?api_key=\(API_KEY)"
    }

    static public var upcomingMovies: String {
        return "\(apiDomain)/3/movie/upcoming?api_key=\(API_KEY)"
    }

    static public var popularMovies: String {
        return "\(apiDomain)/3/movie/popular?api_key=\(API_KEY)"
    }
}

enum statusCode {

    static let NOT_FOUND = 404
    static let OK = 200
    static let BAD_GATEWAY = 502
    static let SERVICE_UNAVAILABLE = 500
    static let NO_CONTENT = 204
    static let ACCEPTED = 201
    static let CREATED = 0
    static let UNAuthoried = 401


}

public enum State {
    case loading
    case showAlert
    case error
    case empty
    case populated
    case normal
    case refresh
}
