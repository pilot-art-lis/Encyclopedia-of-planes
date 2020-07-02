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
    //let planeInfo = PlaneTableViewController()
    //MARK: Navigation
    
    //This method lets you configure a view controller before it's presented.
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: PlaneTableViewController.self)
//        //It’s a good habit to always call super.prepare(for:sender:) whenever you override prepare(for:sender:)
//
//        var photo: UIImage?
//        var model: String
//        var countryOfDesigning: String
//        var weightOfPlane: Double
//        var speedOfPlane: Double
//        var numberOfPassengers: Int?
//        var distanceOfFlight: Int?
//
//        photo = plane?.photo
//        model = (plane?.model)!
//        countryOfDesigning = (plane?.country)!
//        weightOfPlane = plane?.weight ?? 0.0
//        speedOfPlane = plane?.speed ?? 0.0
//        numberOfPassengers = plane?.numberOfPassengers ?? 0
//        distanceOfFlight = plane?.distance ?? 0
//
//        plane = Plane(model: model, photo: photo, country: countryOfDesigning, weight: weightOfPlane, speed: speedOfPlane, passengers: numberOfPassengers!, distance: distanceOfFlight!)
//    }
    
    //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        planeImage.image = photo
        planeModel.text = model
        country.text = countryOfDesigning
        weight.text = String(weightOfPlane)
        speed.text = String(speedOfPlane)
        passengers.text = String(numberOfPassengers ?? 0)
        distance.text = String(distanceOfFlight ?? 0)
    }
}
