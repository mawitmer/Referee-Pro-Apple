//
//  Referee_ProApp.swift
//  Referee Pro
//
//  Created by mawitmer on 12.11.2023.
//

import SwiftUI
import SwiftData

@main
struct Referee_ProApp: App {
    
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //.modelContainer(for: [TeamData.self, CategoryData.self])
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([TeamData.self, CategoryData.self])
        let config = ModelConfiguration("Referee", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Cound not configure the Container")
        }
        print(URL.documentsDirectory.path())
    }
}
