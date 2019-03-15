//
//  CustomPickerViewController.swift
//  CustomPickerView
//
//  Created by Nach on 14/3/19.
//  Copyright © 2019 Edenred. All rights reserved.
//

import UIKit

protocol CustomPickerViewDelegate {
    func itemSelectedFromList(itemSelected: String)
}

class CustomPickerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var customPickerTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    var delegate:CustomPickerViewDelegate?
    
    var displayList:[String] = []
    var heightOfRow : CGFloat = 60.0
    var selectedItem : String = ""
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.displayList = ["US","MY","TH","ID"]
        
        self.tableViewHeight.constant = CGFloat(self.displayList.count + 2) * self.heightOfRow
        self.customPickerTableView.reloadData()
    }

    //Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomPickerViewTableViewCell", for: indexPath)
        
        let textDisplayedLabel : UILabel = tableViewCell.viewWithTag(1) as! UILabel
        textDisplayedLabel.text = self.displayList[indexPath.row]
        textDisplayedLabel.font = textDisplayedLabel.font.withSize(15)
        textDisplayedLabel.textColor = UIColor.darkGray
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightOfRow
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tableHeaderView = UITableViewHeaderFooterView.init(frame: CGRect(x: 0, y: 0, width: self.customPickerTableView.frame.size.width, height: self.heightOfRow))
        
        let headerLabel = UILabel.init(frame: CGRect(x: 10.0, y: 0, width: tableHeaderView.frame.size.width, height: tableHeaderView.frame.size.height))
        headerLabel.text = "Choose Country"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        tableHeaderView.addSubview(headerLabel)
        
        return tableHeaderView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedItem = self.displayList[indexPath.row]
        delegate?.itemSelectedFromList(itemSelected: self.selectedItem)
    }
}

