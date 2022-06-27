//
//  MapView.swift
//  Ejemplo
//
//  Created by Ricardo Asin on 17/6/22.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) ->
        MKMapView{
            MKMapView(frame: .zero)
        }
        
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let coordinate =
            CLLocationCoordinate2D(
                latitude: -17.783279, longitude: -63.179161
        
            )
        let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0.09)
        
        let region  = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
