//
//  SocketManager.swift
//  CabRideDriver
//
//  Created by EWW-iMac Old on 29/04/19.
//  Copyright © 2019 baps. All rights reserved.
//

import Foundation
import SocketIO
import SwiftyJSON
typealias CompletionBlock = ((JSON) -> ())?
class SocketIOManager: NSObject {
    static let shared = SocketIOManager()

    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:8080")!, config: [.log(true), .compress])
    lazy var socket = manager.defaultSocket
    
    override private init() {
        super.init()
        
        socket.on(clientEvent: .disconnect) { (data, ack) in
            print ("socket is disconnected please reconnect")
        }
        
        socket.on(clientEvent: .reconnect) { (data, ack) in
            print ("socket is reconnected please reconnect")
        }
        
        socket.on(clientEvent: .connect) {data, ack in
            print ("socket connected")
        }
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
   
    
    func socketCall(for key: String, completion: CompletionBlock = nil)
    {
        SocketIOManager.shared.socket.on(key, callback: { (data, ack) in
            let result = self.dataSerializationToJson(data: data)
            guard result.status else { return }
            if completion != nil { completion!(result.json) }
        })
    }
   
    func socketEmit(for key: String, with parameter: [String:Any]){
        socket.emit(key, with: [parameter])
        print ("Parameter Emitted for key - \(key) :: \(parameter)")
    }
    
    
    
    func dataSerializationToJson(data: [Any],_ description : String = "") -> (status: Bool, json: JSON){
        let json = JSON(data)
        print (description, ": \(json)")

        return (true, json)
    }
    
}
