//
//  ViewController.swift
//  finwork
//
//  Created by Evan on 2021/6/19.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
        
    @IBOutlet weak var close_menu: UIView!
    
    @IBOutlet weak var menu_leading: NSLayoutConstraint!
    
    @IBOutlet weak var menu_trailing: NSLayoutConstraint!
    
    @IBAction func closemenu(_ sender: Any) {
        close_menu.isHidden = true
        menuView.isHidden = true
        menu_leading.constant = -300
        //menu_trailing.constant = 300
        menuOut = false
    }
    
    
    
    @IBOutlet weak var main_page_leading: NSLayoutConstraint!
    
    @IBOutlet weak var main_page_trailing: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var indexView: UIView!
    
    
    
    var menuOut = false
    
    
    
    @IBAction func menuTapped(_ sender: Any) {
        if menuOut == false {
            menu_leading.constant = 0
            //menu_trailing.constant = 0
            close_menu.isHidden = false
            menuView.isHidden = false
            //menuView.addSubview(indexView)
            menuOut = true
        } else {
            menu_leading.constant = -300
            //menu_trailing.constant = 300
            close_menu.isHidden = true
            menuView.isHidden = true
            //indexView.addSubview(menuView)
            menuOut = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {self.view.layoutIfNeeded()} ) {(animationComplete) in print("")}
    }
    
    
    let adimage = ["1","2","3","4","1"]
    
    @IBOutlet weak var adImageView: UICollectionView!
    
    var imageIndex = 0
    
    //nav gradient
    /*
    var gradient : CAGradientLayer?
        let gradientView : UIView = {
            let view = UIView()
            return view
        }()
    
    
    func setupGradient() {
        let height : CGFloat = 90 // Height of the nav bar
        let color = UIColor.black.withAlphaComponent(0.7).cgColor // You can mess with opacity to your liking
        let clear = UIColor.black.withAlphaComponent(0.0).cgColor
        gradient = setupGradient()
        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
        gradientView.layer.insertSublayer(gradient!, at: 0)
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let userID = Auth.auth().currentUser?.uid else { return }

        print("VC95",userID)
        
        adImageView.dataSource = self
        adImageView.delegate = self
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeBanner), userInfo: nil, repeats: true)
        setCustomBackImage()
        
        menu_leading.constant = -300
        //menu_trailing.constant = 300
        close_menu.isHidden = true
        menuView.isHidden = true
        //indexView.addSubview(menuView)
        
        
    }
    
    @objc func changeBanner() {
        var indexPath:IndexPath
        imageIndex += 1
        if imageIndex < adimage.count{
            
            indexPath = IndexPath(item: imageIndex, section: 0)
            adImageView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }else{
            imageIndex = 0
            indexPath = IndexPath(item: imageIndex, section: 0)
            adImageView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
            changeBanner()
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return adimage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ADImageCollectionViewCell
        cell.adImageView.image = UIImage(named: adimage[indexPath.item])
            return cell
        }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }*/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }*/
    
    
    func setCustomBackImage() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: self,
            action: nil
        )
    }
        

class UINavigationBarGradientView: UIView {
    
    var topColor: UIColor = #colorLiteral(red: 0.9984691739, green: 0.4278234541, blue: 0.3354437947, alpha: 1)
    var flootColor: UIColor = #colorLiteral(red: 1, green: 0.6393517256, blue: 0.264567703, alpha: 1)
    var startPionx: CGFloat = 0
    var startPiony: CGFloat = 0
    var endPionx: CGFloat = 1
    var endPiony: CGFloat = 1
    
    override func layoutSubviews() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ topColor.cgColor, flootColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: startPionx, y: startPiony)
        gradientLayer.endPoint = CGPoint(x: endPionx, y: endPiony)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        //UINavigationBar
    }
}
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
}
