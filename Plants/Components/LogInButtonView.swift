//
//  LogInButtonView.swift
//  Plants
//
//  Created by Francesco on 12/03/24.
//

import SwiftUI

struct LogInButtonView: View {
    var body: some View {
        Button {
            print ("Log in")
        } label: {
            Text("Log in")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .frame(width: 360, height: 48)
                .background(.pink)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    LogInButtonView()
}
