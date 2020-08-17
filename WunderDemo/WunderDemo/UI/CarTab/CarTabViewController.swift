//
//  CarTabViewController.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import UIKit

class CarTabViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var carsTableView: UITableView!
    
    private var presenter: PlaceMarkTabPresenterInput!
    private var carIntractor: PlaceMarkInteractorInput!
    private var placeMarkList = [Placemark]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        initializePresenter()
        presenter.viewDidLoad()
    }
    
    private func initializePresenter(){
        presenter = PlaceMarkPresenter()
        carIntractor = PlaceMarkInteractor()
        carIntractor.output = presenter as? PlaceMarkInteractorOutput
        presenter.carView = self
        presenter.intractor = carIntractor
    }
    
    private func prepareTableView(){
        carsTableView.estimatedRowHeight = 100
        
    }
    
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SingleMapPinViewController") as! SingleMapPinViewController
        vc.late = placeMarkList[indexPath.row].coordinates[0]
        vc.long = placeMarkList[indexPath.row].coordinates[1]
        vc.carName = placeMarkList[indexPath.row].name
        vc.carAddress = placeMarkList[indexPath.row].address
        self.navigationController!.pushViewController(vc, animated: true)
    } 
}

//MARK: CarTabViewInput
extension CarTabViewController: PlaceMarkTabViewInput{
    
    func showLoadingCarsError(_ message: String) {
        showErrorMessage(message)
    }
    
    func showLoadingCars(){
        showLoadingView(self.carsTableView)
    }
    
    func showCars(for list: [Placemark]){
        setPlaceMarkList(list)
        carsTableView.reloadData()
    }
    
    func hideLoadingCars(){
        hideLoadingView(self.carsTableView)
    }
}
