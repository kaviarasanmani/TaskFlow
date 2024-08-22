//
//  NoItemsView.swift
//  TodoList
//
//  Created by kavi17311 on 21/08/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Oh no! There are no items 😔")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Ready to conquer your day? Hit 'Add' and populate your todo list with great goals! 😎💪")
                    .padding(.bottom, 15)
                
                NavigationLink(destination: AddView()) {
                    Text("Start Adding Now 🌟")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.accentColor : Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
        }
    }
}
