//
//  ContentView.swift
//  Referee Pro Watch App
//
//  Created by mawitmer on 12.11.2023.
//

import SwiftUI

struct GameInit: View {
    @Environment(\.presentationMode) var presentation
    @State private var _selectedCategory = 0
    
   // let categories: CategoryData
    
    var body: some View {
        VStack(alignment: .center, spacing: 5.0) {
            Picker(selection: $_selectedCategory, label: Text("loc_category")) {
                //ForEach(categories.id.enumerated(), id: \.self) { index in
                //    Text("categories.name").tag(index)
                //}
            }
            .frame(height: 60.0)
            Picker(selection: .constant(1), label: Text("loc_hometeam")) {
                Text("Pfäffikon Da").tag(1)
                Text("Pfäffikon Db").tag(2)
                Text("9er Standard").tag(3)
                Text("11er Standard").tag(4)
            }
            .frame(height: 60.0)
            HStack {
                Button {} label: {
                    Image(systemName: "square.and.pencil")
                    Text("loc_setup")
                        .onTapGesture {
                            self.presentation.wrappedValue.dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    GameInit()
}
