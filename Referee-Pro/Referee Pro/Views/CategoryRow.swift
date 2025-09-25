//
//  ToDoListView.swift
//  Another ToDo App
//
//  Created by Joash Tubaga on 6/21/23.
//

import SwiftUI
import SwiftData

struct CategoryRow: View {
    
    @State private var unit = String.localizedStringWithFormat(NSLocalizedString("loc_minutes", comment: "Einheit Minuten"))

    let categories: [CategoryData]
    @Environment(\.modelContext) private var context
    
    private func deleteTodo(indexSet: IndexSet) {
        indexSet.forEach { index in
            let doto = categories[index]
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
            ForEach(categories, id: \.id) { todo in
                NavigationLink(value: todo) {
                    HStack{
                        VStack(alignment: .leading) {
                            Text(todo.name)
                                .font(.system(size: 16, weight: .bold, design: .default))
                            HStack {
                                if todo.cupmode == true {
                                    Image(systemName: "trophy.fill").frame(width: 14,height: 6)
                                    Text("loc_cuptrue")
                                } else {
                                    Image(systemName: "list.bullet.rectangle.portrait").frame(width: 14,height: 10)
                                    Text("loc_cupfalse")
                                }
                                Text("loc_periodname")
                                Text(String(todo.periods)+"x"+String(todo.periodtime)+" "+unit)
                                
                            }.font(.system(size: 12, weight: .light, design: .default))
                        }
                        
                        
                        Spacer()
                    }
                }
            }.onDelete(perform: deleteTodo)
        }.navigationDestination(for: CategoryData.self) { categoryEdit in
            CategoryEdit(categories: categoryEdit)
        }
    }
}
