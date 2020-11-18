//
//  ViewController.swift
//  TableViewAdvanceSample
//
//  Created by Lahiru Chathuranga on 11/17/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTableView: UITableView! { didSet {
        firstTableView.delegate = self
        firstTableView.dataSource = self
    }}
    @IBOutlet weak var secondTableView: UITableView! { didSet {
        secondTableView.delegate = self
        secondTableView.dataSource = self
    }}
    
    var firstArr: [String] = ["one", "two", "three"]
    var secondArr: [String] = ["A", "B", "C"]
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTableView.reloadData()
        firstTableView.isHidden = false
        secondTableView.isHidden = true
        
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        selectedIndex = sender.selectedSegmentIndex
        
        if sender.selectedSegmentIndex == 0 {
            firstTableView.reloadData()
            firstTableView.isHidden = false
            secondTableView.isHidden = true
        } else {
            secondTableView.reloadData()
            firstTableView.isHidden = true
            secondTableView.isHidden = false
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndex == 0 {
            return firstArr.count
        } else {
            return secondArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedIndex == 0 {
            if tableView == firstTableView {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTVCell") as! FirstTVCell
                cell.textLabel?.text = self.firstArr[indexPath.row]
                return cell
            } else {
                return UITableViewCell()
            }
            
            
        } else {
            if tableView == secondTableView {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTVCell") as! SecondTVCell
                cell.textLabel?.text = self.secondArr[indexPath.row]
                return cell
            } else {
                return UITableViewCell()
            }
           
        }
    }
    
    
}
