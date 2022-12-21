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
            VStack {
                Image(uiImage: (UIImage(data: apod.imageData ?? Data()) ?? UIImage(named: "photo")!))
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
                .padding(.bottom)
                .padding(.horizontal)
            }
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding(.vertical)
            
            VStack {
                HStack {
                    Text(apod.title ?? "title")
                        .font(.title2)
                    Spacer()
                }
                .padding(.bottom)
                Text(apod.explanation ?? "text")
                    .multilineTextAlignment(.center)
                    .font(.system(.title3, design: .monospaced))
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
    }
}


struct ApodInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ApodInfoView(apod: FakeDataManager.shared.getApod())
    }
}
