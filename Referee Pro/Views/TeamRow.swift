//
//  TeamRow.swift
//  Referee Pro
//
//  Created by mawitmer on 03.01.2024.
//

import SwiftUI
import SwiftData

struct TeamRow: View {
    
    @State private var unit = String.localizedStringWithFormat(NSLocalizedString("loc_minutes", comment: "Einheit Minuten"))

    let teams: [TeamData]
    @Environment(\.modelContext) private var context
    
    func deleteTodo(indexSet: IndexSet) {
        indexSet.forEach { index in
            let doto = teams[index]
            context.delete(doto)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(teams, id: \.id) { todo in
                NavigationLink(value: todo) {
                    HStack{
                        VStack(alignment: .leading) {
                            Text(todo.teamname)
                                .font(.system(size: 16, weight: .bold, design: .default))
                        }
                        
                        
                        Spacer()
                    }
                }
            }.onDelete(perform: deleteTodo)
        }.navigationDestination(for: TeamData.self) { teamEdit in
            TeamEdit(teams: teamEdit)
        }
    }
}
