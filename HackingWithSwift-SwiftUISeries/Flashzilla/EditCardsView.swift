//
//  EditCardsView.swift
//  Flashzilla
//
//  Created by Sylvan  on 24/06/2025.
//

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss

    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""

    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }

                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)

                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .onAppear(perform: loadData)
        }
    }

    private func loadData() {
        guard let data = UserDefaults.standard.data(forKey: "Cards") else { return }
        guard let decoded = try? JSONDecoder().decode([Card].self, from: data) else { return }
        cards = decoded
    }

    private func done() {
        dismiss()
    }

    private func saveData() {
        guard let data = try? JSONEncoder().encode(cards) else { return }
        UserDefaults.standard.set(data, forKey: "Cards")
    }

    private func addCard() {
        let prompt = newPrompt.trimmingCharacters(in: .whitespacesAndNewlines)
        let answer = newAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !prompt.isEmpty && !answer.isEmpty else { return }

        let card = Card(prompt: prompt, answer: answer)
        cards.insert(card, at: 0)
        saveData()

        newPrompt = ""
        newAnswer = ""
    }

    private func removeCards(at offset: IndexSet) {
        cards.remove(atOffsets: offset)
        saveData()
    }
}

#Preview {
    EditCardsView()
}
