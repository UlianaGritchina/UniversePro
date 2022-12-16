//
//  DatePickerView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var date: Date
    let isShowing: Bool
    let findAction: () -> ()
    var body: some View {
        VStack {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .foregroundColor(.blue)
            Button(action: findAction) {
                Text("Find")
                    .frame(width: 150, height: 40)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.blue.cornerRadius(10))
            }
        }
        .padding()
        .background {
            Rectangle()
                .opacity(0)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
        }
        .padding()
        .opacity(isShowing ? 1 : 0)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(date: .constant(Date()), isShowing: true, findAction: {})
            .preferredColorScheme(.dark)
    }
}
