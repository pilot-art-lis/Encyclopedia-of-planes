//
//  Plane.swift
//  Encyclopedia of planes
//
//  Created by Best Mac on 23.03.2020.
//  Copyright © 2020 Artem Lysevych. All rights reserved.
//

import UIKit

class Plane {
    
    //MARK: Properties
    
    var model: String
    var photo: UIImage?
    var country: String
    var weight: Double
    var speed: Double
    var numberOfPassengers: Int
    var distance: Int
    
    init?(model: String, photo: UIImage?, country: String, weight: Double, speed: Double, passengers: Int, distance: Int) {
        
        //Initialization should fail if any of properties is incorrect.
        if model.isEmpty || country.isEmpty || weight < 0 || speed < 0 || passengers < 0 || distance < 0 {
            return nil
        }
        
        //Initialize stored properties.
        self.model = model
        self.photo = photo
        self.country = country
        self.weight = weight
        self.speed = speed
        self.numberOfPassengers = passengers
        self.distance = distance
    }
}
