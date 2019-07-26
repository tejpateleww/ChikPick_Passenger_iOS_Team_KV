//
//  RegisterViewController.swift
//  TickTok User
//
//  Created by Excellent Webworld on 25/10/17.
//  Copyright © 2017 Excellent Webworld. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class RegisterViewController: UIViewController, UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var txtPhoneNumber: ThemeTextFieldLoginRegister!
    @IBOutlet weak var txtEmail: ThemeTextFieldLoginRegister!
    @IBOutlet weak var txtPassword: ThemeTextFieldLoginRegister!
    @IBOutlet weak var txtConfirmPassword: ThemeTextFieldLoginRegister!
    @IBOutlet var txtContoryNum: ThemeTextFieldLoginRegister!
    var RegistrationGetOTPModel : RegistrationModel = RegistrationModel()
    
    var aryContoryNum = [[String:Any]]()
    let countoryz : Int = 0
    var imgflag = UIImageView()
    var countoryPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.txtEmail.text = SingletonClass.sharedInstance.strSocialEmail
        setUpCountryTextField()
        setUp()
        // Do any additional setup after loading the view.
    }


    func setUpCountryTextField()
    {
        aryContoryNum = [["countoryCode" : "+1","countoryName" : "USA","countoryID" : "US", "countoryimage" : "US_Flag"]] as [[String : AnyObject]]

        let data = aryContoryNum[0]
        if let CountryCode:String = data["countoryCode"] as? String, let CountryId:String = data["countoryID"] as? String {
            self.txtContoryNum.text = "\(CountryId) \(CountryCode)"
        }

        txtContoryNum.inputView = countoryPicker

        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        leftView.backgroundColor = UIColor.clear

        imgflag = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
        imgflag.image = UIImage(named:  data["countoryimage"] as? String ?? "")
        leftView.addSubview(imgflag)
        self.txtContoryNum.leftView = leftView
        self.txtContoryNum.leftViewMode = .always
    }

    func setUp()
    {
        countoryPicker.delegate = self
        countoryPicker.dataSource = self
        txtPhoneNumber.delegate = self
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.countoryPicker.reloadAllComponents()
    }


    //-------------------------------------------------------------
    // MARK: - TextField Delegate Method
    //-------------------------------------------------------------
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == txtPhoneNumber {
            let resultText: String? = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
            if textField == txtPhoneNumber && range.location == 0 {
                
                if string == "0" {
                    return false
                }

            }
            if resultText!.count >= 11 {
                return false
            }
            else {
                return true
            }
        }
        
        return true
    }
    func removeZeros(from anyString: String?) -> String? {
        if anyString?.hasPrefix("0") ?? false && (anyString?.count ?? 0) > 1 {
            return removeZeros(from: (anyString as NSString?)?.substring(from: 1))
        } else {
            return anyString
        }
    }
    
    @IBAction func textDidChange(_ sender: UITextField) {
        if !sender.text!.isEmpty {
            txtPhoneNumber.text = removeZeros(from: sender.text!)
        }
    }
    
    //-------------------------------------------------------------
    // MARK: - PickerView Methods
    //-------------------------------------------------------------
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return aryContoryNum.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        
        //        if pickerView == countoryPicker
        //        {
        //mainview
        let viewOfContryCode = UIView(frame: CGRect(x: 10, y: 5, width: countoryPicker.frame.size.width , height: 50))
        
        //image
        let imgOfCountry = UIImageView(frame: CGRect(x: 20 , y: 10 , width: 50, height: 30))
        
        //country Name
        let lblCountryName = UILabel(frame: CGRect(x: 80, y: 10, width: UIScreen.main.bounds.size.width - 160, height: 30))
        
        //labelNum
        let lblOfCountryNum = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width - 80, y: 10, width: 50, height: 30))
        //addsubview
        viewOfContryCode.addSubview(imgOfCountry)
        viewOfContryCode.addSubview(lblOfCountryNum)
        viewOfContryCode.addSubview(lblCountryName)
        let dictCountry = aryContoryNum[row]
        
        if let CountryCode:String = dictCountry["countoryCode"] as? String {
            lblOfCountryNum.text = CountryCode
        }
        if let CountryImg:String = dictCountry["countoryimage"] as? String {
            imgOfCountry.image = UIImage(named: CountryImg)
        }
        
        if let CountryName:String = dictCountry["countoryName"] as? String, let CountryId:String = dictCountry["countoryID"] as? String {
            lblCountryName.text = "\(CountryName) \(CountryId)"
        }

        
        return viewOfContryCode
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        let data = aryContoryNum[row]
        if let CountryCode:String = data["countoryCode"] as? String, let CountryId:String = data["countoryID"] as? String {
            self.txtContoryNum.text = "\(CountryId) \(CountryCode)"
        }
        //            self.txtContoryNum.text = data as? String
        imgflag.image = UIImage(named:  data["countoryimage"] as? String ?? "")
        //            lblFlageCode.text = data["countoryCode"] as? String ?? ""
    }
    
    // MARK: - Navigation
    
    
    @IBAction func btnNext(_ sender: Any) {
        let Validator = self.isvalidateAllFields()

        if Validator.0 == true
        {
            self.webserviceForGetOTP()
        }
        else
        {
            AlertMessage.showMessageForError(self.isvalidateAllFields().1)
        }
    }
    func webserviceForGetOTP()
    {

        RegistrationGetOTPModel.email = txtEmail.text ?? ""
        RegistrationGetOTPModel.mobile_no = txtPhoneNumber.text ?? ""
        RegistrationGetOTPModel.password = txtPassword.text ?? ""
        
        SingletonRegistration.sharedRegistration.Email = txtEmail.text ?? ""
        SingletonRegistration.sharedRegistration.MobileNo = txtPhoneNumber.text ?? ""
        SingletonRegistration.sharedRegistration.Password = txtPassword.text ?? ""
        var paramter = [String : AnyObject]()
        paramter["email"] = txtEmail!.text as AnyObject
        paramter["mobile_no"] = txtPhoneNumber!.text as AnyObject


        UtilityClass.showHUD(with: UIApplication.shared.keyWindow)
        
        WebService.shared.requestMethod(api: .otp, httpMethod: .post, parameters: paramter){ json,status in
            UtilityClass.hideHUD()
            if status
            {
                //                self.parameterArray.otp = json["otp"].stringValue
                AlertMessage.showMessageForError(json["message"].stringValue)
                SingletonClass.sharedInstance.RegisterOTP = json["otp"].stringValue
                let registrationContainerVC = self.navigationController?.viewControllers[1] as! RegisterContainerViewController
                registrationContainerVC.scrollObject.setContentOffset(CGPoint(x: self.view.frame.size.width, y: 0), animated: true)
                registrationContainerVC.selectPageControlIndex(Index: 1)
            }
            else
            {
                AlertMessage.showMessageForError(json["message"].stringValue)
            }
            //            completion(status)
        }
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //-------------------------------------------------------------
    // MARK: - validation Email Methods
    //-------------------------------------------------------------
    
    func isvalidateAllFields() -> (Bool,String)
    {
        var isValid:Bool = true
        var ValidatorMessage:String = ""
        
        if self.txtPhoneNumber.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            
            isValid = false
            ValidatorMessage = "Please enter mobile number"
            
        } else if self.txtEmail.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            
            isValid = false
            ValidatorMessage = "Please enter email."
            
        } else if self.isValidEmailAddress(emailID: (self.txtEmail.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!) == false {
            
            isValid = false
            ValidatorMessage = "Please enter valid email."
            
        }
        else if (self.txtPassword.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count)! < 8 {

            isValid = false
            ValidatorMessage = "Please enter minimum 8 characters in password."

        }
        else if self.txtPassword.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            
            isValid = false
            ValidatorMessage = "Please enter password."
            
        } else if self.txtConfirmPassword.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            
            isValid = false
            ValidatorMessage = "Please enter confirm password."
            
        } else if self.txtConfirmPassword.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) != self.txtPassword.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
            
            isValid = false
            ValidatorMessage = "Password and confirm password must be same."
            
        }
        

        return (isValid,ValidatorMessage)
    }
    
    
    func isValidEmailAddress(emailID: String) -> Bool
    {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z)-9.-]+\\.[A-Za-z]{2,3}"
        
        do{
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailID as NSString
            let results = regex.matches(in: emailID, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
        }
        catch _ as NSError
        {
            returnValue = false
        }
        
        return returnValue
    }



    /*
     func webserviceForGetOTPCode(email: String, mobile: String) {

     //        Param : MobileNo,Email


     var param = [String:AnyObject]()
     param["MobileNo"] = mobile as AnyObject
     param["Email"] = email as AnyObject

     //        var boolForOTP = Bool()

     webserviceForOTPRegister(param as AnyObject) { (result, status) in

     if (status) {
     print(result)

     let datas = (result as! [String:AnyObject])


     
     UtilityClass.setCustomAlert(title: "OTP Code", message: datas["message"] as! String) { (index, title) in
     if let otp = datas["otp"] as? String {
     SingletonClass.sharedInstance.otpCode = otp
     print("OTP is \(otp)")
     }
     else if let otp = datas["otp"] as? Int {
     SingletonClass.sharedInstance.otpCode = "\(otp)"
     print("OTP is \(otp)")
     }


     let registrationContainerVC = self.navigationController?.viewControllers[1] as! RegistrationContainerViewController
     registrationContainerVC.scrollObject.setContentOffset(CGPoint(x: self.view.frame.size.width, y: 0), animated: true)
     registrationContainerVC.selectPageControlIndex(Index: 1)
     }



     }
     else {
     print(result)

     if let res = result as? String {
     UtilityClass.setCustomAlert(title: "Error", message: res) { (index, title) in
     }
     }
     else if let resDict = result as? NSDictionary {
     UtilityClass.setCustomAlert(title: "Error", message: resDict.object(forKey: "message") as! String) { (index, title) in
     }
     }
     else if let resAry = result as? NSArray {
     UtilityClass.setCustomAlert(title: "Error", message: (resAry.object(at: 0) as! NSDictionary).object(forKey: "message") as! String) { (index, title) in
     }
     }

     }
     }
     }

     */
}
