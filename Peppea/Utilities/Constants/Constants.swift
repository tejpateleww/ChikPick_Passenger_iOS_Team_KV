//
//  Constants.swift
//  Peppea
//
//  Created by Mayur iMac on 28/06/19.
//  Copyright © 2019 Mayur iMac. All rights reserved.
//

import Foundation
import UIKit


//Orange : e38428
//Grey : 9a9a9a
//Balck : 2e2d2e

let peppeaAppNameString = "Peppea"
let peppeaRentalAppNameString = "PeppeaRental"

let googlApiKey = "AIzaSyDcug87uBhFLMo1KlqyaO10shE-sNTBCmw" // built from ODDs
let baseURLDirections = "https://maps.googleapis.com/maps/api/directions/json?"
let geocodeAddress = "https://maps.googleapis.com/maps/api/geocode/json?latlng="

var imagBaseURL = "https://www.peppea.com/panel/"

let kAPPVesion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String



let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height

let Currency = "KES"
let MeasurementSign = "mi"
let helpLine = "1234567890"

let ThemeColor : UIColor =  UIColor.init(hex: "2e2d2e")

let cellBorderColor: UIColor = UIColor.init(red: 212.0/255.0, green: 212.0/255.0, blue: 212.0/255.0, alpha: 1.0)

let iconCar = "iconCar"
let iconMarker = "iconMarker"
let zoomLevel: Float = 16.0


// Notifications Observers
struct NotificationsKey {
    static let UpdateChatNotification = Notification.Name("UpdateChat")
}
