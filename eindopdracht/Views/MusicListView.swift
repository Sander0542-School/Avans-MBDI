//
//  MusiclistView.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 20/02/2022.
//

import SwiftUI

struct MusiclistView: View {
	
	@ObservedObject var manager: MusicManager

	
    var body: some View {
		NavigationView{
			List{
				ForEach(manager.tracks, id: \.self){ user in
					ForEach(user.track, id: \.self){ track in
						
						NavigationLink(destination: MusicDetailView(track: track)) {
							Text(track.name)
						}
					}
				}
			}
			.navigationBarTitle(Text("Music"), displayMode: .large)
		}
		.task{
			await manager.fetch()
		}
		
    }
}

struct MusiclistView_Previews: PreviewProvider {
    static var previews: some View {
        MusiclistView(manager: MusicManager())
    }
}
