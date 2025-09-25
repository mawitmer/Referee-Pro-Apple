//
//  AddEvent.swift
//  Referee Pro Watch App
//
//  Created by mawitmer on 20.11.2023.
//

import SwiftUI

struct AddEvent: View {
    @State var _selected = false
    @State var _selectedYellowCard = false
    @State var _selectedRedCard = false
    @State var _ownGoal = false
    @GestureState var _pressed = false
    @State var _path: NavigationPath = NavigationPath()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .center, spacing: 5.0) {
            NavigationStack (path: $_path) {
                HStack {
                    Button{} label: {
                        Image(systemName: "soccerball")
                        .onTapGesture {
                            _selected.toggle()
                            _selectedYellowCard = false
                            _selectedRedCard = false
                        }
                        .onLongPressGesture(minimumDuration: 1.0) {
                            _ownGoal.toggle()
                            _selected.toggle()
                            _selectedYellowCard = false
                            _selectedRedCard = false
                        }
                    }   .foregroundColor(_ownGoal ? Color.red : Color.white)
                        .background(_selected ? Color(hue: 1.0, saturation: 0.022, brightness: 0.279) : Color.clear)
                        .clipShape(Capsule())

                    Button {} label: {
                        Image(systemName: "rectangle.portrait.fill")
                        .onTapGesture {
                            _selectedYellowCard.toggle()
                            _selected = false
                            _selectedRedCard = false
                        }
                    }   .foregroundColor(/*@START_MENU_TOKEN@*/.yellow/*@END_MENU_TOKEN@*/)
                        .background(_selectedYellowCard ? Color(hue: 1.0, saturation: 0.022, brightness: 0.279) : Color.clear)
                        .clipShape(Capsule())
                    
                    Button {} label: {
                        Image(systemName: "rectangle.portrait.fill")
                        .onTapGesture {
                            _selectedRedCard.toggle()
                            _selected = false
                            _selectedYellowCard = false
                        }
                    }   .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                        .background(_selectedRedCard ? Color(hue: 1.0, saturation: 0.022, brightness: 0.279) : Color.clear)
                        .clipShape(Capsule())
                }
                HStack {
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Player")) {
                        Text("Spieler-1").tag(1)
                        Text("Spieler-2").tag(2)
                        Text("Spieler-3").tag(3)
                        Text("Spieler-4").tag(4)
                    }.labelsHidden()
                        .frame(height: 50.0)
                }
                HStack {
                    Button {} label: {
                        Image(systemName: "plus.circle.fill")
                        Text("loc_add")
                            .onTapGesture {
                                self.presentation.wrappedValue.dismiss()
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    AddEvent()
}
