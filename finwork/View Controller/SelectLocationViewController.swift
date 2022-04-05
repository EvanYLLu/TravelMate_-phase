//
//  SelectLocationViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/1/31.
//

import GoogleMaps
import UIKit
import CoreLocation

protocol SelectLocationViewControllerDelegate{
    func name_changed(name: String)
}

class SelectLocationViewController: UIViewController {
    
    var delegate: SelectLocationViewControllerDelegate?
    
    static var city_name: String = "選擇地點"
    
    @IBOutlet weak var close: UIButton!
    
    let manager = CLLocationManager()
    
    let camera = GMSCameraPosition.camera(withLatitude: 25.137302615618555, longitude: 121.5393622622502, zoom: 17.0)
    
    var centerMapCoordinate:CLLocationCoordinate2D!
    
    func changeName(name: String) {
        print("SL31")
        delegate?.name_changed(name: name)
        }
    
    func placeMarkerOnCenter(centerMapCoordinate:CLLocationCoordinate2D) {
        //let marker = GMSMarker()
        //marker.position = centerMapCoordinate
        //marker.map = self.location_map
    }
    
    @IBOutlet weak var location_map: GMSMapView!
    
    @IBAction func close_btn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var masker: UIImageView!
    @IBOutlet weak var getLocation: UIButton!
    
    @IBAction func get_location(_ sender: Any) {
        let lat = location_map.projection.coordinate(for: location_map.center).latitude
        let lng = location_map.projection.coordinate(for: location_map.center).longitude
        print("SL45",lat,lng)
        
        latLong(lat: lat, long: lng)
        //JoinListViewController.change_place()
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refresh"), object: nil)
        self.navigationController?.popViewController(animated: true)
        //performSegue(withIdentifier: "selectLocationBack", sender: self)
        
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? JoinListViewController {
            destination.place_name = SelectLocationViewController.city_name
            destination.navigationController?.isNavigationBarHidden = false
            //destination.select_location.setTitle(SelectLocationViewController.city_name, for: .normal)
            //destination.view.reloadInputViews()
            
        }
    }*/
    
    func mapview() {    //地圖的部分
        
        
        //GMSServices.provideAPIKey("AIzaSyCnxEsviVbzh1zF9MHUFoKZODZjUAyKOak")
        
        let camera = GMSCameraPosition.camera(withLatitude: 25.137302615618555, longitude: 121.5393622622502, zoom: 16.0)
        //let mapView = GMSMapView.map(withFrame: self.mapView.frame, camera: camera)
                //self.view.addSubview(mapView)

                // Creates a marker in the center of the map.
               let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude:25.137302615618555, longitude:121.5393622622502)
                marker.title = "文化大學"
        //marker.icon = UIImage(named: "新增地點-現在位置")
        marker.icon = UIGraphicsImageRenderer(size: .init(width: 30.0, height: 30.0)).image { context in
            UIImage(named: "新增地點-現在位置")!.draw(in: .init(origin: .zero, size: context.format.bounds.size))
        }
                marker.snippet = "現在位置"
                marker.map = location_map
        self.location_map.animate(to: camera)
        //mapView.camera = camera
        //location.text = marker.title
        //locationCIV.text = marker.title
        
    }
    
    func latLong(lat: Double,long: Double)  {

        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: lat , longitude: long)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in

            print("Response GeoLocation : \(placemarks)")
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]

            // Country
            if let country = placeMark.addressDictionary!["Country"] as? String {
                print("Country :- \(country)")
                // City
                if let city = placeMark.addressDictionary!["City"] as? String {
                    print("City :- \(city)")
                    SelectLocationViewController.city_name = city
                    // State
                    if let state = placeMark.addressDictionary!["State"] as? String{
                        print("State :- \(state)")
                        // Street
                        if let street = placeMark.addressDictionary!["Street"] as? String{
                            print("Street :- \(street)")
                            let str = street
                            let streetNumber = str.components(
                                separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
                            print("streetNumber :- \(streetNumber)" as Any)

                            // ZIP
                            if let zip = placeMark.addressDictionary!["ZIP"] as? String{
                                print("ZIP :- \(zip)")
                                // Location name
                                if let locationName = placeMark?.addressDictionary?["Name"] as? String {
                                    print("Location Name :- \(locationName)")
                                    // Street address
                                    if let thoroughfare = placeMark?.addressDictionary!["Thoroughfare"] as? NSString {
                                    print("Thoroughfare :- \(thoroughfare)")

                                    }
                                }
                            }
                        }
                    }
                }
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        //view.bringSubviewToFront(location_map)
        
        
        location_map.settings.compassButton = true
        location_map.isMyLocationEnabled = true
        location_map.settings.myLocationButton = true
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        //view.bringSubviewToFront(clockInView)
        //viewCIV = UIView(frame: CGRect(x: 29, y: 597, width: 356, height: 163))
        
        
            
           
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapview()
        self.navigationController?.isNavigationBarHidden = false
        location_map.bringSubviewToFront(close)
        location_map.addSubview(getLocation)
        //location_map.bringSubviewToFront(masker)
        //location_map.sendSubviewToBack(masker)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often w
     ant to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SelectLocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500), execute: {
                let camera = GMSCameraPosition.camera(withLatitude: 25.137302615618555, longitude: 121.5393622622502, zoom: 17.0)
                self.location_map.animate(to: camera)
            print("SL71")
            })
        
    }
    
}
