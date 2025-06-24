//
//  CardView.swift
//  Flashzilla
//
//  Created by Sylvan  on 24/06/2025.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 10)

            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundStyle(.black)

                Text(card.answer)
                    .font(.title)
                    .foregroundStyle(.secondary)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        // TIP: the smallest iPhones have a landscape width of 480 points,
        // so this means our card will be fully visible on all devices
        .frame(width: 450, height: 250)
    }
}

#Preview {
    CardView(card: Card.example)
}
