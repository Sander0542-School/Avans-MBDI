//
//  FavoriteMusicListView.swift
//  eindopdracht
//
//  Created by Tommy den Reijer on 20/02/2022.
//

import SwiftUI

struct FavoriteMusicListView: View {
	
	@Environment(\.managedObjectContext) private var viewContext
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
		animation: .default)
	
	private var items: FetchedResults<FavoriteTrack>
	@State var showInfoModalView: Bool = false
	
    var body: some View {
		NavigationView {
			List {
				ForEach(items) { item in
					NavigationLink {
						Text(item.artist ?? "No Artist found")
					} label: {
						Text(item.name ?? "No Name found")
					}
				}
				.onDelete(perform: deleteItems)
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					EditButton()
				}
				ToolbarItem {
					Button(action: {
						showInfoModalView = true
					}, label: {
						Label("Show Info View", systemImage: "plus")
					})
				}
			}
//			Text("Select an item")
				.navigationBarTitle(Text("Favorite Tracks"), displayMode: .large)
		}
		
		.sheet(isPresented: $showInfoModalView) {
			AddFavoriteSheetView()
		}
    }
	
	
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			offsets.map { items[$0] }.forEach(viewContext.delete)
			
			do {
				try viewContext.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
		}
	}
}

private let itemFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateStyle = .short
	formatter.timeStyle = .medium
	return formatter
}()

struct FavoriteMusicListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMusicListView()
    }
}
