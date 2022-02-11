//
//  ChatViewController.swift
//  finwork
//
//  Created by Evan on 2021/8/9.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDataSource {
    
    
    
    
    @IBOutlet var message_input: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageTableView.dataSource = self
        
        /*MessageViewCell.register(UINib(nibName:
                "MessageViewCell", bundle: nil), forCellReuseIdentifier:
                "ReusableCell")*/
        
        
        // Do any additional setup after loading the view.
    }
    
    
        
        
    

}

struct Message {
            let sender: String // email
            let content: String
            let time: Date
            //let bgColor: UIColor?
            //let textColor: UIColor?
            //let img: String?
        }
        
var massage: [Message] = [
            
                Message( sender: "123@g.pccu.edu.tw", content: "223", time: DateComponents(calendar: Calendar.current, year: 2021, month: 8, day: 10, hour: 08, minute: 32, second: 23).date! )
            ]


extension ChatViewController {
            
    
    
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return massage.count
                }
                
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier:
                            "ReusableCell", for: indexPath)
                            cell.textLabel?.text = "This is a cell"
                            return cell
                }
            

            
        }
