//
//  ContentView.swift
//  Referee Pro
//
//  Created by mawitmer on 12.11.2023.
//
import Foundation
import SwiftUI
import SwiftData

struct ContentView: View {
	@State private var showCupOnly = false
	@State private var isPresentedTab3: Bool = false
	@State private var isPresentedTab4: Bool = false
	@State var _selectedTab: Int = 1
	@Query(sort: \CategoryData.id, order: .reverse) var categories: [CategoryData]
	@Query(sort: \TeamData.id, order: .reverse) var teams: [TeamData]
	
	var filteredCategories: [CategoryData] {
		categories.filter { id in
				(!showCupOnly || id.cupmode)
			}
		}
	
	var body: some View {
		NavigationView{
			TabView(selection: $_selectedTab) {
				
				Text("Tab Content 1").tabItem { Label("loc_game", systemImage: "figure.soccer") }.tag(1)
				Text("Tab Content 2").tabItem { Label("loc_events", systemImage: "timer") }.tag(2)
				NavigationStack {
					VStack {
						CategoryRow(categories: categories)
							.navigationTitle("loc_category")
					}
					.sheet(isPresented: $isPresentedTab3, content: {
						CategoryAdd()
					})
					.toolbar {
						ToolbarItem(placement: .topBarTrailing) {
							Button {
								isPresentedTab3 = true
							} label: {
								Image(systemName: "plus")
							}
						}
					}
				}
				.tabItem { Label("loc_category", systemImage: "square.and.pencil")}.tag(3)
				NavigationStack {
					VStack {
						TeamRow(teams: teams)
							.navigationTitle("loc_teams")
					}
					.sheet(isPresented: $isPresentedTab4, content: {
						TeamAdd()
					})
					.toolbar {
						ToolbarItem(placement: .topBarTrailing) {
							Button {
								isPresentedTab4 = true
							} label: {
								Image(systemName: "plus")
							}
						}
					}
				}.tabItem { Label("loc_teams", systemImage: "person.2.fill")}.tag(4)
				
			}
		}
	}
}

#Preview {
    ContentView()
		.modelContainer(for: [TeamData.self, CategoryData.self])
}
