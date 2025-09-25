//
//  TeamData.swift
//  Referee Pro
//
//  Created by mawitmer on 03.01.2024.
//

import Foundation
import SwiftData

@Model
final class TeamData: Identifiable {
    
    @Attribute(.unique) var id: String = UUID().uuidString
    var teamname: String
    var players: [PlayerData]?
    
    
    init(teamname: String) {
        self.teamname = teamname
    }
}

