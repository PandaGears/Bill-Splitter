//
//  ContentView.swift
//  BiruSpiritah
//
//  Created by Tamara Radloff on 2022/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var total = ""
    @State private var people = 4
    @State private var tipIndex = 2
    let tipPercentage = [0, 5, 10, 15, 20, 25]
    
    func calcTotal() -> Double{
        let tip = Double(tipPercentage[tipIndex])
        let orderTotal = Double(total) ?? 0
        let finalAmount = ((orderTotal / 100 * tip) + orderTotal)
        return finalAmount / Double(people)
    }
    
    func checkOnlyNum(text: String) -> Bool{
        var check: Bool = true
        for char in text{
            if "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm".contains(char) {
                check = false
            }
            else if "!@#$%^&*()_+-={}[];:'|,./<>?\"\\".contains(char){
                check = false
            }
        }
        return check
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Put your Total here")){
                    TextField("Put the total here", text: $total)
                        .keyboardType(.decimalPad)
                        .frame(width: 300)
                    if checkOnlyNum(text: total) == false {
                        Text("I need Numbers here please dumbass")
                            .foregroundColor(Color.red)
                    }
                    
                }
            
                Section(header: Text("Just the tip...")){
                    Picker("Tip Percentage", selection: $tipIndex){
                        ForEach(0 ..< tipPercentage.count){
                            Text("\(tipPercentage[$0])%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("How many in this harem?")){
                    Picker("Head Count", selection: $people){
                        ForEach(0 ..< 30){
                            Text("\($0) people")
                        }
                    }
                }
            
            
                Section(header: Text("Here, now you can say you can math")){
                    Text("R \(calcTotal(), specifier: "%.2f")")
                }
            }
            .navigationTitle("Split dat bill!")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
