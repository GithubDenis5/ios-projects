//
//  DogResponse.swift
//  fifth_project
//
//  Created by Денис Громачихин on 02.03.2026.
//

import Foundation

struct DogResponse: Codable {
    let message: [String: [String]]
    let status: String
}
