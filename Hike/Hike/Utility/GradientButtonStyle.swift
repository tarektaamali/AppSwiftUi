//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by MacBookPro-Taamalli on 4/19/25.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 32)
            .background(
                // Conditional Statement with Nil Coalescing
                // Condition ?  A : B
                configuration.isPressed ?
                //  A : When User pressed the button
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                //  B : When the Button is not pressed
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
