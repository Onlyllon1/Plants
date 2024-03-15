//
//  ListingItemView.swift
//  Plants
//
//  Created by Francesco on 06/03/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "plant-1",
        "plant-2",
        "plant-3",
        "plant-4"
    ]
    
    
    var body: some View {
        VStack(spacing : 8) {
            //immagini
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack{
                // dettagli
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4){
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("Night")
                    }
                    .foregroundStyle(.black)
                }
                
                Spacer()
                //recensioni
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
