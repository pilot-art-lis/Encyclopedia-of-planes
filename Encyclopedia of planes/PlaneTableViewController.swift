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
        
        guard let plane1 = Plane(model: "Sukhoi Superjet 100", photo: image1, country: "Russia", weight: 49450, speed: 950, passengers: 108, distance: 4578) else { fatalError("Unable to instatiate plane1") }
        
        guard let plane2 = Plane(model: "Boeing 777-300", photo: image2, country: "USA", weight: 299370, speed: 945, passengers: 451, distance: 11135) else { fatalError("Unable to instatiate plane2") }
        
        guard let plane3 = Plane(model: "Boeing 737-900", photo: image3, country: "USA", weight: 79000, speed: 852, passengers: 189, distance: 5800) else { fatalError("Unable to instatiate plane3") }
        
        planes += [plane1, plane2, plane3]

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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegue(withIdentifier: "showPlaneDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else { return }
    }
    
    
}
