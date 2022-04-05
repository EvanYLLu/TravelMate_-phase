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
    
    
    
    static let 佛陀: String = "觀自在菩薩，行深般若波羅密多時，照見五蘊皆空，度一切苦厄。舍利子！色不異空，空不異色；色即是空，空即是色。受想行識，亦復如是。舍利子！是諸法空相 不生不滅、不垢不淨、不增不減。是故，空中無色，無受想行識、無眼耳鼻舌身意、無色聲香味觸法 無眼界 乃至無意識界，無無明 亦無無明盡，乃至無老死亦無老死盡 無苦集滅道 無智亦無得 以無所得故 菩提薩埵  依般若波羅密多故，心無罣礙；無罣礙故，無有恐怖，遠離顛倒夢想，究竟涅槃。三世諸佛  依般若波羅密多故，得阿耨多羅三藐三菩提 故知般若波羅密多，是大神咒、是大明咒、是無上咒、是無等等咒，能除一切苦真實不虛，故說般若波羅密多咒。即說咒曰 揭諦揭諦，波羅揭諦，波羅僧揭諦，菩提薩婆訶。"
    //                       _oo0oo_
    //                      o8888888o
    //                      88" . "88
    //                      (| -_- |)
    //                      0\  =  /0
    //                    ___/`---'\___
    //                  .' \\|     |// '.
    //                 / \\|||  :  |||// \
    //                / _||||| -:- |||||- \
    //               |   | \\\  -  /// |   |
    //               | \_|  ''\---/''  |_/ |
    //               \  .-\__  '-'  ___/-. /
    //             ___'. .'  /--.--\  `. .'___
    //          ."" '<  `.___\_<|>_/___.' >' "".
    //         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
    //         \  \ `_.   \_ __\ /__ _/   .-` /  /
    //     =====`-.____`.___ \_____/___.-`___.-'=====
    //                       `=---='
    //
    //
    //     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //
    //               佛祖保佑         永無BUG

    //            佛曰: 程序員之歌(改)
     //                   寫字樓裡寫字間，寫字間裡程序員；
     //                   程序人員寫程序，又拿程序換酒錢。
     //                   酒醒只在網上坐，酒醉還來線下眠；
     //                   酒醉酒醒日復日，線上線下年復年。
     //                   鞠躬盡瘁電腦先，不願委身老闆錢；
     //                   雙B 奧迪分紅去，純軟海放系統廠。
     //                   我笑自己命太賤，加班爆肝不缺席；
     //                   不見滿街小姐姐，哪個歸得程序員？
     //
    
    
    
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
        
        AddTraveViewModels.loadData()
        AddUserViewModels.loadUserData()
        
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
