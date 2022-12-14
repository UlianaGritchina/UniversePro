//
//  ContentView.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import SwiftUI
import Combine

struct MainView: View {
    @StateObject var vm = MainViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(
                    colors: [.blue.opacity(0.8), .black],
                    center: .center,
                    startRadius: 5, endRadius: 500
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    if vm.networkState == .loaded {
                        Image(uiImage: (UIImage(data: vm.apodImageData) ?? UIImage(systemName: "heart"))!)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                        HStack {
                            Text(vm.apod.title ?? "title")
                                .font(.title)
                            Spacer()
                        }
                        .padding(.vertical)
                        Text(vm.apod.explanation ?? "text")
                            .multilineTextAlignment(.center)
                            .font(.system(.title2, design: .monospaced))
                    } else {
                        ProgressView()
                    }
                }
                .padding(.horizontal)
                .navigationTitle("Universe Pro")
                .toolbar {
                    ToolbarItem {
                        FindButtonView(action: {})
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
