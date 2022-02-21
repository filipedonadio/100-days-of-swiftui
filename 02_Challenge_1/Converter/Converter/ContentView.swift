//
//  ContentView.swift
//  Converter
//
//  Created by Filipe Donadio on 21/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
    @State private var inputUnit = UnitTemperature.celsius
    @State private var outputUnit = UnitTemperature.fahrenheit
    @FocusState private var inputIsFocused: Bool
    
    let units: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    let formatter: MeasurementFormatter
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .short
    }
    
    var result: String {
        let inputTemperature = Measurement(value: input, unit: inputUnit)
        let outputTemperature = inputTemperature.converted(to: outputUnit)
        
        return formatter.string(from: outputTemperature)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Amount to convert")
                }
                
                Picker("Convert from", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text(formatter.string(from: $0))
                    }
                }
                
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text(formatter.string(from: $0))
                    }
                }
                
                Section {
                    Text(result)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
