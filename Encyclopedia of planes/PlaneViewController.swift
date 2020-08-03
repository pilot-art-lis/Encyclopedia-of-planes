//
//  PlaneViewController.swift
//  Encyclopedia of planes
//
//  Created by Best Mac on 22.03.2020.
//  Copyright © 2020 Artem Lysevych. All rights reserved.
//

import UIKit

class PlaneViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var planeImage: UIImageView!
    @IBOutlet weak var planeModel: UILabel!
    @IBOutlet weak var getCountry: UILabel!
    @IBOutlet weak var getWeight: UILabel!
    @IBOutlet weak var getSpeed: UILabel!
    @IBOutlet weak var getPassengers: UILabel!
    @IBOutlet weak var getDistance: UILabel!
    
    
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
    
    var photo: UIImage? = nil
    var model: String = ""
    var countryOfDesigning: String = ""
    var weightOfPlane: Double = 0.0
    var speedOfPlane: Double = 0.0
    var numberOfPassengers: Int? = nil
    var distanceOfFlight: Int? = nil
    
    //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planeImage.image = photo
        planeModel.text = model
        getCountry.text = countryOfDesigning
        getWeight.text = String(weightOfPlane)
        getSpeed.text = String(speedOfPlane)
        getPassengers.text = String(numberOfPassengers ?? 0)
        getDistance.text = String(distanceOfFlight ?? 0)
    }
}
