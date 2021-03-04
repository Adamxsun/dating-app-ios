//
//  chat.swift
//  dating
//  Created by Xiao Sun on 2021-03-01.
//

import UIKit
class chat:UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet var plantView: UIView!
    @IBOutlet weak var dateText: UILabel!
    static var water = false
    static var plantDate = 1
    static var talkHelper = false
    @IBOutlet weak var waterText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        plantView.bounds = CGRect(x:0,y:0,width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.4)
        if mainPage.matched == true{
            myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            myTable.delegate = self
            myTable.dataSource = self
            view.backgroundColor = .orange
        }
        
    }//viewDidLoad
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }//tableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = "🥰New Matched🥰\(mainPage.matchedUser)"
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }//tableView
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //show chat message
        let vc =  chatwith()
        vc.title = "⭐️\(mainPage.matchedUser)⭐️"
        navigationController?.pushViewController(vc, animated: true)
    }//tableView
    
    override open var shouldAutorotate: Bool {
       return false
    }//shouldAutorotate
    func animateIn(desiredView: UIView){
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        })//
    }//
    func animateOut(desiredView: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        });
        
        desiredView.removeFromSuperview()
    }//animateOut
    @IBAction func TalkButton(_ sender: Any) {
        chat.talkHelper = true
    }
    @IBAction func plantButton(_ sender: Any) {
        animateIn(desiredView: plantView)
        dateText.text = "Date:\(chat.plantDate)"
        if chat.water == true
        {
            waterText.text = "Had Water!"
        }
        if chat.plantDate >= 200 {
            plantImage.image = UIImage(named: "plant3")
        }
        else if chat.plantDate >= 100{
            plantImage.image = UIImage(named: "plant2")
        }
        plantName.text = mainPage.matchedUser
    }
    @IBAction func doneButton(_ sender: Any) {
        animateOut(desiredView: plantView)
    }
}//chat
