//
//  ContentView.swift
//  WeSplit
//
//  Created by Sylvan  on 30/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""

    private let students = ["Hermione", "Ron", "Harry"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        Form {
            Section {
                TextField("Enter your name", text: $name)
                Text("Your name is: \(name)")
            }

            Section {
                Picker("Select your favourite student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
