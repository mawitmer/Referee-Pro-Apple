//
//  ContentView.swift
//  Referee Pro
//
//  Created by mawitmer on 12.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Text("Tab Content 1").tabItem { Label("Spiel", systemImage: "figure.soccer") }.tag(1)
			Text("Tab Content 2").tabItem { Label("Events", systemImage: "timer") }.tag(2)
			Text("Tab Content 3").tabItem { Label("Kategorien", systemImage: "square.and.pencil") }.tag(3)
			Text("Tab Content 4").tabItem { Label("Mannschaften", systemImage: "person.2.fill") }.tag(4)
        }
    }
}

#Preview {
    ContentView()
}
