//
//  ViewController.swift
//  Test
//
//  Created by Sunnight on 16/8/26.
//  Copyright © 2016年 ronghan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var dataArray = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var sectionTitleArr = [String]()
//        for index in 0..<7 {
//            if index == 4 {
//                sectionTitleArr = ["title1","title2","title3"]
//                dataArray.append(sectionTitleArr)
//                sectionTitleArr = []
//                continue
//            }
//            sectionTitleArr.append(String(format: "title_1%d", index))
//            dataArray.append(sectionTitleArr)
//            sectionTitleArr = []
//        }
//        
        dataSource()
        
        
        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: .Grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.sectionHeaderHeight = 20.0
        tableView?.sectionFooterHeight = 0.01
        view.addSubview(tableView!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dataSource() {
        for index in 0 ..< 7 {
            if index == 4 {
                let sectionTitles = ["title1","title2","title3"]
                self.dataArray.append(sectionTitles)
            }
            else {
                let str = String(format: "title_1%d", index)
                let sectionTitle = [str]
                self.dataArray.append(sectionTitle)
            }
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CellID")
        if (cell != nil) {
        }
        cell = UITableViewCell(style: .Default, reuseIdentifier: "CellID")
        return cell!
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = UIView(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.size.width,20))
        let width = UIScreen.mainScreen().bounds.size.width/3
        if section == 4 {
            let titleL1 = UILabel(frame: CGRectMake(0,0,width,20))
            let titleL2 = UILabel(frame: CGRectMake(width,0,width,20))
            let titleL3 = UILabel(frame: CGRectMake(width*2,0,width,20))
            view.addSubview(titleL1)
            view.addSubview(titleL2)
            view.addSubview(titleL3)
            var titleLs = [titleL1,titleL2,titleL3]
            for (index,item) in titleLs.enumerate() {
                item.text = self.dataArray[4][index]
            }
        }else {
            let titleL = UILabel(frame: CGRectMake(0,0,width,20))
            view.addSubview(titleL)
            titleL.text = self.dataArray[section].first
        }
        
        return view
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if self.dataArray[section].count == 1 {
//            return self.dataArray[section].first
//        }
//        return nil
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

