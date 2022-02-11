//
//  SelectLocationViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/1/31.
//

import GoogleMaps
import UIKit
import CoreLocation

class SelectLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @IBOutlet weak var location_map: GMSMapView!
    
    @IBAction func close_btn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func mapview() {    //地圖的部分
        
               let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude:25.137302615618555, longitude:121.5393622622502)
                marker.title = "文化大學"
        
        marker.icon = UIGraphicsImageRenderer(size: .init(width: 60.0, height: 60.0)).image { context in
            UIImage(named: "新增地點-現在位置")!.draw(in: .init(origin: .zero, size: context.format.bounds.size))
        }
                marker.snippet = "現在位置"
                marker.map = location_map
        
        //mapView.camera = camera
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        //view.bringSubviewToFront(location_map)
        
        
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        //view.bringSubviewToFront(clockInView)
        //viewCIV = UIView(frame: CGRect(x: 29, y: 597, width: 356, height: 163))
        
        
            
           
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations.first
        //let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        let camera = GMSCameraPosition.camera(withLatitude: 10.1518, longitude: 76.3930, zoom: 6.0)
        

        
        self.location_map.camera = camera
        //self.location_map?.animate(to: camera)
            //manager.stopUpdatingLocation()
            
        
        render(location!)
        
        
    }
    
    func render ( _ location: CLLocation) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //mapview()
        // Do any additional setup after loading the view.
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
