//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by artembolotov on 10.07.2023.
//

import SwiftUI

struct ContentView: View {
    let colors = [Color.red, .green, .blue, .orange, .pink, .purple, .yellow]
    private let minOffset: CGFloat = 200.0
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                let screenHeight = fullView.size.height
                
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        let minY = geo.frame(in: .global).minY
                        
                        Text("Row #\(index )")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % colors.count])
                            .scaleEffect(minY < minOffset ? (minY / minOffset) * 0.5 + 0.5 : minY > screenHeight - minOffset ? 1 + ( minY - screenHeight + minOffset) / minOffset * 0.1 : 1)
                            .opacity(minY > minOffset ? 1 : minY / minOffset)
                            .rotation3DEffect(.degrees(minY - screenHeight / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height:  40)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
