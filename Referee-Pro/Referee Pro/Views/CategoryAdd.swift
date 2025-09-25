//
//  AddCategory.swift
//  Referee Pro
//
//  Created by mawitmer on 31.12.2023.
//

import SwiftUI
import SwiftData

struct CategoryAdd: View {
    
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
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let step = 1
    let periodrange = 1...5
    let periodtimerange = 1...45
    let breaktimerange = 1...15
    let cupmodestate = [true, false]
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        
        NavigationStack {
                
                
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
                        Text("This settings are used for Cup and Final games.")
                    }
                    
                }
                
                
            }
            Spacer()
                Button("loc_save") {
                    let category = CategoryData(name: name, periods: periods, periodtime: periodtime, breaktime: breaktime, cupmode: cupmode, timeoutmode: timeoutmode, overtimeperiods: overtimeperiods, overtime: overtime, overtimebreak: overtimebreak )
                    context.insert(category)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }.disabled(!isFormValid)
            .navigationTitle("loc_add")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("loc_close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CategoryAdd()
        .modelContainer(for: [CategoryData.self])
}
