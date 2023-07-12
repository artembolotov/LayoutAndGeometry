//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by artembolotov on 10.07.2023.
//

import SwiftUI

extension VerticalAlignment {
    enum  MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@artembolotov")
                    .alignmentGuide(.midAccountAndName) { $0[VerticalAlignment.center] }
                
                Rectangle()
                    .fill(.red)
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("ARTEM BOLOTOV")
                    .alignmentGuide(.midAccountAndName) { $0[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
