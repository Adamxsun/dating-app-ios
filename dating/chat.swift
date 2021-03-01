//
//  chat.swift
//  dating
//  Created by Xiao Sun on 2021-02-28.
//

import UIKit
class chat:UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.delegate = self
        myTable.dataSource = self
        view.backgroundColor = .orange
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
    
}//chat
