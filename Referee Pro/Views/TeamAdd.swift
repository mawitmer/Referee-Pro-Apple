//
//  TeamAdd.swift
//  Referee Pro
//
//  Created by mawitmer on 03.01.2024.
//

import SwiftUI
import SwiftData

struct TeamAdd: View {
    @State private var teamname: String = ""
    @State private var multiplicator: Int = 0
    @State var isSelected: Bool = false
    
    private var isFormValid: Bool {
        !teamname.isEmptyOrWithWhiteSpace
    }
    
    let playernumber = 1...9
    let rows = 0...10
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        
        NavigationStack {
                
                
           Form{
                Section {
                    TextField("loc_team_add_desc", text: $teamname)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .autocorrectionDisabled()
                }
                ForEach(rows, id: \.self) { playerRow in
                    HStack{
                        Section {
                            ForEach(playernumber, id: \.self) { counter in
                                Button{} label: {
                                    Text(String(counter+(playerRow*9))).font(.system(size: 14, weight: .regular, design: .default))
                                        .frame(width: 28, height: 28)
                                        .background(self.isSelected ? Color(hue: 0.068, saturation: 0.965, brightness: 0.932) : Color(hue: 1.0, saturation: 0.023, brightness: 0.892))
                                        .cornerRadius(5)
                                        .foregroundColor(Color(.gray))
                                }.onTapGesture(perform: {
                                    print(String(counter+(playerRow*9)))
                                })
                            }
                        }
                    }
                }
            }
            
            Spacer()
                Button("loc_save") {
                    let teams = TeamData(teamname: teamname)
                    context.insert(teams)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }.disabled(!isFormValid)
            .navigationTitle("loc_add")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("loc_close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    TeamAdd()
        .modelContainer(for: [TeamData.self])
}
