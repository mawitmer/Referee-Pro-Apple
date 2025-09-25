//
//  TeamEdit.swift
//  Referee Pro
//
//  Created by mawitmer on 03.01.2024.
//

import SwiftUI
import SwiftData

struct TeamEdit: View {
    
    let teams: TeamData
    let playerrange = 1...99
    
    @State private var teamname: String = ""
    @State var playernumber: Int = 1
    @State var playername: String = ""
    @State var selectedPlayer: PlayerData?
    
    //@State private var isEditing: Bool = false
    private var isEditing: Bool {
        selectedPlayer != nil
    }
    
    
    private var isFormValid: Bool {
        !teamname.isEmptyOrWithWhiteSpace
    }
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
            Form{
                Section {
                    Section {
                        TextField("loc_category_add_desc", text: $teamname)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .autocorrectionDisabled()
                    }
                }
                Section {
                    List {
                        let players = teams.players?.sorted(using: KeyPathComparator(\PlayerData.playernumber)) ?? []
                        ForEach(players) { sortedPlayer in
                            HStack {
                                Text("\(sortedPlayer.playernumber)").frame(width: 24, alignment: .trailing)
                                if let playername = sortedPlayer.playername, !playername.isEmpty {
                                    Text(playername)
                                }
                            }.onTapGesture{
                                selectedPlayer = sortedPlayer
                                playernumber = sortedPlayer.playernumber
                                if let playerimport = sortedPlayer.playername, !playerimport.isEmpty {
                                    playername = playerimport
                                }
                            }.contentShape(Rectangle())
                        }.onDelete { indexSet in
                            withAnimation {
                                indexSet.forEach { index in
                                    if let player2delete = teams.players?.sorted(using: KeyPathComparator(\PlayerData.playernumber))[index] {
                                        context.delete(player2delete)
                                    }
                                }
                            }
                        }
                    }
                } header: {
                    Text("loc_players")
                }
            }.onAppear {
                teamname = teams.teamname
            }
            Spacer()
            GroupBox {
                HStack {
                    Picker("loc_number_periods", selection: $playernumber) {
                        ForEach(playerrange, id: \.self) {
                            Text("\($0)").tag($0)
                        }.frame(width: 50)
                    }
                    TextField("Test2", text: $playername)
                        .autocorrectionDisabled()
                        .frame(width: 150)
                    Spacer()
                    if isEditing {
                        Button("Cancel"){
                            playernumber = 1
                            playername = ""
                            selectedPlayer = nil
                        }
                    }
                    Button(isEditing ? "Update" : "Create") {
                        if isEditing {
                            selectedPlayer?.playernumber = playernumber
                            selectedPlayer?.playername = playername
                            playernumber = 1
                            playername = ""
                            selectedPlayer = nil
                        } else {
                            let player = PlayerData(playername: playername, playernumber: playernumber)
                            teams.players?.append(player)
                            playernumber = 1
                            playername = ""
                        }
                    }.disabled(playername.isEmpty)
                }
            }.padding(.horizontal)
            Button("loc_update") {
                teams.teamname = teamname
                
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                
                dismiss()
            }
            .disabled(!isFormValid)
            .navigationTitle("loc_teams")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("loc_close") {
                        dismiss()
                    }
                }
            }
        }
}
