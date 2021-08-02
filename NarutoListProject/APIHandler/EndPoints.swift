//
//  EndPoints.swift
//  NarutoListProject
//
//  Created by Ge Ding on 8/1/21.
//

import Foundation

struct EndPoint {
    let scheme: String
    let host: String
    let path: String
    var query: [URLQueryItem]
}

/// List of all avaliable endPoints to build custom URLs
enum EndPoints {
    case search
}


/// All avaliable keys for additional query items
enum QueryParams: String {
    case q
}

// List of avaliable url builds
let endPointList: [EndPoints: EndPoint] = [
    .search: EndPoint(scheme: "https", host: Constants.BaseURL.rawValue, path: "/v3/search/anime", query: [])
]

