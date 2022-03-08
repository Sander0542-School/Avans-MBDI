//
//  ApiManager.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 17/02/2022.
//

import Foundation

class ApiManager{
//	func fetchAlbumWithAsyncURLSession() async throws -> [Tracks] {
//
//		guard let url = URL(string:"https://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=netherlands&api_key=eb1aa0867d22ee58d2ed95eeaf6320be&format=json") else {
//			throw AlbumsFetcherError.invalidURL
//		}
//
//		// Use the async variant of URLSession to fetch data
//		// Code might suspend here
//		let (data, _) = try await URLSession.shared.data(from: url)
//
//		// Parse the JSON data
//		let musicResult = try JSONDecoder().decode(Music.self, from: data)
//		return musicResult.tracks
//	}
//
//	enum AlbumsFetcherError: Error {
//		case invalidURL
//		case missingData
//	}
	
//	func fetchAlbumWithAsyncURLSession() throws -> [Tracks] {
//		
//		var tracks : [Tracks]
//		
//		guard let url = URL(string:"https://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=netherlands&api_key=eb1aa0867d22ee58d2ed95eeaf6320be&format=json") else {
//			throw AlbumsFetcherError.invalidURL
//		}
//		
//		let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//			guard let data = data, error == nil else{
//				return
//			}
//			
//			do{
//				let musicResult = try JSONDecoder().decode(Music.self, from: data)
//				DispatchQueue.main.async {
//					tracks = musicResult.tracks
//				}
//				
//			}
//			catch{
//				print(error)
//			}
//			
//		}
//		return tracks
//	}
	
	enum AlbumsFetcherError: Error {
		case invalidURL
		case missingData
	}
}




