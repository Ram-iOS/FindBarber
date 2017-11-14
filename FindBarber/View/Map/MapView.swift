//
//  HBMapView.swift
//  HoodBook_GMaps
//
//  Created by SOTSYS198 on 29/04/17.
//  Copyright © 2017 SOTSYS198. All rights reserved.
//




import UIKit
import GoogleMaps
import AudioToolbox


@objc class MapView: UIView, GMSMapViewDelegate, UIGestureRecognizerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var viewMap: GMSMapView!
    
    let locationManager =  CLLocationManager()
    var VC = UIViewController()
   
    var markerObject = [GMSMarker]()
    
    var counter = 0
    var timer : Timer?
    
    
    var didTapAtMarker:((_ show:Bool)->Void)?
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        locationManager.delegate = self
        //getCurrentLocation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        locationManager.delegate = self
        
        // getCurrentLocation()
        
    }
    
    
    /*!
     *@Customize map initially set current location of user
     *@add pin and make draggable
     */
    
    func customizeMap() -> Void {
        
        if locationManager.location?.coordinate != nil {
            
            let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 15)
            viewMap.camera = camera
            
            
            let setting = viewMap.settings
            setting.consumesGesturesInView = false
            viewMap.delegate = self

            viewMap.isMyLocationEnabled = true
            

        }
        
       
        
       
        
    }
    
    
    func addMarkerToMap(){
        
        var locations = [CLLocation]()
        
        locations.append(CLLocation(latitude: 12.970632, longitude: 77.652930))
        locations.append(CLLocation(latitude: 12.970919, longitude: 77.653577))
        locations.append(CLLocation(latitude: 12.971212, longitude: 77.649736))
        locations.append(CLLocation(latitude: 12.970940, longitude: 77.656667))
        locations.append(CLLocation(latitude: 12.969706, longitude: 77.652247))
        
        for location in locations{
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            let pinView = (Bundle.main.loadNibNamed("RKPinView",owner : nil,options:nil)?[0] as? UIView) as! RKPinView
            
            pinView.imgBarber.image = #imageLiteral(resourceName: "man_img.png")
            pinView.addLayer()
            marker.iconView = pinView
        
            marker.map = viewMap
            self.viewMap.delegate = self
            
            markerObject.append(marker)
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        viewMap.selectedMarker = nil
        
        let pinView:RKPinView = marker.iconView as! RKPinView
        pinView.changeColor()
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        for marker in markerObject {
        
            (marker.iconView as! RKPinView).defaultColor()
        }

        let pinView:RKPinView = marker.iconView as! RKPinView
        pinView.changeColor()
        
        self.didTapAtMarker?(true)
        
        return true
    }
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        for marker in markerObject {
            (marker.iconView as! RKPinView).defaultColor()
        }
        self.didTapAtMarker?(false)

    }
    
    /*
    func changeMarker(witness:Witnesses_db_cludeUpp){
    
        for marker_tapped in self.markerObject {
            
            if marker_tapped.position.isEqualLocation(CLLocationCoordinate2D(latitude: Double((witness.witnessLocation?.lat)!), longitude: Double((witness.witnessLocation?.long)!))) {
                
                if marker_tapped.iconView != nil{
                    let pinView:RKPinView = marker_tapped.iconView as! RKPinView
                    pinView.imgBox.image = #imageLiteral(resourceName: "full_box_green.png")
                    pinView.imgCheck.isHidden = false
                    self.viewMap.selectedMarker = nil
                    
                }
            }
        }
        
        
    }*/
    
    
   /* func customizeMap(witnesses:[Witnesses_db_cludeUpp],timeStopperObj:[TimeStopperLocation_db]){
    
        
        self.arrayWitnesses = witnesses
        
        self.timeStopperObj = timeStopperObj
        
        for witness in witnesses {
            
            let marker = GMSMarker()
            
            
            marker.position = CLLocationCoordinate2D(latitude: Double(( witness.witnessLocation?.lat)!),
                                                     longitude: Double((witness.witnessLocation?.long)!))
            marker.title = witness.name
            marker.snippet = witness.locationLine
            marker.map = viewMap
            
            
            marker.userData  = witness
            
            let pinView = (Bundle.main.loadNibNamed("RKPinView",owner : nil,options:nil)?[0] as? UIView) as! RKPinView
            
            if witness.introgatted {
                
                pinView.imgBox.image = #imageLiteral(resourceName: "full_box_green.png")
                pinView.imgCheck.isHidden = false
                
            }else{
                pinView.imgBox.image = #imageLiteral(resourceName: "full_box.png")
                pinView.imgCheck.isHidden = true


            }
            
            pinView.viewActivity.stopAnimating()
            pinView.witnessImage.sd_setImageWithPreviousCachedImage(with: URL(string: CLConstant.witnessBaseURL+(witness.witnessImage?.id!)!),
                                                               placeholderImage: #imageLiteral(resourceName: "loading.jpg"),
                                                               options: SDWebImageOptions(rawValue: 0),
                                                               progress: nil) { (image, error, chache, url) in
                                                                
                                                                DispatchQueue.main.async {
                                                                    pinView.viewActivity.stopAnimating()
                                                                }
            
            marker.iconView = pinView
                                                                
                                                                if !self.markerObject.contains(marker){
                                                                    self.markerObject.append(marker)
                                                                }
                                                                
        }
    
    }
    
    }*/
    
        
    
    /*!
     *@get Current location
     */
    
    func getCurrentLocation(from:UIViewController) -> Void {
        
        VC = from
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 8.0, *) {
            locationManager.requestWhenInUseAuthorization()
            
        } else {
            // Fallback on earlier versions
        }
        locationManager.startUpdatingLocation()
        self.customizeMap()
    }
    
  
    
    /*!
     *@check location service is enable or not
     */
    
    
    func checkLocationService()->Bool{
        
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
                print("No access")
                return false
            case .authorizedWhenInUse:
                print("Access")
                return true
            case .authorizedAlways:
                return false
            }
        } else {
            return false
        }
        
    }
    
    
    
    
    
    /*!
     *@location manager delegate method
     */
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if CLLocationManager.locationServicesEnabled() {
            
            switch status {
            case .notDetermined:
                // If status has not yet been determied, ask for authorization
                manager.requestWhenInUseAuthorization()
                break
            case .authorizedWhenInUse:
                // If authorized when in use
                customizeMap()
                manager.startUpdatingLocation()
                break
            case .authorizedAlways:
                // If always authorized
                customizeMap()
                manager.startUpdatingLocation()
                break
            case .restricted:
                // If restricted by e.g. parental controls. User can't enable Location Services
                break
            case .denied:
                // If user denied your app access to Location Services, but can grant access from Settings.app
                break
            }
            
        }else{
            
        }
        
    }
    
    
    
    func getAddress(marker : GMSMarker) -> Void {
        
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(marker.position) { response, error in
            
            if let address = response?.firstResult() {
                
                print("Full Address \n \(address)")
                print("Lines \n \(address.lines!)")
            }
        }
    }
    
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker){
        
        getAddress(marker: marker)
    }
    
    
   
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
   
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError",error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("didStartMonitoringFor")
    }
    
    
    @IBAction func currentLocation(_ sender: Any) {
        
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 12.0)
        
        self.viewMap.animate(to: camera)
        
    }
    
}

extension CLLocationCoordinate2D {
    func isEqualLocation(_ coord: CLLocationCoordinate2D) -> Bool {
        return (fabs(self.latitude - coord.latitude) < .ulpOfOne) && (fabs(self.longitude - coord.longitude) < .ulpOfOne)
    }
}
