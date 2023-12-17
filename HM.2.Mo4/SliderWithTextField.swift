//
//  SliderView.swift
//  HM.2.Mo4
//
//  Created by Hrayr on 17/12/23.
//

import SwiftUI

struct SliderWithTextField: View {
    @Binding var value: Double
    let color: Color

    var body: some View {
        HStack {
            Text("\(String(format: "%.2f", value))")
                .foregroundColor(color)

            Slider(value: $value, in: 0...250)
                .accentColor(color)

            Spacer()

            ValueTextField(value: $value)
        }
        .padding(.horizontal)
    }
}

struct ValueTextField: View {
    @Binding var value: Double
    @State private var textValue: String = ""

    var body: some View {
        TextField("", text: Binding(
            get: { String(format: "%.2f", value) },
            set: {
                textValue = $0
                if let inputValue = Double($0) {
                    value = inputValue.clamped(to: 0...250)
                }
            }
        ))
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.decimalPad)
        .frame(width: 60)
    }
}

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}

