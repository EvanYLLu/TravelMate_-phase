//
//  ClockInViewController.swift
//  finwork
//
//  Created by Evan on 2021/7/9.
//

import GoogleMaps
import UIKit
import SwiftyStarRatingView
import CoreLocation
import Photos
//import Firebase



class ClockInViewController: UIViewController, CLLocationManagerDelegate {

    //var ref: DatabaseReference!

    let manager = CLLocationManager()
    
    
    
    @IBOutlet var location: UILabel!
    
    @IBOutlet var locationCIV: UILabel!
    
    @IBOutlet var comment: UITextView!
    
    @IBOutlet var clockImg1: UIImageView!
    
    @IBOutlet var clockImg2: UIImageView!
    
    @IBOutlet var viewCIV: UIView!
    
    
    @IBOutlet var clockInView: UIView!
    
    @IBOutlet var mapView: GMSMapView!
    
    
    @IBOutlet var clockIn: UIButton!
    
    func starRatingViewConstraint() {   //星星Constraint
        self.view.addSubview(starRatingView)
        let starRatingViewConstraint = [
            //starRatingView.centerXAnchor.constraint(equalTo: clockInView.centerXAnchor,constant: -10),
            //starRatingView.centerYAnchor.constraint(equalTo: clockInView.centerYAnchor,constant: 130),
            starRatingView.topAnchor.constraint(equalTo: clockInView.topAnchor,constant: 148),
            starRatingView.leftAnchor.constraint(equalTo: clockInView.leftAnchor,constant: 32),
            starRatingView.bottomAnchor.constraint(equalTo: clockInView.bottomAnchor,constant: -408),
            starRatingView.rightAnchor.constraint(equalTo: clockInView.rightAnchor,constant: -32)
        ]
        NSLayoutConstraint.activate(starRatingViewConstraint )
                
    }
    
    
    
    @IBAction func imgPick(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        
        
        
        
    }
    /*
    extension ClockInViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
               let image = info[.originalImage] as? UIImage
                self.clockImg2.image = image
                picker.dismiss(animated: true, completion: nil)
                print("fuck me")
            }
        }
*/
    
    /*
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
         // 取得照片
         let image1 = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
         self.clockImg1.image = image1
         //取得照片後將imagePickercontroller dismiss
         picker.dismiss(animated: true, completion: nil)
     }
     */
    
    /*
     imagePicker.sourceType = .photoLibrary
         imagePicker.allowsEditing = true
         self.present(imagePicker, animated: true)
     
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 取得照片
        let image1 = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
        self.clockImg1.image = image1
        //取得照片後將imagePickercontroller dismiss
        picker.dismiss(animated: true, completion: nil)
    }*/
    
    @IBAction func clockIn(_ sender: Any) {
        
        
        starRatingViewConstraint()
        starRatingView.backgroundColor = getUIColor(hex: "#FFFAE6")
        
        
        if (viewCIV.isHidden == true && clockInView.isHidden == false) {
                    viewCIV.isHidden = false
            clockInView.isHidden = true
            starRatingView.isHidden = true
                }
                else {
                    viewCIV.isHidden = true
                    clockInView.isHidden = false
                    starRatingView.isHidden = false
                    //view.addSubview(clockInView)
                    self.view.addSubview(starRatingView)
                    view.bringSubviewToFront(clockInView)
                    view.bringSubviewToFront(starRatingView)
                }
        
        
    }
    
    // MARK: - starRatingView
    
   private let starRatingView: SwiftyStarRatingView = { //星星
        let starRatingView = SwiftyStarRatingView()
    starRatingView.translatesAutoresizingMaskIntoConstraints = false
    

    starRatingView.maximumValue = 5 //default is 5

    starRatingView.minimumValue = 0 //default is 0
    
    starRatingView.allowsHalfStars = false

    starRatingView.continuous = true
    
    starRatingView.value = 0        //default is 0

    starRatingView.tintColor = UIColor.yellow
    
    starRatingView.emptyStarImage = UIImage(named: "empty.png")
        starRatingView.filledStarImage = UIImage(named: "filled.png")

    starRatingView.addTarget(self, action: #selector(starRating(paramTarget:)), for: .valueChanged)
        return starRatingView
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapview()
        //ref = Database.database().reference()
        //self.ref.child("users").child("123").setValue(["username": "1232"])
        //blurEffect()
        //view.addSubview(clockIn)
        //self.view.sendSubviewToBack(viewCIV)
        clockInView.isHidden = true
        //self.imagePicker.delegate = self
    }
    
    func getUIColor(hex: String, alpha: Double = 1.0) -> UIColor? { //sRGB Code
        var cleanString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cleanString.hasPrefix("#")) {
            cleanString.remove(at: cleanString.startIndex)
        }

        if ((cleanString.count) != 6) {
            return nil
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cleanString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(0.0)
        )
    }
    @objc func starRating(paramTarget: SwiftyStarRatingView) {
        
    }
    
override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    view.bringSubviewToFront(viewCIV)
    
    
    
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.delegate = self
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
    //view.bringSubviewToFront(clockInView)
    //viewCIV = UIView(frame: CGRect(x: 29, y: 597, width: 356, height: 163))
    
    
        
       
    }
    
    
    // MARK: - locationManager
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations.first
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        
        self.mapView?.animate(to: camera)
            manager.stopUpdatingLocation()
            
        
        render(location!)
        
        
    }
    
    func render ( _ location: CLLocation) {
        
    }
    
    
    func blurEffect() { //模糊
        let blurEffect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = viewCIV.frame
        //self.view.sendSubviewToBack(blurView)
            self.view.addSubview(blurView)
    }
    
    func mapview() {    //地圖的部分
        
        
        //GMSServices.provideAPIKey("AIzaSyCnxEsviVbzh1zF9MHUFoKZODZjUAyKOak")
        
       // let camera = GMSCameraPosition.camera(withLatitude: 23.710287505272234, longitude: 120.54417737668828, zoom: 16.0)
        //let mapView = GMSMapView.map(withFrame: self.mapView.frame, camera: camera)
                //self.view.addSubview(mapView)

                // Creates a marker in the center of the map.
               let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude:25.137302615618555, longitude:121.5393622622502)
                marker.title = "文化大學"
        //marker.icon = UIImage(named: "新增地點-現在位置")
        marker.icon = UIGraphicsImageRenderer(size: .init(width: 60.0, height: 60.0)).image { context in
            UIImage(named: "新增地點-現在位置")!.draw(in: .init(origin: .zero, size: context.format.bounds.size))
        }
                marker.snippet = "現在位置"
                marker.map = mapView
        
        //mapView.camera = camera
        location.text = marker.title
        locationCIV.text = marker.title
        
    }
    
    /*func sentData()
    {
        
        self.ref.child("users").child("123").setValue(["username": "1232"])
        
    }   */ /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ClockInViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        print("3333")
            let image = info[.originalImage] as? UIImage
             self.clockImg1.image = image
             picker.dismiss(animated: true, completion: nil)
            
        
            /*let image2 = info[.editedImage] as? UIImage
             self.clockImg2.image = image2
             picker.dismiss(animated: true, completion: nil)
            */
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


