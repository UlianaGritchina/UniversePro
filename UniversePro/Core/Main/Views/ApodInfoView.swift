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
        VStack {
            Image(uiImage: (UIImage(data: apod.imageData ?? Data()) ?? UIImage(named: "back")!))
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
            .padding([.horizontal, .top])
            VStack(spacing: 0) {
                HStack {
                    Text(apod.title ?? "title")
                        .font(.title2)
                    Spacer()
                }
                ScrollView(showsIndicators: false) {
                    Text("")
                    Text(apod.explanation ?? "text")
                        .multilineTextAlignment(.center)
                        .font(.system(.title3, design: .monospaced))
                    Rectangle()
                        .opacity(0)
                        .frame(height: 80)
                }
            }
            .padding(.horizontal)
        }
        .cornerRadius(10)
        .ignoresSafeArea()
        
    }
}


struct ApodInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ApodInfoView(apod: FakeDataManager.shared.getApod())
    }
}
