//
//  ApodApiManager.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import Foundation
import Combine

enum NetworkState: Error {
    case badURL
    case noData
    case loading
    case loaded
    case error
    case none
}

class ApodApiManager {
    
    static let shared = ApodApiManager()
    private init() { }
    
    func downloadApod(_ url: URL) -> AnyPublisher<Apod?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(handleUsersResponse)
            .mapError({ $0 })
            .eraseToAnyPublisher()
    }
    
    
    func downloadApodImageData(url: URL) -> AnyPublisher<Data?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(handleImageDataResponse)
            .mapError({ $0 })
            .eraseToAnyPublisher()
    }
    
    private  func handleUsersResponse(data: Data?, response: URLResponse?) -> Apod? {
        guard
            let data = data,
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            print("data or code")
            return nil
        }
        guard  let apod = try? JSONDecoder().decode(Apod.self, from: data) else {
            print("no decode")
            return nil
        }
        return apod
    }
    
    private func handleImageDataResponse(data: Data?, response: URLResponse?) -> Data? {
        guard
            let data = data,
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                return nil
            }
        return data
    }
    
    
    
}
