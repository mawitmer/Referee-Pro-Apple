//
//  EditCategory.swift
//  Referee Pro
//
//  Created by mawitmer on 02.01.2024.
//

import SwiftUI
import SwiftData

struct CategoryEdit: View {
    
    @State private var name = ""
    @State private var periods = 2
    @State private var periodtime = 5
    @State private var breaktime = 15
    @State private var overtimeperiods = 2
    @State private var overtime = 15
    @State private var overtimebreak = 5
    @State private var cupmode = false
    @State private var timeoutmode = true
    @State private var unit = String.localizedStringWithFormat(NSLocalizedString("loc_minutes", comment: "Einheit Minuten"))
    
    private var isFormValid: Bool {
        !name.isEmptyOrWithWhiteSpace
    }
    
    let categories: CategoryData
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let step = 1
    let periodrange = 1...5
    let periodtimerange = 1...45
    let breaktimerange = 1...15
    let cupmodestate = [true, false]
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form{
            Section {
                TextField("loc_category_add_desc", text: $name)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .autocorrectionDisabled()
                
                Toggle(isOn: $timeoutmode) {
                    Text("Timeout mode")
                }
                Toggle(isOn: $cupmode) {
                    Text("Cupmode")
                }
            }
            Section {
                Picker("loc_number_periods", selection: $periods) {
                    ForEach(periodrange, id: \.self) {
                        Text("\($0)").tag($0)
                    }
                }
                .pickerStyle(.automatic)
                Picker("loc_periodtime_add", selection: $periodtime) {
                    ForEach(periodtimerange, id: \.self) {
                        Text("\($0) \(unit)").tag($0)
                        
                    }
                }
                .pickerStyle(.automatic)
                Picker("loc_breaktime_add", selection: $breaktime) {
                    ForEach(breaktimerange, id: \.self) {
                        Text("\($0) \(unit)").tag($0)
                    }
                    
                }
                .pickerStyle(.automatic)
            }header: {
                Text("loc_regulartime_subtitel")
            }
            
            if cupmode == true {
                Section {
                    Picker("loc_number_periods", selection: $overtimeperiods) {
                        ForEach(periodrange, id: \.self) {
                            Text("\($0)").tag($0)
                        }
                    }
                    .pickerStyle(.automatic)
                    Picker("loc_periodtime_add", selection: $overtime) {
                        ForEach(periodtimerange, id: \.self) {
                            Text("\($0) \(unit)").tag($0)
                        }
                    }
                    .pickerStyle(.automatic)
                    Picker("loc_breaktime_add", selection: $overtimebreak) {
                        ForEach(breaktimerange, id: \.self) {
                            Text("\($0) \(unit)").tag($0)
                        }
                    }
                    .pickerStyle(.automatic)
                } header: {
                    Text("loc_overtime_subtitel")
                } footer: {
                    Text("loc_overtime_desc")
                }
                
            }
            
            
        }.onAppear {
            name = categories.name
            periods = categories.periods
            periodtime = categories.periodtime
            breaktime = categories.breaktime
            overtimeperiods = categories.overtimeperiods
            overtime = categories.overtime
            overtimebreak = categories.overtimebreak
            cupmode = categories.cupmode
            timeoutmode = categories.timeoutmode
        }
        Spacer()
        Button("loc_update") {
            categories.name = name
            categories.periods = periods
            categories.periodtime = periodtime
            categories.breaktime = breaktime
            categories.overtimeperiods = overtimeperiods
            categories.overtime = overtime
            categories.overtimebreak = overtimebreak
            categories.cupmode = cupmode
            categories.timeoutmode = timeoutmode
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            
            dismiss()
        }
        .disabled(!isFormValid)
        .navigationTitle("loc_category")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("loc_close") {
                    dismiss()
                }
            }
        }
    }
}
