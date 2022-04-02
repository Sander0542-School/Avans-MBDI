//
//  ItemManager.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 17/02/2022.
//

import Foundation

class MusicManager: ObservableObject {
	
	@Published var tracks = [Tracks]()
	

	init() {
		
	}
	
	func fetch() async{
		guard let url = URL(string:"https://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=netherlands&api_key=eb1aa0867d22ee58d2ed95eeaf6320be&format=json") else {
			return
		}
	   let task = URLSession.shared.welcomeTask(with: url) { music, response, error in
		 if let music = music {
			 DispatchQueue.main.async {
				 self.tracks.append(music.tracks)
			}
		 }
	   }
		task.resume()
		enum AlbumsFetcherError: Error {
			case invalidURL
			case missingData
		}
	}
	
}
