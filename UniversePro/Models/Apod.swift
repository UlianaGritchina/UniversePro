//
//  Apos.swift
//  UniversePro
//
//  Created by Ульяна Гритчина on 14.12.2022.
//

import Foundation

struct Apod: Hashable, Decodable {
    let title: String?
    let date: String?
    let explanation: String?
    let url: String?
    let media_type: String?
    var imageData: Data?
}
