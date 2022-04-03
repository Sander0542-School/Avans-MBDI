//
//  ItemManager.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 17/02/2022.
//

import Foundation
import Network

class MusicManager: ObservableObject {
	
	@Published var tracks = [Tracks]()
	@Published var isConnected = true
	
	let monitor = NWPathMonitor()
	let queue = DispatchQueue(label: "NetworkManager")

	var connectionDescription: String {
		if isConnected {
			return "Internet connection looks good!"
		} else {
			return "It looks like you're not connected to the internet. Make sure WiFi is enabled and try again"
		}
	}

	init() {
		monitor.pathUpdateHandler = { path in
			DispatchQueue.main.async {
				self.isConnected = path.status == .satisfied
			}
		}
		
		monitor.start(queue: queue)
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
