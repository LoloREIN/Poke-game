//
//  LazyImage.swift
//  poke-adventru
//
//  Created by Rodrigo Consuelos on 08/06/24.
//

import SwiftUI

struct LazyImage: View {
    @StateObject private var loader = ImageLoader()
    let url: URL
    var size: (width: CGFloat, height: CGFloat) = (width: 70, height: 70)
    
    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .scaledToFit()
                    .padding([.bottom, .trailing], 4)
            } else {
                ProgressView()
                    .frame(width: size.width, height: size.height)
            }
        }
        .onAppear {
            loader.loadImage(from: url)
        }
        .onDisappear {
            loader.cancel()
        }
    }
}
