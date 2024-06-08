//
//  Graphs.swift
//  poke-adventru
//
//  Created by Lorenzo Reinoso on 07/06/24.
//

import Charts
import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var type: String
    var value: Double
}


struct Graphs: View {
    let items: [Item] = [
        Item(type: "eng", value: 10),
        Item(type: "esp", value: 20),
        Item(type: "itl", value: 30),
        Item(type: "JPN", value: 40),
    ]
    var body: some View {
        NavigationView(){
            ScrollView{
                Chart(items){ item in
                    BarMark(
                        x:. value("Department", item.type),
                        y:. value("Profit", item.value)
                    )
                    .foregroundStyle(Color.green.gradient)
                }
                .frame(height: 200)
                .padding()
                Chart(items){ item in
                    LineMark(
                        x:. value("Department", item.type),
                        y:. value("Profit", item.value)
                    )
                    .foregroundStyle(Color.green.gradient)
                }
                .frame(height: 200)
                .padding()
                Chart(items){ item in
                    AreaMark(
                        x:. value("Department", item.type),
                        y:. value("Profit", item.value)
                    )
                    .foregroundStyle(Color.green.gradient)
                }
                .frame(height: 200)
                .padding()
                Chart(items){ item in
                    PointMark(
                        x:. value("Department", item.type),
                        y:. value("Profit", item.value)
                    )
                    .foregroundStyle(Color.green.gradient)
                }
                .frame(height: 200)
                .padding()
                Chart(items){ item in
                    SectorMark(angle: .value("valor", item.value)
                    )
                    .foregroundStyle(by: .value("name", item.type)
                    )
                }
                .chartLegend(.hidden)
                .frame(height: 200)
                .padding()
                
            }
            .navigationTitle("Charts")
        }
    }
}
