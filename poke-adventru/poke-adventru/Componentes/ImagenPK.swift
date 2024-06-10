//
//  ImagenPK.swift
//  TriviaGame
//
//  Created by Lorenzo Reinoso on 09/06/24.
//

import SwiftUI

struct ImagenPK: View {
    let imageUrl: URL

    var body: some View {
        VStack {
            Spacer() // Adds space above the image to center it vertically

            AsyncImage(url: imageUrl) { phase in
                if let image = phase.image {
                    image.resizable() // Makes the image resizable
                         .aspectRatio(contentMode: .fit) // Keeps the image aspect ratio
                } else if phase.error != nil {
                    Text("Unable to load image.") // Error text if the image fails to load
                        .foregroundColor(.red)
                } else {
                    ProgressView() // Shows a progress view while the image is loading
                }
            }
            .frame(width: 200, height: 200) // Sets the image frame
            .background(Color.gray.opacity(0.3)) // Optional: Adds a background color to the image frame for better visibility
            .cornerRadius(10) // Optional: Adds rounded corners to the image frame

            Spacer() // Adds space below the image to center it vertically
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures the VStack fills the parent view
    }
}

