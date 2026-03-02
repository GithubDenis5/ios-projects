//
//  ContentView.swift
//  first_project
//
//  Created by Денис Громачихин on 14.02.2026.
//

import SwiftUI

struct ContentView: View {
    
    let images = ["image1", "image2", "image3", "image4"]
    
    @State private var currentIndex = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image(images[currentIndex])
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 400)
                .padding()
            
            Spacer()
            
            HStack {
                
                Button(action: {
                    previousImage()
                }) {
                    Text("Назад")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    nextImage()
                }) {
                    Text("Вперёд")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
    
    func nextImage() {
        currentIndex = (currentIndex + 1) % images.count
    }
    
    func previousImage() {
        currentIndex = (currentIndex - 1 + images.count) % images.count
    }
}

#Preview {
    ContentView()
}
