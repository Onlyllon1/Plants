//
//  ListingImageCarouselView.swift
//  Plants
//
//  Created by Francesco on 06/03/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    var images = [
        "plant-1",
        "plant-2",
        "plant-3",
        "plant-4"
    ]
    
    var body: some View {
        
        TabView{
            ForEach(images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }

        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
