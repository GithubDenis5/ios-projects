//
//  ContentView.swift
//  fifth_project
//
//  Created by Денис Громачихин on 02.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = DogViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.breeds, id: \.self) { breed in
                Text(breed.capitalized)
            }
            .navigationTitle("Dog Breeds")
        }
        .onAppear {
            viewModel.loadBreeds()
        }
    }
}
