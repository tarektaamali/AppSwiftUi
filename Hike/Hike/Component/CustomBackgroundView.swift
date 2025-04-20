//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by MacBookPro-Taamalli on 4/18/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // 1. DEPTH
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y:12)
            
            //2.    LIGHT
            
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            //3.    SURFACE
            
            LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
