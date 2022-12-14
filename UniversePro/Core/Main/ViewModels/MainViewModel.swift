//
//  MainViewModel.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    @Published var apod: Apod = FakeDataManager.shared.getApod()
    @Published var networkState: NetworkState = .none
    @Published var apodImageData: Data = Data()
    
    private let networkManager = ApodApiManager.shared
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchApod()
    }
    
    func fetchApod() {
        networkState = .loading
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?&api_key=j927yMuuumpGvzeDtYe5YUsObO9FzOEnNhp0FnZX") else { return }
        
        ApodApiManager.shared.downloadApod(url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: print("fin")
                case .failure(_): print("fail")
                }
            } receiveValue: { [weak self] apod in
                guard let apod = apod else {
                    return
                }
                self?.apod = apod
                self?.fetchApodImageData(apod)
            }
            .store(in: &cancellables)
    }
    
    func fetchApodImageData(_ apod: Apod) {
        guard let imageUrl = URL(string: apod.url ?? "") else {
            networkState = .error
            return
        }
        networkManager.downloadApodImageData(url: imageUrl)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] imageData in
                guard let self = self else { return }
                guard let data = imageData else {
                    self.networkState = .error
                    return
                }
                self.apodImageData = data
                self.networkState = .loaded
            }
            .store(in: &self.cancellables)
    }
    
}
