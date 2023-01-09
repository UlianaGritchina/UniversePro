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
        VStack(spacing: 0) {
            Image(uiImage: (UIImage(data: apod.imageData ?? Data()) ?? UIImage(named: "back")!))
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            ScrollView(showsIndicators: false) {
                Rectangle()
                    .frame(height: 15)
                    .opacity(0)
                HStack {
                    VStack(alignment: .leading) {
                        Text(apod.copyright ?? "")
                        Text(apod.date ?? "title")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding()
                VStack(spacing: 0) {
                    HStack {
                        Text(apod.title ?? "title")
                            .font(.title2)
                        Spacer()
                    }
                    
                    Text("")
                    Text(apod.explanation ?? "text")
                        .multilineTextAlignment(.center)
                        .font(.system(.title3, design: .monospaced))
                    Rectangle()
                        .opacity(0)
                        .frame(height: 80)
                    
                }
                .padding(.horizontal)
            }
            .ignoresSafeArea()
            .overlay (
                HStack {
                    Spacer()
                    CircleButtonView(
                        titel: isFavorite ? "❤️" : "🖤",
                        foregroundColor: isFavorite ? .purple : .gray) {
                            isFavorite.toggle()
                        }
                }.padding() , alignment: .topTrailing
            )
        }
        
    }
}




struct ApodInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ApodInfoView(apod: FakeDataManager.shared.getApod())
    }
}
