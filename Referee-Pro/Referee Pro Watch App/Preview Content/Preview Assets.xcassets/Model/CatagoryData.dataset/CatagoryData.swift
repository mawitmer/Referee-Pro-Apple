//
//  CatagoryData.swift
//  Referee Pro
//
//  Created by mawitmer on 31.12.2023.
//

import Foundation
import SwiftData

@Model
final class CategoryData: Identifiable {
    
    @Attribute(.unique) var id: String = UUID().uuidString
    var name: String
    var periods: Int
    var periodtime: Int
    var breaktime: Int
    var cupmode: Bool
    var timeoutmode: Bool
    var overtimemode: Bool
    var overtimeperiods: Int
    var overtime: Int
    var overtimebreak: Int
    
    init(id: String = UUID().uuidString, name: String, periods: Int, periodtime: Int, breaktime: Int, cupmode: Bool, timeoutmode: Bool, overtimeperiods: Int, overtime: Int, overtimebreak: Int) {
        self.id = id
        self.name = name
        self.periods = periods
        self.periodtime = periodtime
        self.breaktime = breaktime
        self.cupmode = cupmode
        self.timeoutmode = timeoutmode
        self.overtimemode = false
        self.overtimeperiods = overtimeperiods
        self.overtime = overtime
        self.overtimebreak = overtimebreak
    }

}
