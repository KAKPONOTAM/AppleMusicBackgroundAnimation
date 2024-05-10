//
//  ContentView.swift
//  AppleMusicAnimationSecondPart
//
//  Created by SABITOV Danil on 09.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State var tapped = false
    
    var body: some View {
        Button(action: {
            if !tapped {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    tapped = true
                } completion: {
                    tapped = false
                }
            }
            
        }, label: {
            GeometryReader { reader in
                let width = reader.size.width / 2
                HStack(alignment: .center, spacing: .zero) {
                    Image(systemName: "play.fill")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: tapped ? width : .zero)
                        .opacity(tapped ? 1 : .zero)
                    
                    Image(systemName: "play.fill")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width)
                    
                    Image(systemName: "play.fill")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: tapped ? 0.5 : width)
                        .opacity(tapped ? .zero : 1)
                } .frame(maxHeight: .infinity, alignment: .center)
            }
        })
        .buttonStyle(TappedButtonStyle())
        .frame(maxWidth: 62)
        .frame(maxHeight: 62)
    }
}

#Preview {
    ContentView()
}

struct TappedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(configuration.isPressed ? Color(.gray) : Color (.clear))
            .clipShape (Circle())
            .scaleEffect (configuration.isPressed ? 0.86 : 1)
            .animation(.interpolatingSpring(duration: 0.22), value: configuration.isPressed)
    }
}
