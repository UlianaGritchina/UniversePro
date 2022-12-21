//
//  ApodInfoView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import SwiftUI

struct ApodInfoView: View {
    let apod: Apod
    @State private var isFavorite = false
    var body: some View {
        ScrollView(showsIndicators: false) {
            Image(uiImage: (UIImage(data: apod.imageData ?? Data()) ?? UIImage(systemName: "heart"))!)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            HStack {
                VStack(alignment: .leading) {
                    Text(apod.copyright ?? "")
                    Text(apod.date ?? "title")
                        .font(.subheadline)
                }
                Spacer()
                
                CircleButtonView(
                    titel: isFavorite ? "❤️" : "🖤",
                    foregroundColor: isFavorite ? .purple : .gray) {
                        isFavorite.toggle()
                    }
            }
            .padding(.vertical)
            HStack {
                Text(apod.title ?? "title")
                    .font(.title)
                Spacer()
            }
            .padding(.bottom)
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
