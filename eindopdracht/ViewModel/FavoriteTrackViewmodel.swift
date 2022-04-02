//
//  FavoriteTrackViewmodel.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 20/02/2022.
//

import Foundation
import CoreData
class FavoriteTrackViewModel: ObservableObject {

	init(){
		
	}
	
	func addItem(trackName: String, artistName: String) {
	
		let track = FavoriteTrack(context: PersistenceController.shared.container.viewContext)
		track.name = trackName
		track.artist = artistName
		track.timestamp = Date()
		
			do {
				try PersistenceController.shared.container.viewContext.save()
			} catch {
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
	
	}
	
}
