//
//  DogService.swift
//  fifth_project
//
//  Created by Денис Громачихин on 02.03.2026.
//

import Foundation
import Combine

class DogService {
    
    func fetchBreeds(completion: @escaping ([String]) -> Void) {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print("Error:", error)
                completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(DogResponse.self, from: data)
                let breeds = decoded.message.keys.sorted()
                
                DispatchQueue.main.async {
                    completion(breeds)
                }
                
            } catch {
                print("Decoding error:", error)
                completion([])
            }
            
        }.resume()
    }
}
