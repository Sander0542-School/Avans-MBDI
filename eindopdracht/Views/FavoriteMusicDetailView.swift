//
//  FavoriteMusicDetailView.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 01/04/2022.
//

import SwiftUI


struct FavoriteMusicDetailView: View {
	
	let artist: String
	@StateObject var viewmodel = MusicDetailViewModel()
	
    var body: some View {
		VStack (spacing: 16.0) {
			VStack() {
				Text("Artist:")
					.font(.caption)
					.foregroundColor(.secondary)
				Text(artist)
					.font(.headline)
			}
			
			Divider()
			
			Spacer()
			Button("Speak") {
				viewmodel.readText(artist)
			}
			Spacer()
		}
    }
}
