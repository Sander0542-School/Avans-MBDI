//
//  Album.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 17/02/2022.
//

import Foundation

struct ITunesResult: Codable {
	let results: [Album]
}

struct Album: Codable, Hashable {
	let collectionId: Int
	let collectionName: String
	let collectionPrice: Double
}
