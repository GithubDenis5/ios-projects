//
//  ContentView.swift
//  second_project
//
//  Created by Денис Громачихин on 14.02.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                if name.isEmpty {
                    Text("Hello")
                        .font(.largeTitle)
                } else {
                    Text("Hello, \(name)")
                        .font(.largeTitle)
                }
                
                NavigationLink("Ввести имя") {
                    SecondView(name: $name)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Главный экран")
        }
    }
}

struct SecondView: View {
    
    @Binding var name: String
    @State private var tempName: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            
            TextField("Введите имя", text: $tempName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Сохранить") {
                name = tempName
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Ввод имени")
    }
}

#Preview {
    ContentView()
}
