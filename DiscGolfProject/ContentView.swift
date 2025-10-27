//
//  ContentView.swift
//  DiscGolfProject
//
//  Created by Dittrich, Jan - Student on 10/23/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    
    // MARK: - Holes var
    
    var hole1 = CLLocationCoordinate2D(latitude: 40.5565559, longitude: -105.1379600)
    
    var hole2 = CLLocationCoordinate2D(latitude: 40.5569357, longitude: -105.1367495)
    
    var hole3 = CLLocationCoordinate2D(latitude: 40.5570549, longitude: -105.1347512)
    
    var hole4 = CLLocationCoordinate2D(latitude: 40.55746, longitude: -105.13697)
    
    var hole5 = CLLocationCoordinate2D(latitude: 40.55788, longitude: -105.13545)
    
    var hole6 = CLLocationCoordinate2D(latitude: 40.55753, longitude: -105.13420)
    
    var hole7 = CLLocationCoordinate2D(latitude: 40.55838, longitude: -105.13588)
    
    var hole8 = CLLocationCoordinate2D(latitude: 40.55845, longitude: -105.13754)
    
    var hole9 = CLLocationCoordinate2D(latitude: 40.55858, longitude: -105.13565)
    
    var hole10 = CLLocationCoordinate2D(latitude: 40.558763, longitude:  -105.134242)
    
    var hole11 = CLLocationCoordinate2D(latitude: 40.559135, longitude: -105.134385)
    
    var hole12 = CLLocationCoordinate2D(latitude: 40.559030, longitude: -105.135471)
    
    var hole13 = CLLocationCoordinate2D(latitude: 40.559783, longitude: -105.135804)
    
    var hole14 = CLLocationCoordinate2D(latitude: 40.560467, longitude: -105.134485)
    
    var hole15 = CLLocationCoordinate2D(latitude: 40.560337, longitude: -105.136424)
    
    var hole16 = CLLocationCoordinate2D(latitude: 40.559436, longitude: -105.137056)
    
    var hole17 = CLLocationCoordinate2D(latitude: 40.558592, longitude: -105.139183)
    
    var hole18 = CLLocationCoordinate2D(latitude: 40.557291, longitude: -105.139472)
    
    // MARK: - Tees var
    
    var tee1 = CLLocationCoordinate2D(latitude: 40.5564509, longitude: -105.1390831)
    
    var tee2 = CLLocationCoordinate2D(latitude: 40.5566772, longitude: -105.1375496)
    
    var tee3 = CLLocationCoordinate2D(latitude: 40.557197, longitude: -105.1357486)
    
    var tee4 = CLLocationCoordinate2D(latitude: 40.55753, longitude: -105.13584)
    
    var tee5 = CLLocationCoordinate2D(latitude: 40.55776, longitude: -105.13708)
    
    var tee6 = CLLocationCoordinate2D(latitude: 40.55770, longitude: -105.13526)
    
    var tee7 = CLLocationCoordinate2D(latitude: 40.55781, longitude: -105.13455)
    
    var tee8 = CLLocationCoordinate2D(latitude: 40.55834, longitude: -105.13627)
    
    var tee9 = CLLocationCoordinate2D(latitude: 40.55882, longitude: -105.13707)
    
    var tee10 = CLLocationCoordinate2D(latitude: 40.558376, longitude: -105.135466)
    
    var tee11 = CLLocationCoordinate2D(latitude: 40.558885, longitude: -105.134107)
    
    var tee12 = CLLocationCoordinate2D(latitude: 40.559379, longitude: -105.134151)
    
    var tee13 = CLLocationCoordinate2D(latitude: 40.558914, longitude: -105.135949)
    
    var tee14 = CLLocationCoordinate2D(latitude: 40.559697, longitude: -105.135522)
    
    var tee15 = CLLocationCoordinate2D(latitude: 40.560616, longitude: -105.134974)
    
    var tee16 = CLLocationCoordinate2D(latitude: 40.560543, longitude: -105.136820)
    
    var tee17 = CLLocationCoordinate2D(latitude: 40.558889, longitude: -105.137061)
    
    var tee18 = CLLocationCoordinate2D(latitude: 40.558345, longitude: -105.139454)
    
    // MARK: - States
    @State private var camera: MapCameraPosition = .automatic
    @State private var selectedHole: Int? = nil
    @State private var scores: [Int?] = Array(repeating: nil, count: 18)
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Map(position: $camera) {
                //MARK: - Tee markers
                ForEach(1...18, id: \.self) { i in
                    let tee = getTee(for: i)
                    let hole = getHole(for: i)
                    Annotation("Tee \(i)", coordinate: tee) {
                        teeMarker
                    }
                    Annotation("Hole \(i)", coordinate: hole) {
                        holeMarker
                    }
                    MapPolyline(coordinates: [tee, hole])
                        .stroke(.blue, lineWidth: 4)
                }
            }
            .mapStyle(.hybrid)
            .ignoresSafeArea()
            
            //MARK: - Hole info panel
            if let holeNumber = selectedHole {
                let tee = getTee(for: holeNumber)
                let basket = getHole(for: holeNumber)
                let distance = calculateDistance(from: tee, to: basket)
                
                VStack(spacing: 16) {
                    Text("Hole \(holeNumber)")
                        .font(.largeTitle.bold())
                    Text("Par: 3")
                        .font(.title2)
                    Text("Distance: \(String(format: "%.1f", distance)) m")
                        .font(.title3)
                    
                    HStack {
                        Text("Your Score:")
                        TextField("Enter", value: Binding(
                            get: { scores[holeNumber - 1] },
                            set: { scores[holeNumber - 1] = $0 }),
                                  format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                    }
                    .padding(.bottom)
                    
                    Button("Close") {
                        selectedHole = nil
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .frame(width: 400)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
                .transition(.scale)
            }
        }

        .safeAreaInset(edge: .bottom) {
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(1...18, id: \.self) { i in
                        Button {
                            selectedHole = i
                            camera = .region(MKCoordinateRegion(
                                center: getTee(for: i),
                                latitudinalMeters: 150,
                                longitudinalMeters: 150))
                        } label: {
                            Text("Hole \(i)")
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(Capsule())
                        }
                    }
                    if let total = totalScore() {
                        Text("Total: \(total)")
                            .font(.title3.bold())
                            .padding(.leading)
                    }
                }
                .padding()
            }
            .background(.regularMaterial)
        }
    }
    
    // MARK: - Helpers
    private func getTee(for hole: Int) -> CLLocationCoordinate2D {
        switch hole {
        case 1: return tee1; case 2: return tee2; case 3: return tee3; case 4: return tee4
        case 5: return tee5; case 6: return tee6; case 7: return tee7; case 8: return tee8
        case 9: return tee9; case 10: return tee10; case 11: return tee11; case 12: return tee12
        case 13: return tee13; case 14: return tee14; case 15: return tee15; case 16: return tee16
        case 17: return tee17; case 18: return tee18
        default: return tee1
        }
    }
    
    private func getHole(for hole: Int) -> CLLocationCoordinate2D {
        switch hole {
        case 1: return hole1; case 2: return hole2; case 3: return hole3; case 4: return hole4
        case 5: return hole5; case 6: return hole6; case 7: return hole7; case 8: return hole8
        case 9: return hole9; case 10: return hole10; case 11: return hole11; case 12: return hole12
        case 13: return hole13; case 14: return hole14; case 15: return hole15; case 16: return hole16
        case 17: return hole17; case 18: return hole18
        default: return hole1
        }
    }
    
    private func calculateDistance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> Double {
        let loc1 = CLLocation(latitude: from.latitude, longitude: from.longitude)
        let loc2 = CLLocation(latitude: to.latitude, longitude: to.longitude)
        return loc1.distance(from: loc2)
    }
    
    private func totalScore() -> Int? {
        let validScores = scores.compactMap { $0 }
        guard !validScores.isEmpty else { return nil }
        return validScores.reduce(0, +)
    }
    
    // MARK: - Marker Styles
    private var teeMarker: some View {
        ZStack {
            Image(systemName: "rectangle.fill")
                .foregroundColor(.white)
            Image(systemName: "rectangle")
                .foregroundColor(.blue)
        }
        .font(.system(size: 30))
    }
    
    private var holeMarker: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .foregroundStyle(.blue)
            Image(systemName: "target")
                .foregroundStyle(.white)
        }
        .font(.system(size: 30))
    }
}

#Preview {
    ContentView()
}
