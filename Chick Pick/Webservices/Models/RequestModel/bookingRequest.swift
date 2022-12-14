//
//  bookingRequest.swift
//  Peppea
//
//  Created by eww090 on 19/07/19.
//  Copyright © 2019 Mayur iMac. All rights reserved.
//

import Foundation

class bookingRequest : RequestModel
{
    
    /*

    booking_type: book_now or book_later
    customer_id:1
    vehicle_type_id:1
    pickup_location:Excellent WebWorld, Science City Road, Sola, Ahmedabad, Gujarat
    dropoff_location:Iscon Mega Mall, Sarkhej - Gandhinagar Highway, Ahmedabad, Gujarat
    pickup_lat:23.0726414
    pickup_lng:72.51423
    dropoff_lat:23.0305179
    dropoff_lng:72.5053514
    no_of_passenger:2
    payment_type:cash OR card OR wallet OR bulk_miles (if payment_type = 'card' then 'card_id' parameter (complusary))
    if booking_type = 'book_later' then  'pickup_date_time'(yyyy-mm-dd HH:mm:ss)(24 hours) parameter (complusary)
    promocode(if applicable)
    rent_type  :  fix_rate  OR standard_rate OR bulk_miles (IF rent_type == 'fix_rate' then 'fix_rate_id' is compulsory )
  */
    
    var booking_type : String = ""
    var customer_id : String = ""
    var vehicle_type_id : String = ""
    var pickup_location : String = ""
    var dropoff_location : String = ""
    var pickup_lat : String = ""
    var pickup_lng : String = ""
    var dropoff_lat : String = ""
    var dropoff_lng : String = ""
    var no_of_passenger : String = ""
    var payment_type : String = ""
    var promocode : String = ""
    var estimated_fare : String = ""
    var pickup_date_time : String = ""
    var rent_type : String = ""
    var card_id : String = ""
    var fix_rate_id : String = ""
    var distance : String = ""
    
}
