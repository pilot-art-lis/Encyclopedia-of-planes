//
//  PlaneViewController.swift
//  Encyclopedia of planes
//
//  Created by Best Mac on 22.03.2020.
//  Copyright © 2020 Artem Lysevych. All rights reserved.
//

import UIKit
import os.log

class PlaneViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var planeImage: UIImageView!
    @IBOutlet weak var planeModel: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var passengers: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    /*
    This value is either passed by `PlaneTableViewController` in `prepare(for:sender:)`
    or constructed as part of adding a new plane.
    */
    var plane: Plane?
    
    //MARK: Navigation
    
    //This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        //It’s a good habit to always call super.prepare(for:sender:) whenever you override prepare(for:sender:)
        
        let photo = planeImage.image
        let model = planeModel.text ?? ""
        let countryOfDesigning = country.text ?? ""
        let weightOfPlane = (weight.text! as NSString).doubleValue
        let speedOfPlane = (speed.text! as NSString).doubleValue
        let numberOfPassengers = Int(passengers.text!)
        let distanceOfFlight = Int(distance.text!)
        
        plane = Plane(model: model, photo: photo, country: countryOfDesigning, weight: weightOfPlane, speed: speedOfPlane, passengers: numberOfPassengers!, distance: distanceOfFlight!)
    }
    
    //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

