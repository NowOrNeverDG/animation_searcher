//
//  EpisodeResult.swift
//  NarutoListProject
//
//  Created by Ge Ding on 8/1/21.
//

import Foundation

struct EpisodeResult: Codable {
    var results: [Anime]?
}

struct Anime: Codable {
    var image_url: String?
    var title: String?
    var synopsis: String?
    var score: Double?
    var start_date: String?
    var end_date: String?
}

