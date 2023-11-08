//
//  DecodeJSON.swift
//  Project_Web_Consuming
//
//  Created by Foundation09 on 07/11/23.
//

import Foundation

struct Info: Decodable{
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Results: Decodable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Decodable{
    let name: String
    let url: String
}

struct Location: Decodable{
    let name: String
    let url: String
}

struct General: Decodable{
    let info: Info
    let results: [Results]
}

