//
//  Control.swift
//  Referee Pro Watch App
//
//  Created by mawitmer on 13.11.2023.
//

import SwiftUI

struct Control: View {
    var body: some View {
        
        HStack{
            Button {} label: {
                Image(systemName: "pause.fill")
            }.background(Color(hue: 0.125, saturation: 0.976, brightness: 0.953, opacity: 0.485))
                .clipShape(Capsule())
            Button {} label: {
                Image(systemName: "forward.end.fill")
            }.clipShape(Capsule())
        }.opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
    }
    
}

#Preview {
    Control()
}
