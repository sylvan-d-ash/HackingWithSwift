//
//  RatingView.swift
//  Bookworm
//
//  Created by Sylvan  on 01/06/2025.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""
    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor: Color = .gray
    var onColor: Color = .yellow

    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle((number > rating) ? offColor : onColor)
                }
                .buttonStyle(.plain)
                // NOTE: simpler accessibility approach
                //.accessibilityLabel("\(number == 1 ? "1 star" : "\(number) stars")")
                //.accessibilityAddTraits(number > rating ? [] : [.isSelected])
            }
        }
        // NOTE: more involved accessibility approach
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maximumRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
    }

    private func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        }
        return onImage
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
