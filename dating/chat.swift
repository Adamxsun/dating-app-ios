//
//  chat.swift
//  dating
//
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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = "🥰"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //show chat message
        let vc =  chatwith()
        vc.title = "Chat"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override open var shouldAutorotate: Bool {
       return false
    }
    
}
