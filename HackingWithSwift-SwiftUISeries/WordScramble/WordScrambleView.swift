//
//  WordScramble.swift
//  WordScramble
//
//  Created by Sylvan  on 15/05/2025.
//

import SwiftUI

/// Since WordScramble is a framework, we need this  to determine the bundle
/// where the flag images are located.
private final class WordScrambleBundleLocator {}

public struct WordScrambleView: View {
    public init() {}

    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""

    public var body: some View {
        List {
            Section {
                TextField("Enter your word", text: $newWord)
                    .textInputAutocapitalization(.never)
            }

            Section {
                // Reverse the array so newly added words are at the top
                ForEach(usedWords.reversed(), id: \.self) { word in
                    HStack {
                        Text(word)
                        Spacer()
                        Image(systemName: "\(word.count).circle")
                    }
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(rootWord)
        .onAppear(perform: startGame)
        .onSubmit(addNewWord)
    }

    private func startGame() {
        // find the URL for start.text in our app bundle
        guard let startWordsURL = Bundle(for: WordScrambleBundleLocator.self).url(forResource: "start", withExtension: "txt") else {
            fatalError("Could not load start.txt from bundle.")
        }

        // Load start.txt into a string
        guard let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) else { return }

        // split the string up into an array o fstrings, splitting on line breaks
        let allWords = startWords.components(separatedBy: "\n")

        // pick one random word, or use "silkworm" as a sensible default
        rootWord = allWords.randomElement() ?? "silkworm"
    }

    private func addNewWord() {
        // lowercase and trim the word to make sure we don't add duplicates
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the string is empty
        guard answer.count > 0 else { return }

        newWord = ""
        withAnimation {
            usedWords.append(answer)
        }
    }
}

#Preview {
    NavigationStack {
        WordScrambleView()
    }
}
