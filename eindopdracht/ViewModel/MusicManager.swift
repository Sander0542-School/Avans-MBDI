//
//  ItemManager.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 17/02/2022.
//

import Foundation

class MusicManager: ObservableObject {
	
	@Published var tracks = [Tracks]()
	let manager = ApiManager()
	
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
		print(self.tracks)
		task.resume()
		enum AlbumsFetcherError: Error {
			case invalidURL
			case missingData
		}
	}
	
	func move(indices: IndexSet, newOffset: Int){
//		tracks.move(fromOffsets: indices, toOffset: newOffset)
	}
	
	func add(){
//		tracks.append()
	}
	
	func delete(at IndexSet: IndexSet){
//		for index in IndexSet {
//			tracks.remove(at: index)
//		}
		
	}
	
}
