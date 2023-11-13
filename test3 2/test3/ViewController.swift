//
//  ViewController.swift
//  test3
//
//  Created by Huy Vu on 11/12/23.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var Table_View: UITableView!
    
    var expandedSections = Set<Int>()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        Table_View.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        
        Table_View.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
//        view.addSubview(Table_View)
//        Table_View.frame = view.bounds
    }
    
    
   
   

}



extension ViewController:   UITableViewDelegate, UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return expandedSections.contains(section) ? 5 : 0
     }
    
    
    // Number of sections in the table view
       func numberOfSections(in tableView: UITableView) -> Int {
           return 2
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return TableViewCell.heigh_cell
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.Table_View.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        
        
        if indexPath.section == 0 {
                  // First section
                  cell.First_name.text = "Vu"
                  cell.Second_Name.text = "Huy"
              } else {
                  // Second section
                  cell.First_name.text = "huy"
                  cell.Second_Name.text = "Hoang"
              }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.lightGray

            let titleLabel = UILabel()
            titleLabel.textColor = UIColor.black
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(titleLabel)

            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true

            // Set section title
            titleLabel.text = "\(section + 1). \(section == 0 ? "First" : "Second") section"

            return headerView
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let footerView = UIView()
           let button = UIButton(type: .system)
           button.setTitle("Toggle Content", for: .normal)
           button.addTarget(self, action: #selector(toggleSection(_:)), for: .touchUpInside)
           button.tag = section
           button.translatesAutoresizingMaskIntoConstraints = false
           footerView.addSubview(button)

           button.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
           button.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true

           return footerView
       }

       func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 30
       }

       @objc func toggleSection(_ sender: UIButton) {
           let section = sender.tag

           if expandedSections.contains(section) {
               expandedSections.remove(section)
           } else {
               expandedSections.insert(section)
           }

           Table_View.reloadSections(IndexSet(integer: section), with: .automatic)
       }
    
    
}
