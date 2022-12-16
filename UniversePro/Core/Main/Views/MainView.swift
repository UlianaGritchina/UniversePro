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
    @State private var isEndAnimation = false
    @State private var date = Date.now
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                if vm.networkState == .loaded {
                    ScrollView(showsIndicators: false) {
                        ApodInfoView(apod: vm.apod).padding()
                    }
                } else {
                   AnimationView()
                }
                Color.black
                    .ignoresSafeArea()
                    .opacity(vm.isShowingDatePicker ? 0.5 : 0)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isEndAnimation = true
                    }
                }
            }
            .overlay(
                DatePickerView(
                    date: $vm.date,
                    isShowing: vm.isShowingDatePicker,
                    findAction: {}),
                alignment: .top
            )
            .navigationTitle("Universe Pro")
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem {
                    FindButtonView(action: {
                        withAnimation {
                            vm.showDaetPicker()
                        }
                    })
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
