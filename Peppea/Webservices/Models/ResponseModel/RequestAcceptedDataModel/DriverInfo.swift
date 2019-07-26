//
//  DriverInfo.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 24, 2019

import Foundation
import SwiftyJSON


class DriverInfo : NSObject, NSCoding{

    var accountHolderName : String!
    var accountNumber : String!
    var address : String!
    var bankBranch : String!
    var bankName : String!
    var busy : Int!
    var carType : String!
    var city : String!
    var companyId : Int!
    var country : String!
    var createdAt : String!
    var deviceToken : String!
    var deviceType : String!
    var dob : String!
    var driverRole : String!
    var duty : Int!
    var email : String!
    var firstName : String!
    var gender : String!
    var id : Int!
    var inviteCode : String!
    var lastName : String!
    var lat : String!
    var lng : String!
    var mobileNo : String!
    var otherCompanyName : String!
    var ownerEmail : String!
    var ownerMobileNo : String!
    var ownerName : String!
    var password : String!
    var paymentMethod : String!
    var profileImage : String!
    var qrCode : String!
    var referralCode : String!
    var rememberToken : String!
    var state : String!
    var status : Int!
    var trash : Int!
    var vehicleType : String!
    var verify : Int!
    var walletBalance : String!
    var workWithOtherCompany : Int!

    override init() {
        
    }
    
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        accountHolderName = json["account_holder_name"].stringValue
        accountNumber = json["account_number"].stringValue
        address = json["address"].stringValue
        bankBranch = json["bank_branch"].stringValue
        bankName = json["bank_name"].stringValue
        busy = json["busy"].intValue
        carType = json["car_type"].stringValue
        city = json["city"].stringValue
        companyId = json["company_id"].intValue
        country = json["country"].stringValue
        createdAt = json["created_at"].stringValue
        deviceToken = json["device_token"].stringValue
        deviceType = json["device_type"].stringValue
        dob = json["dob"].stringValue
        driverRole = json["driver_role"].stringValue
        duty = json["duty"].intValue
        email = json["email"].stringValue
        firstName = json["first_name"].stringValue
        gender = json["gender"].stringValue
        id = json["id"].intValue
        inviteCode = json["invite_code"].stringValue
        lastName = json["last_name"].stringValue
        lat = json["lat"].stringValue
        lng = json["lng"].stringValue
        mobileNo = json["mobile_no"].stringValue
        otherCompanyName = json["other_company_name"].stringValue
        ownerEmail = json["owner_email"].stringValue
        ownerMobileNo = json["owner_mobile_no"].stringValue
        ownerName = json["owner_name"].stringValue
        password = json["password"].stringValue
        paymentMethod = json["payment_method"].stringValue
        profileImage = json["profile_image"].stringValue
        qrCode = json["qr_code"].stringValue
        referralCode = json["referral_code"].stringValue
        rememberToken = json["remember_token"].stringValue
        state = json["state"].stringValue
        status = json["status"].intValue
        trash = json["trash"].intValue
        vehicleType = json["vehicle_type"].stringValue
        verify = json["verify"].intValue
        walletBalance = json["wallet_balance"].stringValue
        workWithOtherCompany = json["work_with_other_company"].intValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if accountHolderName != nil{
        	dictionary["account_holder_name"] = accountHolderName
        }
        if accountNumber != nil{
        	dictionary["account_number"] = accountNumber
        }
        if address != nil{
        	dictionary["address"] = address
        }
        if bankBranch != nil{
        	dictionary["bank_branch"] = bankBranch
        }
        if bankName != nil{
        	dictionary["bank_name"] = bankName
        }
        if busy != nil{
        	dictionary["busy"] = busy
        }
        if carType != nil{
        	dictionary["car_type"] = carType
        }
        if city != nil{
        	dictionary["city"] = city
        }
        if companyId != nil{
        	dictionary["company_id"] = companyId
        }
        if country != nil{
        	dictionary["country"] = country
        }
        if createdAt != nil{
        	dictionary["created_at"] = createdAt
        }
        if deviceToken != nil{
        	dictionary["device_token"] = deviceToken
        }
        if deviceType != nil{
        	dictionary["device_type"] = deviceType
        }
        if dob != nil{
        	dictionary["dob"] = dob
        }
        if driverRole != nil{
        	dictionary["driver_role"] = driverRole
        }
        if duty != nil{
        	dictionary["duty"] = duty
        }
        if email != nil{
        	dictionary["email"] = email
        }
        if firstName != nil{
        	dictionary["first_name"] = firstName
        }
        if gender != nil{
        	dictionary["gender"] = gender
        }
        if id != nil{
        	dictionary["id"] = id
        }
        if inviteCode != nil{
        	dictionary["invite_code"] = inviteCode
        }
        if lastName != nil{
        	dictionary["last_name"] = lastName
        }
        if lat != nil{
        	dictionary["lat"] = lat
        }
        if lng != nil{
        	dictionary["lng"] = lng
        }
        if mobileNo != nil{
        	dictionary["mobile_no"] = mobileNo
        }
        if otherCompanyName != nil{
        	dictionary["other_company_name"] = otherCompanyName
        }
        if ownerEmail != nil{
        	dictionary["owner_email"] = ownerEmail
        }
        if ownerMobileNo != nil{
        	dictionary["owner_mobile_no"] = ownerMobileNo
        }
        if ownerName != nil{
        	dictionary["owner_name"] = ownerName
        }
        if password != nil{
        	dictionary["password"] = password
        }
        if paymentMethod != nil{
        	dictionary["payment_method"] = paymentMethod
        }
        if profileImage != nil{
        	dictionary["profile_image"] = profileImage
        }
        if qrCode != nil{
        	dictionary["qr_code"] = qrCode
        }
        if referralCode != nil{
        	dictionary["referral_code"] = referralCode
        }
        if rememberToken != nil{
        	dictionary["remember_token"] = rememberToken
        }
        if state != nil{
        	dictionary["state"] = state
        }
        if status != nil{
        	dictionary["status"] = status
        }
        if trash != nil{
        	dictionary["trash"] = trash
        }
        if vehicleType != nil{
        	dictionary["vehicle_type"] = vehicleType
        }
        if verify != nil{
        	dictionary["verify"] = verify
        }
        if walletBalance != nil{
        	dictionary["wallet_balance"] = walletBalance
        }
        if workWithOtherCompany != nil{
        	dictionary["work_with_other_company"] = workWithOtherCompany
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
		accountHolderName = aDecoder.decodeObject(forKey: "account_holder_name") as? String
		accountNumber = aDecoder.decodeObject(forKey: "account_number") as? String
		address = aDecoder.decodeObject(forKey: "address") as? String
		bankBranch = aDecoder.decodeObject(forKey: "bank_branch") as? String
		bankName = aDecoder.decodeObject(forKey: "bank_name") as? String
		busy = aDecoder.decodeObject(forKey: "busy") as? Int
		carType = aDecoder.decodeObject(forKey: "car_type") as? String
		city = aDecoder.decodeObject(forKey: "city") as? String
		companyId = aDecoder.decodeObject(forKey: "company_id") as? Int
		country = aDecoder.decodeObject(forKey: "country") as? String
		createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
		deviceToken = aDecoder.decodeObject(forKey: "device_token") as? String
		deviceType = aDecoder.decodeObject(forKey: "device_type") as? String
		dob = aDecoder.decodeObject(forKey: "dob") as? String
		driverRole = aDecoder.decodeObject(forKey: "driver_role") as? String
		duty = aDecoder.decodeObject(forKey: "duty") as? Int
		email = aDecoder.decodeObject(forKey: "email") as? String
		firstName = aDecoder.decodeObject(forKey: "first_name") as? String
		gender = aDecoder.decodeObject(forKey: "gender") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		inviteCode = aDecoder.decodeObject(forKey: "invite_code") as? String
		lastName = aDecoder.decodeObject(forKey: "last_name") as? String
		lat = aDecoder.decodeObject(forKey: "lat") as? String
		lng = aDecoder.decodeObject(forKey: "lng") as? String
		mobileNo = aDecoder.decodeObject(forKey: "mobile_no") as? String
		otherCompanyName = aDecoder.decodeObject(forKey: "other_company_name") as? String
		ownerEmail = aDecoder.decodeObject(forKey: "owner_email") as? String
		ownerMobileNo = aDecoder.decodeObject(forKey: "owner_mobile_no") as? String
		ownerName = aDecoder.decodeObject(forKey: "owner_name") as? String
		password = aDecoder.decodeObject(forKey: "password") as? String
		paymentMethod = aDecoder.decodeObject(forKey: "payment_method") as? String
		profileImage = aDecoder.decodeObject(forKey: "profile_image") as? String
		qrCode = aDecoder.decodeObject(forKey: "qr_code") as? String
		referralCode = aDecoder.decodeObject(forKey: "referral_code") as? String
		rememberToken = aDecoder.decodeObject(forKey: "remember_token") as? String
		state = aDecoder.decodeObject(forKey: "state") as? String
		status = aDecoder.decodeObject(forKey: "status") as? Int
		trash = aDecoder.decodeObject(forKey: "trash") as? Int
		vehicleType = aDecoder.decodeObject(forKey: "vehicle_type") as? String
		verify = aDecoder.decodeObject(forKey: "verify") as? Int
		walletBalance = aDecoder.decodeObject(forKey: "wallet_balance") as? String
		workWithOtherCompany = aDecoder.decodeObject(forKey: "work_with_other_company") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if accountHolderName != nil{
			aCoder.encode(accountHolderName, forKey: "account_holder_name")
		}
		if accountNumber != nil{
			aCoder.encode(accountNumber, forKey: "account_number")
		}
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if bankBranch != nil{
			aCoder.encode(bankBranch, forKey: "bank_branch")
		}
		if bankName != nil{
			aCoder.encode(bankName, forKey: "bank_name")
		}
		if busy != nil{
			aCoder.encode(busy, forKey: "busy")
		}
		if carType != nil{
			aCoder.encode(carType, forKey: "car_type")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if companyId != nil{
			aCoder.encode(companyId, forKey: "company_id")
		}
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if deviceToken != nil{
			aCoder.encode(deviceToken, forKey: "device_token")
		}
		if deviceType != nil{
			aCoder.encode(deviceType, forKey: "device_type")
		}
		if dob != nil{
			aCoder.encode(dob, forKey: "dob")
		}
		if driverRole != nil{
			aCoder.encode(driverRole, forKey: "driver_role")
		}
		if duty != nil{
			aCoder.encode(duty, forKey: "duty")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if firstName != nil{
			aCoder.encode(firstName, forKey: "first_name")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if inviteCode != nil{
			aCoder.encode(inviteCode, forKey: "invite_code")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "last_name")
		}
		if lat != nil{
			aCoder.encode(lat, forKey: "lat")
		}
		if lng != nil{
			aCoder.encode(lng, forKey: "lng")
		}
		if mobileNo != nil{
			aCoder.encode(mobileNo, forKey: "mobile_no")
		}
		if otherCompanyName != nil{
			aCoder.encode(otherCompanyName, forKey: "other_company_name")
		}
		if ownerEmail != nil{
			aCoder.encode(ownerEmail, forKey: "owner_email")
		}
		if ownerMobileNo != nil{
			aCoder.encode(ownerMobileNo, forKey: "owner_mobile_no")
		}
		if ownerName != nil{
			aCoder.encode(ownerName, forKey: "owner_name")
		}
		if password != nil{
			aCoder.encode(password, forKey: "password")
		}
		if paymentMethod != nil{
			aCoder.encode(paymentMethod, forKey: "payment_method")
		}
		if profileImage != nil{
			aCoder.encode(profileImage, forKey: "profile_image")
		}
		if qrCode != nil{
			aCoder.encode(qrCode, forKey: "qr_code")
		}
		if referralCode != nil{
			aCoder.encode(referralCode, forKey: "referral_code")
		}
		if rememberToken != nil{
			aCoder.encode(rememberToken, forKey: "remember_token")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if trash != nil{
			aCoder.encode(trash, forKey: "trash")
		}
		if vehicleType != nil{
			aCoder.encode(vehicleType, forKey: "vehicle_type")
		}
		if verify != nil{
			aCoder.encode(verify, forKey: "verify")
		}
		if walletBalance != nil{
			aCoder.encode(walletBalance, forKey: "wallet_balance")
		}
		if workWithOtherCompany != nil{
			aCoder.encode(workWithOtherCompany, forKey: "work_with_other_company")
		}

	}

}