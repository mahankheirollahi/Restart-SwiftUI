//
//  CircleGroupView.swift
//  Restart-SwiftUI
//
//  Created by Mahan Kheirollahi on 7/4/24.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    var body: some View {
        Circle()
            .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 40)
            .frame(width: 260,height: 260,alignment: .center)
        
        Circle()
            .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 80)
            .frame(width: 260,height: 260,alignment: .center)
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea(.all,edges: .all)
        
        
        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
    
}
