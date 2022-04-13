//
//  JoinPageViewController.swift
//  finwork
//
//  Created by Evan on 2021/8/2.
//

import UIKit
import GoogleMaps
import FirebaseStorage
import FirebaseUI



class JoinPageViewController: UIViewController {

    let colory = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.00)
    let colorgg = UIColor(red: 0.93, green: 0.46, blue: 0.37, alpha: 1.00)
    let colorgy = UIColor(red: 1.00, green: 0.88, blue: 0.73, alpha: 1.00)
    
    var act_qabtn: Bool = false
    var act_introduction: Bool = true
    var travelItem: recure?
    
    
    
    @IBOutlet weak var user_image: UIImageView!
    
    @IBOutlet weak var user_name: UILabel!
    
    @IBOutlet weak var user_gender: UIImageView!
    
    @IBOutlet weak var travel_title: UILabel!
    
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var start_time_data: UILabel!
    
    @IBOutlet weak var finish_time_data: UILabel!
    
    @IBOutlet weak var people_num: UILabel!
    
    @IBOutlet weak var detail_content: UILabel!
    
    @IBOutlet weak var map_view: GMSMapView!
    
    
    @IBOutlet var maskView: UIView!
    
    @IBOutlet var qabtn: UIButton!
    @IBOutlet var introduction: UIButton!
    
    @IBOutlet var qabtnLabel: UILabel!
    @IBOutlet var introductionLabel: UILabel!
    @IBOutlet var introductionScroll: UIScrollView!
    
    @IBOutlet var qa_btn: UIButton!
    
    @IBOutlet var qatable: UIView!
    
    
    @IBAction func join_btn(_ sender: Any) {
        confirm()
    }
    
    
    @IBAction func introduction(_ sender: Any) {
        
        
        
        act_introduction = true
        act_qabtn = false
        onclick_introductionbtncustom()
        def_qabtncustom()
        
    }
    @IBAction func qaBtn(_ sender: Any) {
        
        
        act_introduction = false
        act_qabtn = true
        
        
        onclick_qabtncustom()
        
        def_introductionbtncustom()
        //exit(onclick_introductionbtncustom ())
    }
   
    
    
    
    
    //參團提示框
    func confirm() {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "參團",
            message: "確認要加入嗎？",
            preferredStyle: .alert)

        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
          title: "取消",
            style: .cancel,
          handler: nil)
        alertController.addAction(cancelAction)

        // 建立[送出]按鈕
        let okAction = UIAlertAction(
          title: "確認",
            style: .default,
          handler: nil)
        alertController.addAction(okAction)

        // 顯示提示框
        self.present(
          alertController,
          animated: true,
          completion: nil)
    }
    
     
     
     
     
    func def_introductionbtncustom( )  {
        
        if (act_introduction == true) {return;}
        
        let colory = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.00)
        let colorgg = UIColor(red: 0.93, green: 0.46, blue: 0.37, alpha: 1.00)
        //let colorgy = UIColor(red: 1.00, green: 0.88, blue: 0.73, alpha: 1.00)
        
        
        
        let btn_gradient = CAGradientLayer()
        btn_gradient.type = .axial
        btn_gradient.frame = CGRect(x: introduction.bounds.minX - 3, y: introduction.bounds.minY, width: introduction.frame.size.width + 3, height: introduction.frame.size.height + 3)
        btn_gradient.colors = [colory.cgColor,colory.cgColor]//漸層
        btn_gradient.locations = [0.0,0.45]
        btn_gradient.cornerRadius = 10
        btn_gradient.maskedCorners = .layerMaxXMinYCorner
        
        let shape = CAShapeLayer()
        shape.lineWidth = 3
        shape.path = UIBezierPath(roundedRect: self.introduction.bounds,cornerRadius: btn_gradient.cornerRadius).cgPath
        //設一個更大的按鈕筐
        shape.strokeColor = colorgg.cgColor
        //shape.cornerRadius = 10
        shape.maskedCorners = .layerMaxXMinYCorner
        shape.fillColor = UIColor.clear.cgColor
        btn_gradient.mask = shape
        
        let layer1 = CALayer()
        layer1.frame = CGRect(x: introduction.bounds.minX , y: introduction.bounds.maxY - 10, width: introduction.frame.size.width , height: 20)
        layer1.backgroundColor = colory.cgColor
        
        let lineView = UIView(frame: CGRect(x: introduction.bounds.minX - 10, y: introduction.bounds.minY - 1 , width: introduction.frame.size.width , height: 3)) //bottom
        lineView.backgroundColor = colorgg
        
        let btn_gradient2 = CAGradientLayer()
        btn_gradient2.type = .axial
        btn_gradient2.frame = CGRect(x: introduction.bounds.minX, y: introduction.bounds.minY, width: 10, height: introduction.frame.size.height)
        btn_gradient2.colors = [colory.cgColor,colory.cgColor]
        btn_gradient2.locations = [0.0,0.45]
        
        let lineView2 = UIView(frame: CGRect(x: introduction.bounds.maxX - 1.5, y: introduction.bounds.minY + 10, width: 3, height: introduction.frame.size.height - 10)) //left
        lineView2.backgroundColor = colorgg
        
        let lineView3 = UIView(frame: CGRect(x: introduction.bounds.minX , y: introduction.bounds.maxY - 3 , width: introduction.frame.size.width , height: 3)) //bottom
        lineView3.backgroundColor = colorgg
        
        
        qabtn.frame.size.width = 150
        
        //self.qabtn.layer.addSublayer(self.introduction.layer)
        self.introduction.layer.addSublayer(btn_gradient)
        self.introduction.layer.addSublayer(shape)
        
        self.introduction.layer.addSublayer(layer1)
        
        self.introduction.layer.addSublayer(btn_gradient2)
        self.introduction.addSubview(lineView)
        introduction.addSubview(lineView2)
        introduction.addSubview(lineView3)
        
        introductionScroll.isHidden = true
        
        introductionLabel.font = UIFont(name: "Helvetica-Light", size: 22)
        
    }
    
    
    func onclick_introductionbtncustom() {
        
        if (act_introduction == false) {return;}
        
        let colory = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.00)
        let colorgg = UIColor(red: 0.93, green: 0.46, blue: 0.37, alpha: 1.00)
        let colorgy = UIColor(red: 1.00, green: 0.88, blue: 0.73, alpha: 1.00)
        
        
        
        let btn_gradient = CAGradientLayer()
        btn_gradient.type = .axial
        btn_gradient.frame = CGRect(x: introduction.bounds.minX - 3, y: introduction.bounds.minY, width: introduction.frame.size.width + 3, height: introduction.frame.size.height + 3)
        btn_gradient.colors = [colorgy.cgColor, colory.cgColor]//漸層
        btn_gradient.locations = [0.0,0.45]
        btn_gradient.cornerRadius = 10
        btn_gradient.maskedCorners = .layerMaxXMinYCorner
        
        let shape = CAShapeLayer()
        shape.lineWidth = 3
        shape.path = UIBezierPath(roundedRect: self.introduction.bounds,cornerRadius: btn_gradient.cornerRadius).cgPath
        //設一個更大的按鈕筐
        shape.strokeColor = colorgg.cgColor
        //shape.cornerRadius = 10
        shape.maskedCorners = .layerMaxXMinYCorner
        shape.fillColor = UIColor.clear.cgColor
        btn_gradient.mask = shape
        
        let layer1 = CALayer()
        layer1.frame = CGRect(x: introduction.bounds.minX , y: introduction.bounds.maxY - 10, width: introduction.frame.size.width , height: 20)
        layer1.backgroundColor = colory.cgColor
        
        let lineView = UIView(frame: CGRect(x: introduction.bounds.minX - 10, y: introduction.bounds.minY - 1 , width: introduction.frame.size.width , height: 3)) //bottom
        lineView.backgroundColor = colorgg
        
        let btn_gradient2 = CAGradientLayer()
        btn_gradient2.type = .axial
        btn_gradient2.frame = CGRect(x: introduction.bounds.minX, y: introduction.bounds.minY, width: 10, height: introduction.frame.size.height)
        btn_gradient2.colors = [colorgy.cgColor, colory.cgColor]
        btn_gradient2.locations = [0.0,0.45]
        
        let lineView2 = UIView(frame: CGRect(x: introduction.bounds.maxX - 1.5, y: introduction.bounds.minY + 10, width: 3, height: introduction.frame.size.height - 10)) //left
        lineView2.backgroundColor = colorgg
        
        
        qabtn.frame.size.width = 150
        //self.qabtn.layer.addSublayer(self.introduction.layer)
        self.introduction.layer.addSublayer(btn_gradient)
        self.introduction.layer.addSublayer(shape)
        
        self.introduction.layer.addSublayer(layer1)
        
        self.introduction.layer.addSublayer(btn_gradient2)
        self.introduction.addSubview(lineView)
        introduction.addSubview(lineView2)
        
        introductionScroll.isHidden = false
        
        introductionLabel.font = UIFont(name: "Helvetica-Bold", size: 22)
        
    }
    
    func def_qabtncustom() {
        if (act_qabtn == true) {return;}
        
        let colory = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.00)
        let colorgg = UIColor(red: 0.93, green: 0.46, blue: 0.37, alpha: 1.00)
        
        let qabtn_gradient = CAGradientLayer()
        qabtn_gradient.type = .axial
        qabtn_gradient.frame = CGRect(x: qabtn.bounds.minX + 3, y: qabtn.bounds.minY, width: qabtn.frame.size.width , height: qabtn.frame.size.height + 3)
        qabtn_gradient.colors = [colory.cgColor,colory.cgColor]//漸層
        //qabtn_gradient.colors = [colorgg.cgColor, colory.cgColor]
        qabtn_gradient.locations = [0.0,0.75]
        qabtn_gradient.cornerRadius = 10
        qabtn_gradient.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        let qashape = CAShapeLayer()
        qashape.lineWidth = 3
        qashape.path = UIBezierPath(roundedRect: self.qabtn.bounds,cornerRadius: qabtn_gradient.cornerRadius).cgPath
        //設一個更大的按鈕筐
        qashape.strokeColor = colorgg.cgColor
        //shape.cornerRadius = 10
        qashape.maskedCorners = .layerMaxXMinYCorner
        qashape.fillColor = UIColor.clear.cgColor
        qabtn_gradient.mask = qashape
        
        let qalayer = CALayer()
        qalayer.frame = CGRect(x: qabtn.bounds.minX + 1.5 , y: qabtn.bounds.maxY - 10, width: qabtn.frame.size.width - 1, height: 20)
        qalayer.backgroundColor = colory.cgColor
        
        let qalineView = UIView(frame: CGRect(x: qabtn.bounds.minX , y: qabtn.bounds.maxY - 3 , width: qabtn.frame.size.width + 114 , height: 3)) //bottom
        qalineView.backgroundColor = colorgg
        
        
        let qalineView2 = UIView(frame: CGRect(x: qabtn.bounds.maxX - 1.5, y: qabtn.bounds.minY + 10, width: 3, height: qabtn.frame.size.height - 10)) //left
        qalineView2.backgroundColor = colorgg

        
        self.qabtn.layer.addSublayer(qabtn_gradient)
        self.qabtn.layer.addSublayer(qashape)
        self.qabtn.layer.addSublayer(qalayer)
        self.qabtn.addSubview(qalineView)
        self.qabtn.addSubview(qalineView2)
        qabtn.frame.size.width = 150
        //let size = qabtn.frame.size.width
        
        qatable.isHidden = true
        qa_btn.isHidden = true
        qabtnLabel.font = UIFont(name: "Helvetica-Light", size: 22)
        
    }
    
    func onclick_qabtncustom() {
        if (act_qabtn == false) {return;}
        
        let colory = UIColor(red: 1.00, green: 0.98, blue: 0.90, alpha: 1.00)
        let colorgg = UIColor(red: 0.93, green: 0.46, blue: 0.37, alpha: 1.00)
        let colorgy = UIColor(red: 1.00, green: 0.88, blue: 0.73, alpha: 1.00)
        
        let qabtn_gradient = CAGradientLayer()//漸層
        qabtn_gradient.type = .axial
        qabtn_gradient.frame = CGRect(x: qabtn.bounds.minX + 3, y: qabtn.bounds.minY, width: qabtn.frame.size.width , height: qabtn.frame.size.height + 3)
        qabtn_gradient.colors = [colorgy.cgColor, colory.cgColor]
        //qabtn_gradient.colors = [colorgg.cgColor, colory.cgColor]
        qabtn_gradient.locations = [0.0,0.75]
        qabtn_gradient.cornerRadius = 10
        qabtn_gradient.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        let qashape = CAShapeLayer()//漸層外誆
        qashape.lineWidth = 3
        qashape.path = UIBezierPath(roundedRect: self.qabtn.bounds,cornerRadius: qabtn_gradient.cornerRadius).cgPath
        //設一個更大的按鈕筐
        qashape.strokeColor = colorgg.cgColor
        //shape.cornerRadius = 10
        qashape.maskedCorners = .layerMaxXMinYCorner
        qashape.fillColor = UIColor.clear.cgColor
        qabtn_gradient.mask = qashape
        
        let qalayer = CALayer()//下方遮罩
        qalayer.frame = CGRect(x: qabtn.bounds.minX + 1.5 , y: qabtn.bounds.maxY - 10, width: qabtn.frame.size.width - 1, height: 20)
        qalayer.backgroundColor = colory.cgColor
        
        let qalineView = UIView(frame: CGRect(x: qabtn.bounds.maxX , y: qabtn.bounds.maxY - 3 , width: qabtn.frame.size.width + 114 , height: 3)) //遮罩匡線下
        qalineView.backgroundColor = colorgg
        
        
        let qalineView2 = UIView(frame: CGRect(x: qabtn.bounds.maxX - 1.5, y: qabtn.bounds.minY + 10, width: 3, height: qabtn.frame.size.height - 10)) //右遮罩線
        qalineView2.backgroundColor = colorgg

        
        self.qabtn.layer.addSublayer(qabtn_gradient)
        self.qabtn.layer.addSublayer(qashape)
        self.qabtn.layer.addSublayer(qalayer)
        self.qabtn.addSubview(qalineView)
        self.qabtn.addSubview(qalineView2)
        qabtn.frame.size.width = 150
        //let size = qabtn.frame.size.width
        
        qatable.isHidden = false
        qa_btn.isHidden = false
        qabtnLabel.font = UIFont(name: "Helvetica-Bold", size: 22)
    }
     
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let dispatchGroup = DispatchGroup()
        
        db.collection("users").whereField("id", isEqualTo: travelItem?.user_id)
                                      .getDocuments() { (querySnapshot, err) in
                                          if let err = err {
                                              print("Error getting documents: \(err)")
                                          } else {
                                              
                                              dispatchGroup.enter()
                                              for document in querySnapshot!.documents {
                                                  
                                                  let storage = Storage.storage()
                                                  let storageRef = storage.reference()
              
                                                  self.user_name.text = document.data()[ "user_nikename"] as! String
                                                  let photo: StorageReference = storageRef.child(document.data()[ "user_imagetext"] as! String)
                                                  self.user_image.sd_setImage(with: photo)
                                                  if ( document.data()[ "user_gender"] as! String == "男") {
                                                      self.user_gender.image = UIImage(named: "男生")
                                                  } else if ( document.data()[ "user_gender"] as! String == "女") {
                                                      self.user_gender.image = UIImage(named: "愛心後")
                                                  }
                                                                                         
                                                  
                                                      print("JP65")
                                                  
                                                  dispatchGroup.leave()
                                                  DispatchQueue.main.async {
                                                                                                        print("JP390") }
                                                  }
                                              DispatchQueue.main.async {
                                                                                                    print("JP389") }
                                          }
                                          DispatchQueue.main.async {
                                                                                                print("JP384")
                                                                                            }
                                      }
        
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YY/MM/dd HH:mm"
        
        print("JP340",travelItem?.id)
        //TravelListItemTableViewCell.id = ""
        travel_title.text = travelItem?.title
        place.text = travelItem?.place
        start_time_data.text = dateFormatter.string(from: travelItem?.start_time ?? Date())
        finish_time_data.text = dateFormatter.string(from: travelItem?.finish_time ?? Date())
        detail_content.text = travelItem?.detail_content
        
        map_view.settings.compassButton = true
        map_view.isMyLocationEnabled = true
        map_view.settings.myLocationButton = true
        
        //let camera = GMSCameraPosition.camera(withLatitude: 25.137302615618555, longitude: 121.5393622622502, zoom: 17.0)
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: #selector(backToMain))
        //-------------------------------------------------------------------
        
        
    }
    
   @objc func backToMain() {
        
        let main = ViewController()
    navigationController?.pushViewController(main, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        
        
        act_introduction = true
        act_qabtn = false
        onclick_introductionbtncustom()
        def_qabtncustom()
        
        
        //mask()
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

extension JoinPageViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return}
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
    }
}
