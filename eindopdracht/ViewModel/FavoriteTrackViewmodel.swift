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
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
	
	}
	
	func deleteItems(offsets: IndexSet) {
//		withAnimation {
//			offsets.map { items[$0] }.forEach(viewContext.delete)
//			
//			do {
//				try viewContext.save()
//			} catch {
//				// Replace this implementation with code to handle the error appropriately.
//				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//				let nsError = error as NSError
//				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//			}
//		}
	}
	
}
