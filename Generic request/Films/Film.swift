//
//  Film.swift
//  Generic request
//
//  Created by PROGRAMAR on 10/05/21.
//

import Foundation


struct Film: Codable {
  let id: Int
  let title: String
  let openingCrawl: String
  let director: String
  let producer: String
  let releaseDate: String
  let starships: [String]
  
  enum CodingKeys: String, CodingKey {
    case id = "episode_id"
    case title
    case openingCrawl = "opening_crawl"
    case director
    case producer
    case releaseDate = "release_date"
    case starships
  }
}

struct Films:Codable {
  let count: Int
  let all: [Film]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}


struct Me : Codable {
    let id: Int
    let is_superuser: Bool
    let username :String
}
