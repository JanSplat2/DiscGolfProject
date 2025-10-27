//
//  ContentView.swift
//  DiscGolfProject
//
//  Created by Dittrich, Jan - Student on 10/23/25.
//

import SwiftUI
import MapKit

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
    
    //MARK: - User vars
    
    
    // MARK: - Other vars
    
    @State private var camera: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $camera) {
            
            //MARK: Tees
            
            Annotation("Tee 1", coordinate: tee1) {
                teeMarker
            }
            Annotation("Tee 2", coordinate: tee2) {
                teeMarker
            }
            Annotation("Tee 3", coordinate: tee3) {
                teeMarker
            }
            Annotation("Tee 4", coordinate: tee4) {
                teeMarker
            }
            Annotation("Tee 5", coordinate: tee5) {
                teeMarker
            }
            Annotation("Tee 6", coordinate: tee6) {
                teeMarker
            }
            Annotation("Tee 7", coordinate: tee7) {
                teeMarker
            }
            Annotation("Tee 8", coordinate: tee8) {
                teeMarker
            }
            Annotation("Tee 9", coordinate: tee9) {
                teeMarker
            }
            Annotation("Tee 10", coordinate: tee10) {
                teeMarker
            }
            Annotation("Tee 11", coordinate: tee11) {
                teeMarker
            }
            Annotation("Tee 12", coordinate: tee12) {
                teeMarker
            }
            Annotation("Tee 13", coordinate: tee13) {
                teeMarker
            }
            Annotation("Tee 14", coordinate: tee14) {
                teeMarker
            }
            Annotation("Tee 15", coordinate: tee15) {
                teeMarker
            }
            Annotation("Tee 16", coordinate: tee16) {
                teeMarker
            }
            Annotation("Tee 17", coordinate: tee17) {
                teeMarker
            }
            Annotation("Tee 18", coordinate: tee18) {
                teeMarker
            }
            
            //MARK: - Holes
            
            Annotation("Hole 1", coordinate: hole1) {
                holeMarker
            }
            Annotation("Hole 2", coordinate: hole2) {
                holeMarker
            }
            Annotation("Hole 3", coordinate: hole3) {
                holeMarker
            }
            Annotation("Hole 4", coordinate: hole4) {
                holeMarker
            }
            Annotation("Hole 5", coordinate: hole5) {
                holeMarker
            }
            Annotation("Hole 6", coordinate: hole6) {
                holeMarker
            }
            Annotation("Hole 7", coordinate: hole7) {
                holeMarker
            }
            Annotation("Hole 8", coordinate: hole8) {
                holeMarker
            }
            Annotation("Hole 9", coordinate: hole9) {
                holeMarker
            }
            Annotation("Hole 10", coordinate: hole10) {
                holeMarker
            }
            Annotation("Hole 11", coordinate: hole11) {
                holeMarker
            }
            Annotation("Hole 12", coordinate: hole12) {
                holeMarker
            }
            Annotation("Hole 13", coordinate: hole13) {
                holeMarker
            }
            Annotation("Hole 14", coordinate: hole14) {
                holeMarker
            }
            Annotation("Hole 15", coordinate: hole15) {
                holeMarker
            }
            Annotation("Hole 16", coordinate: hole16) {
                holeMarker
            }
            Annotation("Hole 17", coordinate: hole17) {
                holeMarker
            }
            Annotation("Hole 18", coordinate: hole18) {
                holeMarker
            }
            
            //MARK: - Lines to connect
            MapPolyline(coordinates: [tee1, hole1])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee2, hole2])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee3, hole3])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee4, hole4])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee5, hole5])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee6, hole6])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee7, hole7])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee8, hole8])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee9, hole9])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee10, hole10])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee11, hole11])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee12, hole12])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee13, hole13])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee14, hole14])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee15, hole15])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee16, hole16])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee17, hole17])
                .stroke(.blue, lineWidth: 4)
            MapPolyline(coordinates: [tee18, hole18])
                .stroke(.blue, lineWidth: 4)
        }
        .mapStyle(.hybrid)
        //MARK: - Buttons
        .safeAreaInset(edge: .bottom) {
            ScrollView(.horizontal){
                HStack{
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee1, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 1")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee2, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 2")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee3, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 3")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee4, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 4")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee5, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 5")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee6, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 6")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee7, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 7")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee8, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 8")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee9, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 9")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee10, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 10")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee11, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 11")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee12, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 12")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee13, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 13")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee14, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 14")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee15, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 15")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee16, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 16")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee17, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 17")
                    }
                    Button {
                        camera = .region(MKCoordinateRegion(center: tee18, latitudinalMeters: 100, longitudinalMeters: 100))
                    } label: {
                        Text("Course 18")
                    }
                }
            }
            .padding()
            .background(.thinMaterial)
        }
    }
    // MARK: - Marker Styles
    private var teeMarker: some View {
        ZStack {
            Image(systemName: "rectangle.fill")
                .foregroundColor(.white)
                .font(.system(size: 30))
            Image(systemName: "rectangle")
                .foregroundColor(.blue)
                .font(.system(size: 30))
        }
    }
    
    private var holeMarker: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .foregroundStyle(.blue)
                .font(.system(size: 30))
            Image(systemName: "target")
                .foregroundStyle(.white)
                .font(.system(size: 30))
        }
    }
}

#Preview {
    ContentView()
}
