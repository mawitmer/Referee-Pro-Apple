//
//  Categories.swift
//  Referee Pro
//
//  Created by mawitmer on 17.12.2023.
//

import Foundation
import SwiftUI

struct Categories: Hashable, Codable, Identifiable {
    var id: Int
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
}
