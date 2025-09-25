//
//  PlayerData.swift
//  Referee Pro
//
//  Created by mawitmer on 04.01.2024.
//

import Foundation
import SwiftData

@Model
final class PlayerData: Identifiable {
    
    @Attribute(.unique) var id: String = UUID().uuidString
    var playernumber: Int
    var playername: String?
    
    
    init(playername: String, playernumber: Int) {
        self.playername = playername
        self.playernumber = playernumber
    }
    
    var teammember: TeamData?
    
}
