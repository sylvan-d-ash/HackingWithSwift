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
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showErrorAlert = false

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
        .alert(errorTitle, isPresented: $showErrorAlert) {} message: {
            Text(errorMessage)
        }
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

        guard isNewOriginal(word: answer, usedWords: usedWords) else {
            wordError(title: "Word already used", message: "Be more original 😜")
            return
        }

        guard isPossible(word: answer, from: rootWord) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know 😅!")
            return
        }

        withAnimation {
            usedWords.append(answer)
        }
    }

    private func isNewOriginal(word: String, usedWords: [String]) -> Bool {
        !usedWords.contains(word)
    }

    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()

        // create a range to scan the entire length of our string
        let range = NSRange(location: 0, length: word.utf16.count)

        // check for wrong words
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }

    private func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showErrorAlert = true
    }

    /// Time complexity: O(n+m)
    /// n: rootWord
    /// m: word
    private func isPossible(word: String, from rootWord: String) -> Bool {
        var letterCounts = [Character: Int]()

        // time complexity: O(n)
        for letter in rootWord {
            letterCounts[letter, default: 0] += 1
        }

        // time complexity: O(m)
        for letter in word {
            if let count = letterCounts[letter], count > 0 {
                // OK to force unwrap because we've confirmed the key exists
                letterCounts[letter]! -= 1
            } else {
                return false
            }
        }

        return true
    }

    /// Not ideal for high-performance or lage-scale text matching because of O(n^2) time complexity
    private func isPossible2(word: String, from rootWord: String) -> Bool {
        var tempWord = rootWord

        // because of the for loop time complexity is: o(n^2)
        for letter in word {
            // firstIndex(of:) has O(n) time complexity
            if let pos = tempWord.firstIndex(of: letter) {
                // remote(at:) has O(n) time complexity
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
}

#Preview {
    NavigationStack {
        WordScrambleView()
    }
}
