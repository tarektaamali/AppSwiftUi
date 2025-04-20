//
//  MotionAnimationView.swift
//  Hike
//
//  Created by MacBookPro-Taamalli on 4/19/25.
//

import SwiftUI

struct MotionAnimationView: View {
    // Mark Prop
    @State private var randomCirle = Int.random(in: 6...12)
    @State private var isAnimating = false
    // Mark Func
    
    // 1.  RANDOM COORDINATES
    
    func randomCoordinates() -> CGFloat {
        return CGFloat.random(in: 0 ... 256)
    }
    
    // 2.  RANDOM SIZE
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 8 ... 64)
    }
    
    // 3. RANDOM SCALE
     func randomScale() -> CGFloat {
         return CGFloat.random(in: 0.1 ... 2.0)
    }
    // 4. RANDOM SPEED
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05 ... 1.0)
    }
    
    // 5. RANDOM DELAY
    
    func randomDelay() -> Double {
        return Double.random(in: 0 ... 2)
    }
    
    
    var body: some View {
        ZStack {
            ForEach(0 ... randomCirle , id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(
                        width: randomSize(),
                    )
                    .position(x : randomCoordinates(),
                              y : randomCoordinates()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())){
                            isAnimating = true
                        }
                    })
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    //ZStack{
      //  Color.teal.ignoresSafeArea()
        MotionAnimationView()
        .background(
            Circle().fill(.teal)
        )
    //}
}
