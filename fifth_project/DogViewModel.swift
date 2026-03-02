//
//  DogViewModel..swift
//  fifth_project
//
//  Created by Денис Громачихин on 02.03.2026.
//

import Foundation
import Combine

class DogViewModel: ObservableObject {
    
    @Published var breeds: [String] = []
    
    private let service = DogService()
    
    func loadBreeds() {
        service.fetchBreeds { [weak self] breeds in
            self?.breeds = breeds
        }
    }
}
