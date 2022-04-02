//
//  AddFavoriteSheetView.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 20/02/2022.
//

import SwiftUI

struct AddFavoriteSheetView: View {
	
	@Environment(\.presentationMode) var presentationMode
	
	@State var track: String = ""
	@State var artist: String = ""
	
	
	@StateObject var viewmodel = FavoriteTrackViewModel()
	
						  
    var body: some View {
		NavigationView {
			Form {
				Section(header: Text("TRACK")) {
					TextField("Track", text: $track)
					TextField("Artist", text: $artist)
				}
				Section {
					Button("Add track"){
						viewmodel.addItem(trackName: track, artistName: artist)
						presentationMode.wrappedValue.dismiss()
					}
				}
				.disabled(track.isEmpty || artist.isEmpty)
			}
			.navigationBarTitle("Settings")
		}
    }
}

struct AddFavoriteSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddFavoriteSheetView()
    }
}
