//
//  NearbyViewController.swift
//  finwork
//
//  Created by Evan on 2021/7/24.
//

import UIKit
import GoogleMaps
import CoreLocation
import Firebase





class NearbyViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {


    
    @IBOutlet var addPlaceDetail: UIView!
    @IBOutlet var addPlaceView: UIView!
    @IBOutlet var addPlace: UIButton!
    @IBOutlet var getLocation: UIButton!
    @IBOutlet var minMapView: GMSMapView!
    
    //輸入欄
    
    @IBOutlet weak var name_place: UITextField!
    @IBOutlet weak var type_place: UITextField!
    @IBOutlet weak var open_time: UITextField!
    @IBOutlet weak var close_time: UITextField!
    @IBOutlet weak var rest_time: UITextField!
    @IBOutlet weak var telephone_num: UITextField!
    @IBOutlet weak var Introduction: UITextView!
    
    
    
    
    //let latitude = (location?.coordinate.latitude)!
                //let longitude = (location?.coordinate.longitude)!
    let manager = CLLocationManager()
    
    @IBAction func send(_ sender: Any) {
        addHint()
        addPlaceView.isHidden = true
        addPlaceDetail.isHidden = true
        addPlace.isHidden = false
        getLocation.isHidden = false
        
    }
    @IBAction func nextPage(_ sender: Any) {
        addPlaceView.isHidden = true
        addPlaceDetail.isHidden = false
        
    }
    
    @IBAction func addPlace(_ sender: Any) {
        addPlace.isHidden = true
        getLocation.isHidden = true
        addPlaceView.isHidden = false
        
        
        
        //minMapview()
    }
    
    @IBAction func getLocation(_ sender: Any) {
    }
    
    @IBOutlet var mapView: GMSMapView!
    
    func addHint() {
        let alertController = UIAlertController(
            title:"提示",
            message: "已送出",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title:"好",
            style: .default,
            handler:  {
                (ACTION: UIAlertAction!) -> Void in
                print("2333")
            })
        alertController.addAction(okAction)
        
        self.present(
        alertController,
            animated: true,
            completion: nil
        )
    }
    
    @IBAction func close_1(_ sender: Any) {
        addPlace.isHidden = false
        getLocation.isHidden = false
        addPlaceView.isHidden = true
    }
    
    @IBAction func close_2(_ sender: Any) {
        addPlace.isHidden = false
        getLocation.isHidden = false
        addPlaceView.isHidden = true
        addPlaceDetail.isHidden = true
    }
    
    func minMapview() {    //地圖的部分
        
        
        //GMSServices.provideAPIKey("AIzaSyCnxEsviVbzh1zF9MHUFoKZODZjUAyKOak")
        
        let camera = GMSCameraPosition.camera(withLatitude: 23.710287505272234, longitude: 120.54417737668828, zoom: 20.0)
        
        let minMap = GMSMapView.map(withFrame: self.minMapView.frame, camera: camera)
        minMapView = minMap
                //self.view.addSubview(mapView)

                // Creates a marker in the center of the map.
               /*let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude:23.710287505272234, longitude:120.54417737668828)
                marker.title = "10の家"
        marker.icon = UIImage(named: "")
                marker.snippet = "Australia"
                marker.map = minMapView
        
        minMapView.camera = camera
        //location.text = marker.title
        //locationCIV.text = marker.title*/
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlaceView.isHidden = true
        addPlaceDetail.isHidden = true
        mapview()
        
        //mapView.clear()
        //minMapview()
        // Do any additional setup after loading the view.
    }
    
    func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ())  {
            //1
            let locale = Locale(identifier: "zh_TW")
            let loc: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
            if #available(iOS 11.0, *) {
                CLGeocoder().reverseGeocodeLocation(loc, preferredLocale: locale) { placemarks, error in
                guard let placemark = placemarks?.first, error == nil else {
                    UserDefaults.standard.removeObject(forKey: "AppleLanguages")
                    completion(nil, error)
                    return
                }
                completion(placemark, nil)
            }
        }
    
        func locationAddress(){
                
                //CLGeocoder地理編碼 經緯度轉換地址位置
                geocode(latitude: 24.12721655694024, longitude: 120.6682352929325) { placemark, error in
                    guard let placemark = placemark, error == nil else { return }
                    // you should always update your UI in the main thread
                    DispatchQueue.main.async {
                        //  update UI here
                        print("address1:", placemark.thoroughfare ?? "")
                        print("address2:", placemark.subThoroughfare ?? "")
                        print("city:",     placemark.locality ?? "")
                        print("state:",    placemark.administrativeArea ?? "")
                        print("zip code:", placemark.postalCode ?? "")
                        print("country:",  placemark.country ?? "")
                        print("placemark",placemark)
                        
                    }
                }
            }
        }
        
    func mapview() {    //地圖的部分
        
       // let marker1 = GMSMarker()
                //marker1.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                //marker1.map = mapView
        //GMSServices.provideAPIKey("AIzaSyCnxEsviVbzh1zF9MHUFoKZODZjUAyKOak")
        
        //let camera = GMSCameraPosition.camera(withLatitude: 23.710287505272234, longitude: 120.54417737668828, zoom: 16.0)
        //let camera2 = GMSCameraPosition.camera(withLatitude: 23.710287505272234, longitude: 120.54417737668828, zoom: 20.0)
        //let mapView = GMSMapView.map(withFrame: self.mapView.frame, camera: camera)
                //self.view.addSubview(mapView)

                // Creates a marker in the center of the map.
               let marker1 = GMSMarker()
                marker1.position = CLLocationCoordinate2D(latitude:25.137302615618555, longitude:121.5393622622502)
                marker1.title = "文化大學"
        //marker1.icon = UIImage(named: "新增地點-現在位置")
                
        
        marker1.icon = UIGraphicsImageRenderer(size: .init(width: 60.0, height: 60.0)).image { context in
            UIImage(named: "新增地點-現在位置")!.draw(in: .init(origin: .zero, size: context.format.bounds.size))
        }
        marker1.snippet = "現在位置"
                marker1.map = mapView
        
        //mapView.camera = camera
        //minMapView.camera = camera2
        //location.text = marker.title
        //locationCIV.text = marker.title
        
        //25.137302615618555, 121.5393622622502
        let marker2 = GMSMarker()
         marker2.position = CLLocationCoordinate2D(latitude:25.137302615618555, longitude:121.5393622622502)
         marker2.title = "文化大學"
 //marker2.icon = UIImage(named: "新增地點-現在位置")
        marker2.icon = UIGraphicsImageRenderer(size: .init(width: 40.0, height: 40.0)).image { context in
            UIImage(named: "新增地點-現在位置")!.draw(in: .init(origin: .zero, size: context.format.bounds.size))
        }
         marker2.snippet = "現在位置"
         marker2.map = minMapView
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        //view.bringSubviewToFront(addPlace)
        
        //view.bringSubviewToFront(clockInView)
        //viewCIV = UIView(frame: CGRect(x: 29, y: 597, width: 356, height: 163))
        
        
        //minMapview()
           
        }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations.first
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        let camera2 = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        minMapView.camera = camera2
        
        self.mapView?.animate(to: camera)
            manager.stopUpdatingLocation()
            
        
        render(location!)
        
        
    }
    
    func render ( _ location: CLLocation) {
        
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
