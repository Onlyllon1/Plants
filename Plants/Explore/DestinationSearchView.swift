//
//  DestinationSearchView.swift
//  Plants
//
//  Created by Francesco on 08/03/24.
//

import SwiftUI

enum DestinationSearchOption {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOtion: DestinationSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    }
                
                Spacer()
                
                if  !destination.isEmpty {
                    Button ("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                
            }
            .padding()
            
            VStack (alignment: .leading){
                if selectedOtion == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color(.systemGray4))
                }
                
                } else {
                    CollapsedSearchView(title: "Where", description: "Add Destination")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOtion == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOtion = .location }
            }
            
            //date selection view
            
            VStack (alignment: .leading) {
                if selectedOtion == .dates {
                  Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    
                    VStack (){
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                        
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedSearchView(title: "When", description: "Add Dates")

                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOtion == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOtion = .dates }
            }
                
            
            //num guests view
            VStack(alignment: .leading) {
                if selectedOtion == .guests {
                    Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } else {
                    CollapsedSearchView(title: "Who", description: "Add Guests")

                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOtion == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { selectedOtion = .guests }
            }
        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct CollapsedSearchView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
