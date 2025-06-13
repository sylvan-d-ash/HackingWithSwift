//
//  MeView.swift
//  HotProspects
//
//  Created by Sylvan  on 13/06/2025.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var email = "you@yoursite.com"

    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .font(.title)

                Image(uiImage: generateQRCode(from: "\(name)\n\(email)"))
                    .resizable()
                    // NOTE: This must be before .scaledToFit() and .frame()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .navigationTitle("Your code")
        }
    }

    private func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MeView()
}
