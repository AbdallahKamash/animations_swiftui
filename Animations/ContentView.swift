//
//  ContentView.swift
//  Animations
//
//  Created by Abdallah Kamash on 27/11/2025.
//

import SwiftUI

struct CornerRotate: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotate(amount: -90, anchor: .topLeading), identity: CornerRotate(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    
    @State private var isShowingRed = false
    var body: some View {
        ZStack {
            
            Rectangle().fill(Color.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle().fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }.onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
