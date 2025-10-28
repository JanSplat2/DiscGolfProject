//
//  FlowerView.swift
//  DiscGolfProject
//
//  Created by Dittrich, Jan - Student on 10/28/25.
//

import SwiftUI

// MARK: - FlowerView
struct FlowerView: View {
    @Binding var isMinimized: Bool
    @Binding var numberOfPetals: Double
    @Binding var animationDuration: Double
    @Binding var color: Color
    
    private let circleDiameter: CGFloat
    
    init(
        isMinimized: Binding<Bool>,
        numberOfPetals: Binding<Double>,
        animationDuration: Binding<Double>,
        color: Binding<Color>,
        circleDiameter: CGFloat = 200
    ) {
        self._isMinimized = isMinimized
        self._numberOfPetals = numberOfPetals
        self._animationDuration = animationDuration
        self._color = color
        self.circleDiameter = circleDiameter
    }
    
    private var absolutePetalAngle: Double { 360 / numberOfPetals }
    
    private var opacityPercentage: Double {
        let numberOfPetals = self.numberOfPetals.rounded(.down)
        let nextAngle = 360 / (numberOfPetals + 1)
        let currentAbsoluteAngle = 360 / numberOfPetals
        let totalTravel = currentAbsoluteAngle - nextAngle
        let currentProgress = absolutePetalAngle - nextAngle
        let percentage = currentProgress / totalTravel
        return 1 - percentage
    }
    
    var body: some View {
        ZStack {
            ForEach(0...Int(numberOfPetals), id: \.self) { index in
                Circle()
                    .frame(width: circleDiameter, height: circleDiameter)
                    .foregroundColor(color)
                    .opacity(index == Int(numberOfPetals) ? opacityPercentage : 1)
                    .rotationEffect(.degrees(absolutePetalAngle * Double(index)),
                                    anchor: isMinimized ? .center : .leading)
            }
        }
        .offset(x: isMinimized ? 0 : circleDiameter / 2)
        .frame(width: circleDiameter * 2, height: circleDiameter * 2)
        .rotationEffect(.degrees(isMinimized ? -90 : 0))
        .scaleEffect(isMinimized ? 0.25 : 1)
        .animation(.easeInOut(duration: animationDuration), value: isMinimized)
        .animation(.easeInOut(duration: animationDuration), value: numberOfPetals)
        .rotationEffect(.degrees(-60))
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
    }
}

// MARK: - iPad Optimized Demo
struct FlowerDemoView: View {
    @Environment(\.dismiss) private var dismiss   // 👈 Allows navigation back
    
    @State private var isMinimized = false
    @State private var numberOfPetals: Double = 5
    @State private var animationDuration: Double = 2.0
    @State private var color: Color = .cyan.opacity(0.6)
    
    @State private var bloomTimer: Timer? = nil
    @State private var hueTimer: Timer? = nil
    @State private var hue: Double = 0.5
    
    var body: some View {
        GeometryReader { geo in
            let screenWidth = geo.size.width
            let screenHeight = geo.size.height
            let flowerWidth = max(700, min(screenWidth * 0.8, screenHeight * 0.8))
            
            VStack(spacing: 40) {
                // 🔙 Back Button
                HStack {
                    Button {
                        dismiss() // go back
                    } label: {
                        Label("Back to Game", systemImage: "arrow.left")
                            .font(.title2.bold())
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Spacer()
                
                // 🌸 Big Flower
                FlowerView(
                    isMinimized: $isMinimized,
                    numberOfPetals: $numberOfPetals,
                    animationDuration: $animationDuration,
                    color: $color,
                    circleDiameter: flowerWidth / 2.8
                )
                .frame(width: flowerWidth, height: flowerWidth)
                
                // 🎛️ Controls
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        Text("🌸 Petals:")
                            .font(.title2)
                        Slider(value: $numberOfPetals, in: 3...12, step: 1)
                            .tint(.cyan)
                    }
                    
                    HStack {
                        Text("⏱️ Duration: \(String(format: "%.1f", animationDuration)) s")
                            .font(.title2)
                        Slider(value: $animationDuration, in: 0.5...6, step: 0.1)
                            .tint(.purple)
                    }
                }
                .padding(.horizontal, 100)
                .frame(maxWidth: 700)
                
                Spacer()
            }
            .frame(width: screenWidth, height: screenHeight)
            .navigationTitle("Flower Animation 🌷")
            .onAppear {
                startBloomingLoop()
                startColorShiftLoop()
            }
            .onDisappear {
                stopTimers()
            }
            .onChange(of: animationDuration) { _ in
                startBloomingLoop()
            }
        }
    }
    
    // MARK: - Timers
    private func startBloomingLoop() {
        bloomTimer?.invalidate()
        bloomTimer = Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { _ in
            withAnimation(.easeInOut(duration: animationDuration)) {
                isMinimized.toggle()
            }
        }
    }
    
    private func startColorShiftLoop() {
        hueTimer?.invalidate()
        hueTimer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            hue += 0.0012
            if hue > 1 { hue = 0 }
            withAnimation(.linear(duration: 0.05)) {
                color = Color(hue: hue, saturation: 0.9, brightness: 1.0, opacity: 0.6)
            }
        }
    }
    
    private func stopTimers() {
        bloomTimer?.invalidate()
        hueTimer?.invalidate()
        bloomTimer = nil
        hueTimer = nil
    }
}

#Preview {
    NavigationStack {
        FlowerDemoView()
    }
}
