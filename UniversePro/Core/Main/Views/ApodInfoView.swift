//
//  ApodInfoView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import SwiftUI

struct ApodInfoView: View {
    let apod: Apod
    var body: some View {
        VStack {
            Image(uiImage: (UIImage(data: apod.imageData ?? Data()) ?? UIImage(systemName: "heart"))!)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            HStack {
                Spacer()
                Text(apod.date ?? "title")
                    .font(.subheadline)
            }
            HStack {
                Text(apod.title ?? "title")
                    .font(.title)
                Spacer()
            }
            .padding(.vertical)
            Text(apod.explanation ?? "text")
                .multilineTextAlignment(.center)
                .font(.system(.title2, design: .monospaced))
        }
    }
}

struct ApodInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ApodInfoView(apod: FakeDataManager.shared.getApod())
    }
}
