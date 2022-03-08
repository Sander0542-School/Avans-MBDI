//
//  ContentView.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 16/02/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
	
	@ObservedObject var manager: MusicManager

    var body: some View {
		TabView {
			MusiclistView(manager: manager)
				.tabItem {
					Label("Music", systemImage: "list.dash")
				}
			
			FavoriteMusicListView()
				.tabItem {
					Label("favorite", systemImage: "star.fill")
				}
		}
		
		
    }

   
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: MusicManager()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
