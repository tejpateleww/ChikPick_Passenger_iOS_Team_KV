//
//  SplashViewController.swift
//  Peppea
//
//  Created by Mayur iMac on 28/06/19.
//  Copyright © 2019 Mayur iMac. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    @IBOutlet weak var animateView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let storyboardName = self.storyboard?.value(forKey: "name") as? String ?? ""
        
        if storyboardName == "LoginRegister" {

            self.webserviceforAPPInit()
            
        }else{
            //Rental_LoginRegister - storyboard name
            //Peppea Rental
            self.redirectToPeppeaRentalFlow()
        }
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func webserviceforAPPInit()
    {
        
        var loginModelDetails = LoginModel()
        do
        {
            if UserDefaults.standard.object(forKey: "userProfile") != nil {
                
                loginModelDetails = try UserDefaults.standard.get(objectType: LoginModel.self, forKey: "userProfile")! // set(object: loginModelDetails, forKey: "userProfile") //(loginModelDetails, forKey: "userProfile")
                UserDefaults.standard.set(loginModelDetails.loginData.xApiKey, forKey: "X_API_KEY")
                SingletonClass.sharedInstance.loginData = loginModelDetails.loginData

                if let walletBalance = loginModelDetails.loginData.walletBalance
                {
                    SingletonClass.sharedInstance.BulkMilesBalance = walletBalance
                }

                if let bulkMileBalance = loginModelDetails.loginData.BulkMilesBalance
                {
                    SingletonClass.sharedInstance.BulkMilesBalance = bulkMileBalance
                }
            }
        }
        catch
        {
            UtilityClass.hideHUD()
            AlertMessage.showMessageForError("error")
        }
        
        var strParam = String()
        
        strParam = NetworkEnvironment.baseURL + ApiKey.Init.rawValue + "ios_customer/\(kAPPVesion)"
        if SingletonClass.sharedInstance.loginData.id != nil || SingletonClass.sharedInstance.loginData.id != "" {
            
            strParam = NetworkEnvironment.baseURL + ApiKey.Init.rawValue + "ios_customer/\(kAppBuildNumber)/\(SingletonClass.sharedInstance.loginData.id ?? "")"
        }
        
        UserWebserviceSubclass.initApi(strURL: strParam) { (json, status) in
            if status
            {
                if json["update"].bool != nil {
                    
                    let alert = UIAlertController(title: nil, message: json["message"].stringValue, preferredStyle: .alert)
                    let UPDATE = UIAlertAction(title: "UPDATE", style: .default, handler: { ACTION in
                        
                        if let url = URL(string: AppName.kAPPUrl),
                            UIApplication.shared.canOpenURL(url) {
                            if #available(iOS 10, *) {
                                UIApplication.shared.open(url, options: [:], completionHandler:nil)
                            } else {
                                UIApplication.shared.openURL(url)
                            }
                        }
                        
                        //                        UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/us/app/pick-n-go/id1320783092?mt=8")! as URL)
                    })
                    let Cancel = UIAlertAction(title: "Cancel", style: .default, handler: { ACTION in
                        
                        let isLogin = UserDefaults.standard.bool(forKey: "isUserLogin")
                        if isLogin
                        {
                            (UIApplication.shared.delegate as! AppDelegate).GoToHome()
                        } else {
                            (UIApplication.shared.delegate as! AppDelegate).GoToLogin()
                        }
                    })
                    alert.addAction(UPDATE)
                    alert.addAction(Cancel)
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    
                    var cancelReason = [CancelReason]()
                    let cancelReasonArray = json["cancel_reason"].arrayValue
                    for cancelReasonJson in cancelReasonArray{
                        let value = CancelReason(fromJson: cancelReasonJson)
                        cancelReason.append(value)
                    }
                    
                    SingletonClass.sharedInstance.cancelReason = cancelReason
                    
                    let VehicleListModelDetails = VehicleListModel.init(fromJson: json)
                    do
                    {
                        try UserDefaults.standard.set(object: VehicleListModelDetails, forKey: "carList")//(loginModelDetails, forKey: "userProfile")
                    }
                    catch
                    {
                        UtilityClass.hideHUD()
                        AlertMessage.showMessageForError("error")
                    }
                    
                    let isLogin = UserDefaults.standard.bool(forKey: "isUserLogin")
                    
                    if isLogin == true || (SingletonClass.sharedInstance.loginData.id != "" && SingletonClass.sharedInstance.loginData.id != nil) {
                        
                        if json.dictionary?["booking_info"] != nil {
                            let info = BookingInfo(fromJson: json.dictionary?["booking_info"])
                            SingletonClass.sharedInstance.bookingInfo = info
                            //                        (UIApplication.shared.delegate as! AppDelegate).GoToHome(bookingInfo: info) // Commented by Rahul for Choose services Option i.e. Hire a Car or Book a taxi option
                        } else {
                            //                        (UIApplication.shared.delegate as! AppDelegate).GoToHome() // Commented by Rahul for Choose services Option i.e. Hire a Car or Book a taxi option
                        }
                        
                        self.redirectToChooseServicesVC()
                    }
                    else {
                        (UIApplication.shared.delegate as! AppDelegate).GoToLogin()
                    }
                }
            }
            else
            {
              if let update = json["update"].bool {
                    
                    if (update) {
                        
                        let alert = UIAlertController(title: "",
                                                      message: json["message"].stringValue,
                                                      preferredStyle: UIAlertController.Style.alert)
                        
                        let okAction = UIAlertAction(title: "Update", style: .default, handler: { (action) in
                            if let url = URL(string: AppName.kAPPUrl) {
                                UIApplication.shared.open(url)
                                 UtilityClass.topMostController()?.present(alert, animated: true, completion: nil)
                            }
                        })
                        
                        alert.addAction(okAction)
                        UtilityClass.topMostController()?.present(alert, animated: true, completion: nil)
                    }
                    else {
                        let alert = UIAlertController(title: "",
                                                      message: json["message"].stringValue,
                                                      preferredStyle: UIAlertController.Style.alert)
                        UtilityClass.topMostController()?.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }

    func redirectToChooseServicesVC()
    {
        if let dictValue = UserDefaults.standard.object(forKey: "didSelectTaxiStatus") as? [String:Bool]
        {
            if(dictValue["isDefaultScreen"]!)
            {
                if(dictValue["didSelectTaxi"]!)
                {
                    (UIApplication.shared.delegate as! AppDelegate).GoToHome()
                    //redirect to Main storyboard home
                }
                else
                {
                    //redirect to hire a car in future
                    (UIApplication.shared.delegate as! AppDelegate).GoToHome()
                }
            }
            else
            {
//                (UIApplication.shared.delegate as! AppDelegate).GoToChooseServices()
                (UIApplication.shared.delegate as! AppDelegate).GoToHome()
            }
        }
        else if(UserDefaults.standard.bool(forKey: "isUserLogin") == false)
        {
            (UIApplication.shared.delegate as! AppDelegate).GoToLogin()
        }
        else
        {
//            (UIApplication.shared.delegate as! AppDelegate).GoToChooseServices()
            (UIApplication.shared.delegate as! AppDelegate).GoToHome()
        }
    }
}


extension SplashViewController {
    
    
    func redirectToPeppeaRentalFlow() {
        
//        if(UserDefaults.standard.bool(forKey: "isUserLogin") == false)
//        {
            (UIApplication.shared.delegate as! AppDelegate).goToPeppeaRentalLogin()
//        }
//        else
//        {
//            (UIApplication.shared.delegate as! AppDelegate).GoToChooseServices()
//
//        }
    }
}
