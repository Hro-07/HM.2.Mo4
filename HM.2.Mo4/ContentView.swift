//
//  ContentView.swift
//  HM.2.Mo4
//
//  Created by Hrayr on 16/12/23.
//
//

import SwiftUI

struct ContentView: View {
    @State private var redValue: Double = 0
    @State private var greenValue: Double = 0
    @State private var blueValue: Double = 0

    var body: some View {
        ZStack {
            Color(.darkGray)
                .ignoresSafeArea()
            VStack {
                Color(red: redValue / 250, green: greenValue / 250, blue: blueValue / 250)
                    .frame(height: 150)
                    .border(Color.white, width: 4)
                    .cornerRadius(10)
                    .padding()
                
                SliderWithTextField(value: $redValue, color: .red)
                SliderWithTextField(value: $greenValue, color: .green)
                SliderWithTextField(value: $blueValue, color: .blue)
                Spacer()
            }
           
        }
    }
}

#Preview {
    ContentView()
}






