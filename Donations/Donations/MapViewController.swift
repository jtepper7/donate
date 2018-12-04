//
//  MapViewController.swift
//  Donations
//
//  Created by Jessie Tepper on 12/3/18.
//  Copyright © 2018 Jessie Tepper. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CustomPin: NSObject, MKAnnotation  {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle: String, pinSubtitle: String, location: CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubtitle
        self.coordinate = location
    }
}
class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {


    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.showsUserLocation = true
        if CLLocationManager.locationServicesEnabled() == true {
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
        }
        
        //pins
        let location = CLLocationCoordinate2D(latitude: 33.749249, longitude: -84.387314)
        //        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        //        self.mapView.setRegion(region, animated: true)
        
        let pin = CustomPin(pinTitle: "Atlanta", pinSubtitle: "Midtown", location: location)
        self.mapView.addAnnotation(pin)
        let pin2 = CustomPin(pinTitle: "Goodwill Donation Center", pinSubtitle: "1180 Collier Rd NW, Atlanta, GA 30318", location: CLLocationCoordinate2D(latitude: 33.810940, longitude: -84.426480))
        self.mapView.addAnnotation(pin2)
        let pin3 = CustomPin(pinTitle: "Goodwill Donation Center", pinSubtitle: "160 Ponce De Leon Ave NE, Atlanta, GA 30308", location: CLLocationCoordinate2D(latitude: 33.772900, longitude: -84.382100))
        self.mapView.addAnnotation(pin3)
        let pin4 = CustomPin(pinTitle: "Goodwill Donation Center", pinSubtitle: "888 Ralph David Abernathy Blvd SW, Atlanta, GA 30310", location: CLLocationCoordinate2D(latitude: 33.738970, longitude: -84.433140))
        self.mapView.addAnnotation(pin4)
        let pin5 = CustomPin(pinTitle: "Goodwill Donation Center", pinSubtitle: "2201 Lawrenceville Hwy, Decatur, GA 30033", location: CLLocationCoordinate2D(latitude: 33.811460, longitude: -84.271060))
        self.mapView.addAnnotation(pin5)
        self.mapView.delegate = self
    }
    //CLLocationManager Delegates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4))
        self.mapView.setRegion(region, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("unable to access current location")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom annotation")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation title == \(String(describing: view.annotation?.title!))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
