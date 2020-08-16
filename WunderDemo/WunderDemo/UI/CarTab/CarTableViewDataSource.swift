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
            
            //MARK: Make alternate cell backround change
            if (indexPath.row % 2 == 0)
            {
                cell.backgroundColor = .clear
                cell.carNameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            } else {
                cell.backgroundColor = #colorLiteral(red: 0.1815615892, green: 0.3587294221, blue: 0.4445202351, alpha: 1)
                cell.carNameLabel.textColor = #colorLiteral(red: 0.9844431281, green: 0.9844661355, blue: 0.9844536185, alpha: 1)
            }
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
 
}
