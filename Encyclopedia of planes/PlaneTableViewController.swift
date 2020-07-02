//
//  PlaneTableViewController.swift
//  Encyclopedia of planes
//
//  Created by Best Mac on 23.03.2020.
//  Copyright © 2020 Artem Lysevych. All rights reserved.
//

import UIKit

class PlaneTableViewController: UITableViewController {

    //MARK: Properties
    
    var planes = [Plane]()
    
    private func loadSamplePlanes() {
        
        let image1 = UIImage(named: "plane1")
        let image2 = UIImage(named: "plane2")
        let image3 = UIImage(named: "plane3")
        let image4 = UIImage(named: "plane4")
        let image5 = UIImage(named: "plane5")
        let image6 = UIImage(named: "plane6")
        let image7 = UIImage(named: "plane7")
        let image8 = UIImage(named: "plane8")
        let image9 = UIImage(named: "plane9")
        
        guard let plane1 = Plane(model: "Sukhoi Superjet 100", photo: image1, country: "Russia", weight: 49450, speed: 950, passengers: 108, distance: 4578) else { fatalError("Unable to instatiate plane1") }
        
        guard let plane2 = Plane(model: "Boeing 777-300", photo: image2, country: "USA", weight: 299370, speed: 945, passengers: 451, distance: 11135) else { fatalError("Unable to instatiate plane2") }
        
        guard let plane3 = Plane(model: "Boeing 737-900", photo: image3, country: "USA", weight: 79000, speed: 852, passengers: 189, distance: 5800) else { fatalError("Unable to instatiate plane3") }
        
        guard let plane4 = Plane(model: "Antonov An-225", photo: image4, country: "Ukraine", weight: 250000, speed: 850, passengers: 6, distance: 15400) else { fatalError("Unable to instatiate plane4") }
        
        guard let plane5 = Plane(model: "Antonov An-124", photo: image5, country: "Ukraine", weight: 178400, speed: 850, passengers: 8, distance: 7500) else { fatalError("Unable to instatiate plane5") }
        
        guard let plane6 = Plane(model: "Airbus A380", photo: image6, country: "France", weight: 590000, speed: 945, passengers: 525, distance: 15200) else { fatalError("Unable to instatiate plane6") }
        
        guard let plane7 = Plane(model: "Yak-40", photo: image7, country: "Russia", weight: 9850, speed: 546, passengers: 40, distance: 2500) else { fatalError("Unable to instatiate plane7") }
        
        guard let plane8 = Plane(model: "Boeing 787-9", photo: image8, country: "USA", weight: 126000, speed: 956, passengers: 290, distance: 14140) else { fatalError("Unable to instatiate plane8") }
        
        guard let plane9 = Plane(model: "Airbus A340-600", photo: image9, country: "France", weight: 380000, speed: 913, passengers: 475, distance: 14600) else { fatalError("Unable to instatiate plane9") }
        
        planes += [plane1, plane2, plane3, plane4, plane5, plane6, plane7, plane8, plane9]

    }
    
    //MARK: Actions
    
    @IBAction func unwindToPlaneList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? PlaneViewController, let plane = sourceViewController.plane {
            // Add a new plane.
            let newIndexPath = IndexPath(row: planes.count, section: 0)
            
            planes.append(plane)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Load the sample data.
        loadSamplePlanes()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // Утилизирует любые ресурсы, которые можно создать.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PlaneTableViewCell"
        
        //Downcasting the type of the cell to custom cell subclass, PlaneTableViewCell.
        //Изменение стандартного типа ячейки на наш созданный класс, PlaneTableViewCell.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlaneTableViewCell else {
            fatalError("The dequeued cell is not an instance of PlaneTableViewCell")
        }
        //The as? PlaneTableViewCell expression attempts to downcast the returned object from the UITableViewCell class to PlaneTableViewCell class. This returns an optional.
        //The guard let expression safely unwraps the optional.
        
        //Fetches the appropriate plane for the data source layout.
        let plane = planes[indexPath.row]

        cell.planeModel.text = plane.model
        cell.planeImage.image = plane.photo

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if segue.destination is PlaneViewController {
            let teleport = segue.destination as? PlaneViewController
            guard let selectedRowIndex = self.tableView.indexPathForSelectedRow else { return }
            
            teleport?.photo = planes[selectedRowIndex.item].photo
            teleport?.model = planes[selectedRowIndex.item].model
            teleport?.countryOfDesigning = planes[selectedRowIndex.item].country
            teleport?.weightOfPlane = planes[selectedRowIndex.item].weight
            teleport?.speedOfPlane = planes[selectedRowIndex.item].speed
            teleport?.numberOfPassengers = planes[selectedRowIndex.item].numberOfPassengers
            teleport?.distanceOfFlight = planes[selectedRowIndex.item].distance
        }
    }
}


extension Double {
    
    var toString: String {
        return NSNumber(value: self).stringValue
    }
}
