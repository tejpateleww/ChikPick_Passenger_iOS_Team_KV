//
//  VehicleDetailViewController.swift
//  RentInFlash-Customer
//
//  Created by EWW iMac2 on 14/11/18.
//  Copyright © 2018 EWW iMac2. All rights reserved.
//

import UIKit

class VehicleDetailViewController: BaseViewController
{
    
    @IBOutlet var tblView: UITableView!
    
    ///Top View
    
    @IBOutlet weak var topBgImageView: UIImageView!
    @IBOutlet var imgVehicle: UIImageView!

    @IBOutlet var lblPrice: UILabel!
    @IBOutlet weak var lblValidityTime: UILabel!

    @IBOutlet weak var lblCarCompanyName: UILabel!
    @IBOutlet weak var lblCarName: UILabel!

    @IBOutlet var viewInfoVehicle: UIView!
    
    @IBOutlet var lblPriceDistance: UILabel!
    
    @IBOutlet var btnCheckAvailability: UIButton!
    
    @IBOutlet weak var btnApply: UIButton!
   
    @IBOutlet weak var txtPromoCode: UITextField!
    
    @IBOutlet weak var MainViewTop: NSLayoutConstraint!
    
//    var parallaxEffect: RKParallaxEffect!
    var VehicleDetail:[String:AnyObject] = [:]
    var vehicleFrom_To:(String,String) = ("","")
    var VehicalCat_IDName:(String,String) = ("","")
    var selectedAddress:String = ""
    var selectedAddLat = Double()
    var selectedAddLong = Double()
    var selectedTripType:String = ""
    var startDate:String = ""
    var endDate:String = ""
    
    
    var startDisplayDate:String = ""
    var endDisplayDate:String = ""
    var Fare:String = ""
    var SubTotal:String = ""
    var Total:String = ""
    var RentType:String = ""
    var Average:String = ""
    var Rate:String = ""
    var SpecialFare:String = ""
    var DeliveryFare:String = ""
    var Tax:String = ""
    
    var AppliedPromocode:String = ""
    var EnteredPromocode:String = ""
    var Discount:String = ""
    var PromoCodeId:String = ""
    
    var FlatRate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startDate = vehicleFrom_To.0
        self.endDate = vehicleFrom_To.1
//        self.WebServiceForGetFare()
        let navigationbarHeight = self.navigationController?.navigationBar.frame.height
        let StatusBarHeight = UIApplication.shared.statusBarFrame.height
        
        self.MainViewTop.constant = 0 - (navigationbarHeight! + StatusBarHeight)
        
        // Do any additional setup after loading the view.
        
        ///Hiding the Availability View, initially
        

       
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        setNavBarWithBack(Title: "Ford Figo", IsNeedRightButton: false)
            //,titleFontColor: UIColor.white)
        
        //Transperant
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        //        Utilities.setNavigationBarInViewController(controller: self, naviColor: ThemeNaviLightBlueColor, naviTitle: "", leftImage: kBack_Icon, rightImage: "", isTranslucent: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        parallaxEffect = RKParallaxEffect(tableView: tblView)
        //        parallaxEffect.isParallaxEffectEnabled = true
        //        parallaxEffect.isFullScreenTapGestureRecognizerEnabled = false
        //        parallaxEffect.isFullScreenPanGestureRecognizerEnabled = false
    }
    
    
    //MARK : - TableView Method -
    
    
    
    
    //MARK: Button Clicks
    
    @IBAction func proceedToPaymentButtonClicked(_ sender: Any) {
        

        let PaymentPage = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        PaymentPage.Delegate = self
        PaymentPage.isFlatRateSelected  = (self.FlatRate != "")
        PaymentPage.OpenedForPayment = true
        let NavController = UINavigationController(rootViewController: PaymentPage)
        self.navigationController?.present(NavController, animated: true, completion: nil)

    }

    @IBAction func closeCarsAvailabelButtonClicked(_ sender: Any) {
        
        ///Close cars available

        
    }
    @IBAction func btnBookConfirmClicked(_ sender: Any) {
//
//        let  PaymentviewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectPaymentPopUpViewController") as! SelectPaymentPopUpViewController
//        PaymentviewController.PaymentDelegate = self
//        self.present(PaymentviewController, animated: true, completion: nil)
        
    }
}

