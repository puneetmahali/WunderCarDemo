//
//  CarTableViewDataSource.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import UIKit

class CarTableViewDataSource: NSObject, UITableViewDataSource , UITableViewDelegate{
    
    private var placeMarkList = [Placemark]()

    func setPlaceMarkList(_ placeMarkList: [Placemark]){
        self.placeMarkList = placeMarkList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CarInfoTableViewCell.ID, for: indexPath)
            as? CarInfoTableViewCell{
            
            let placemark = placeMarkList[indexPath.row]
            cell.updateData(placemark: placemark)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeMarkList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
