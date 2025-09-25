//
//  Matchview.swift
//  Referee Pro Watch App
//
//  Created by mawitmer on 13.11.2023.
//

import SwiftUI

struct Matchview: View {
    @State var _AlertClose: Bool = false
    @State var _ActiveAddHome: Bool = false
    @State var _ActiveAddGuest: Bool = false
    @State var _ActiveControl: Bool = false
    @State var _path: NavigationPath = NavigationPath()
    @State var _selectedTab: Int = 1


    var body: some View {

        TabView(selection: $_selectedTab) {
            VStack {
                NavigationStack (path: $_path) {
                    HStack {
                        NavigationLink(destination: GameInit()) {
                            Image(systemName: "doc.fill.badge.plus")
                            Text("loc_init")
                        }
                    }
                    HStack {
                        NavigationLink(destination: AddEvent()) {
                            Image(systemName: "plus.circle.fill")
                            Text("loc_home")
                        }.background(Color.red)
                            .clipShape(Capsule())
                            .foregroundColor(Color(red: 0.965, green: 0.737, blue: 0.737))
                        
                        NavigationLink(destination: AddEvent()) {
                            Image(systemName: "plus.circle.fill")
                            Text("loc_guest")
                        }.background(Color.green)
                            .clipShape(Capsule())
                            .foregroundColor(Color(red: 0.847, green: 0.976, blue: 0.839))
                    }
                    HStack {
                        Button {} label: {
                            Image(systemName: "arrow.forward.to.line")
                            Text("Next")
                        }
                        NavigationLink(value: "AppEnd") {
                            Image(systemName: "xmark")
                            Text("loc_end")
                            .onTapGesture {_AlertClose = true}
                        }.alert("Do you really want to exit?", isPresented: $_AlertClose) {
                            Button("Yes", role: .destructive) {
                                exit(EXIT_SUCCESS)
                            }
                            Button("No", role: .cancel) {
                            }
                        }
                        
                    }
                }
            }.tabItem {}.tag(1)
            VStack(alignment: .center, spacing: -1.0) {
                NavigationStack (path: $_path) {
                    ZStack {
                        HStack(alignment: .top) {
                            Text("14")
                                .font(.system(size: 60, weight: .bold, design: .default))
                                .frame(width: 96.0, height: 68)
                                .background(.red)
                                .cornerRadius(8)
                                .foregroundColor(Color(red: 0.965, green: 0.737, blue: 0.737))
                                .navigationDestination(isPresented: $_ActiveAddHome) {
                                    AddEvent()
                                }.onTapGesture {}
                                 .onLongPressGesture {
                                    _ActiveAddHome = true
                                }
                            Text("4")
                                .font(.system(size: 60, weight: .bold, design: .default))
                                .frame(width: 96.0, height: 68)
                                .background(.green)
                                .cornerRadius(8)
                                .foregroundColor(Color(red: 0.847, green: 0.976, blue: 0.839))
                                .navigationDestination(isPresented: $_ActiveAddGuest) {
                                    AddEvent()
                                }.onTapGesture {}
                                 .onLongPressGesture {
                                    _ActiveAddGuest = true
                                }
                        }
                    }
                    VStack(spacing: 0){
                        HStack{
                            Text("loc_periodtime")
                                .font(.system(size: 18, weight: .light, design: .default))
                                .frame(width: 96)
                            Text("23:34")
                                .font(.system(size: 32, weight: .semibold, design: .default))
                                .frame(width: 100.0)
                        }
                        .frame(width: 210, height: 42.0)
                        .border(Color(hue: 0.0, saturation: 0.043, brightness: 0.196))
                        HStack{
                            Text("loc_timeout")
                                .font(.system(size: 12, weight: .light, design: .default))
                                .frame(width: 96.0)
                            Text("loc_totaltime")
                                .font(.system(size: 12, weight: .light, design: .default))
                                .frame(width: 96.0)
                        }
                        .frame(width: 210, height: 18)
                        .background(Color(hue: 0.521, saturation: 0.03, brightness: 0.127))
                        HStack {
                            Text("01:47")
                                .font(.system(size:18, weight: .bold, design: .default))
                                .foregroundColor(Color.orange)
                                .frame(width: 100.0)
                            Text("61:12")
                                .font(.system(size:18, weight: .bold, design: .default))
                                .foregroundColor(Color.orange)
                                .frame(width: 100.0)
                        }
                        .frame(width: 210, height: 30
                        )
                        .border(Color(hue: 0.0, saturation: 0.043, brightness: 0.196))
                        HStack{
                            Image(systemName: "checkmark.gobackward")
                                .resizable(capInsets: EdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0))
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.gray)
                                .padding(.vertical, 4.0)
                            Image(systemName: "checkmark.gobackward")
                                .resizable(capInsets: EdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0))
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.gray)
                                .padding(.vertical, 4.0)
                            Image(systemName: "gobackward")
                                .resizable(capInsets: EdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0))
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.green)
                                .padding(.vertical, 4.0)
                        }
                        .frame(width: 210, height: 20)
                    }
                    .navigationDestination(isPresented: $_ActiveControl) {
                        Control()
                    }.onTapGesture {}
                     .onLongPressGesture {
                        _ActiveControl = true
                    }
                }.tabItem {}.tag(2)
            }
            Text("Tab Content 3").tabItem { Text("Tab Label 3") }.tag(3)
        }
    }
}

#Preview {
    Matchview()
}
