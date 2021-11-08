//
//  ContentView.swift
//  Animations
//
//  Created by Alexis Beaudoin on 03/11/2021.
//

import SwiftUI

struct BlurryZoomButtonAnimView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(self.animationAmount)
        .blur(radius: (self.animationAmount - 1) * 3)
        .animation(
            .easeInOut(duration: 0.5)
                .repeatCount(3, autoreverses: true),
            value: self.animationAmount)
    }
}

struct SignalButtonAnimView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Signal") {
            // something
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(self.animationAmount)
                .opacity(2 - self.animationAmount)
                .animation(
                    .easeInOut(duration: 1).repeatForever(autoreverses: false),
                    value: self.animationAmount)
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
}

struct StepperZoomButtonAnimView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper(
                "Scale amount",
                value: $animationAmount
                    .animation(
                        .easeInOut(duration: 0.5)
                            .repeatCount(3, autoreverses: true)
                    ),
                in: 1...10)
                .padding(.horizontal, 16)
            Spacer()
            Button("TapMe") {
                self.animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(self.animationAmount)
            Spacer()
        }
    }
}

struct CoinButtonAnimView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Toss a coin") {
            withAnimation {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(self.animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct DragGestureAnimView: View {
    @State private var dragData = CGSize.zero // Registers movement gestures data

    var body: some View {
        LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
            .frame(width: 250, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .offset(self.dragData)
            .gesture(
                DragGesture()
                    .onChanged { self.dragData = $0.translation }
                    .onEnded { _ in
                        withAnimation {
                            self.dragData = .zero
                        }
                    }
            )
            .animation(.spring(), value: self.dragData)
    }
}

struct TextAnimView: View {
    private let letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    @State private var dragData = CGSize.zero

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< letters.count) { idx in
                Text(String(letters[idx]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? .blue : .purple)
                    .offset(self.dragData)
                    .animation(.default.delay((Double(idx) / 20)), value: self.dragData)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { self.dragData = $0.translation }
                .onEnded { _ in
                    self.dragData = .zero
                    self.enabled.toggle()
                }
        )
    }
}

struct HidingShowingTransitionView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {                
                    self.isShowingRed.toggle()
                }
            }
            if self.isShowingRed {
                Rectangle()
                    .fill(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct CustomTransistionView: View {
    @State private var isShowingRed = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            if isShowingRed {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }.onTapGesture {
            withAnimation {
                self.isShowingRed.toggle()
            }
        }
    }
}

struct ContentView: View {
    @State private var dragAmound = CGSize.zero // Registers movement gestures data

    var body: some View {
        BlurryZoomButtonAnimView()
        SignalButtonAnimView()
        StepperZoomButtonAnimView()
        CoinButtonAnimView()
        DragGestureAnimView()
        TextAnimView()
        HidingShowingTransitionView()
        CustomTransistionView() //TODO: To redo on my own
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
