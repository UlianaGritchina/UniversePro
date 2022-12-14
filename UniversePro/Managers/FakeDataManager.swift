//
//  FakeDataManager.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import Foundation

class FakeDataManager {
    static let shared = FakeDataManager()
    private init() { }
    
    func getApod() -> Apod {
        Apod(title: "title", date: "date", explanation: "explanation", url: "url", media_type: "media_type")
    }
}
