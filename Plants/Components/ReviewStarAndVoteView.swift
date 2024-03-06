//
//  ReviewStarAndVoteView.swift
//  Plants
//
//  Created by Francesco on 06/03/24.
//

import SwiftUI

struct ReviewStarAndVoteView: View {
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            
            Text("4.86")
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    ReviewStarAndVoteView()
}
