//
//  MusicDetailView.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 30/03/2022.
//

import SwiftUI

struct MusicDetailView: View {
	
	let track: Track
	@StateObject var viewmodel = FavoriteTrackViewModel()
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		VStack (spacing: 16.0) {
			VStack() {
				Text("Directed by:")
					.font(.caption)
					.foregroundColor(.secondary)
				Text(track.artist.name)
					.font(.headline)
			}
			VStack() {
				Text("Duration:")
					.font(.caption)
					.foregroundColor(.secondary)
				Text(track.duration)
					.font(.headline)
			}
			Divider()
			HStack(){
				Text("Listeners:")
					.font(.caption)
					.foregroundColor(.secondary)
				Text(track.listeners)
					.font(.body)
			}
			
			Spacer()
			Button("Add to favorites") {
				viewmodel.addItem(trackName: track.name, artistName: track.artist.name)
				dismiss()
			}
			Spacer()
		}
    }
}
