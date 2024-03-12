//
//  WishlistsView.swift
//  Plants
//
//  Created by Francesco on 12/03/24.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
             
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to your wishlists")
                        .font(.headline)
                    
                    Text("You can crete, view or edit wishlists once you,ve logged in")
                        .font(.footnote)
                }
                LogInButtonView()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistsView()
}
