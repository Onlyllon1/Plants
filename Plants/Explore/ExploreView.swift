//
//  ExploreView.swift
//  Plants
//
//  Created by Francesco on 06/03/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack{
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                
                ScrollView{
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                        .padding()
                    
                    LazyVStack(spacing: 32){
                        ForEach(0 ... 10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
