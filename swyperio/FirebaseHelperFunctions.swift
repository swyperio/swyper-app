//
//  FirebaseHelperFunctions.swift
//  swyperio
//
//  Created by Paul Pelayo on 12/10/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth
import FirebaseDatabase

class FirebaseHelperFunctions: NSObject {
    
    
    
    /*  Uploads event to firebase db based on randomly generated unique event id from the event class
        if values are updated in an event and this function is called, the db will update the
        event information and will not create a new event
     */
    static func uploadEvent(_ event: Event){
        print("begin uploading event")
        let databaseRef = FIRDatabase.database().reference()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyy hh:mm:ss +zzzz"
        databaseRef.child("events").child(event.uniqueID).setValue(["user_id": event.userID,
                                                                         "name": event.name,
                                                                         "latitude": event.coordinate.latitude,
                                                                         "longitude": event.coordinate.longitude,
                                                                         "start_time": dateFormatter.string(from: event.startTime as Date),
                                                                         "end_time": dateFormatter.string(from: event.endTime as Date),
                                                                         "max_reservations": event.maxReservations,
                                                                         "information": event.information,])
        
        print("end uploading event")
    }
    
    /*static func deleteEvent(_ event: Event){
        print("begin uploading event")
        let databaseRef = FIRDatabase.database().reference()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyy hh:mm:ss +zzzz"
        databaseRef.removeValue(completionBlock: databaseRef.child("events").child(event.uniqueID))
    }*/
    
    
    /*  Returns a list of all events from the firebase db
        NOTE: STILL NEEDS WORK - callback function 'observe' returns after the actual function so allEvents
        is never populated when returned
     */
    static func retrieveAllEvents() -> Array<Event>{
        print("begin retrieving events")

        var allEvents = [Event]()
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("events").observe(FIRDataEventType.value, with: { (snapshot) in
            let allEventsDict = snapshot.value as? NSDictionary
            //let singleEvent = allEventsDict?["741BC0BC-655F-4DE4-B756-2BF14171FC7D"] as? NSDictionary
            //print("FUCKING LOOK OVER HERE")
            //print(allEventsDict?["BD6229EC-F6FC-4C8E-8E0F-89FF1209B6CE"]!)
            //print(singleEvent?["name"])
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE, dd MMM yyy hh:mm:ss +zzzz"
            for(_, eventInfo) in allEventsDict!{
                let tempDict = eventInfo as? NSDictionary
                let eventToAdd = Event(name: tempDict?["name"] as! String ,
                                       coordinate: CLLocationCoordinate2D(
                                        latitude: tempDict?["latitude"] as! CLLocationDegrees,
                                        longitude: tempDict?["longitude"] as! CLLocationDegrees),
                                       startTime: (dateFormatter.date(from: tempDict?["start_time"] as! String) as? NSDate)!,
                                       endTime: (dateFormatter.date(from: tempDict?["end_time"] as! String) as? NSDate!)!,
                                       maxReservations: tempDict?["max_reservations"] as! Int,
                                       information: tempDict?["information"] as! String,
                                       userID: tempDict?["user_id"] as! String)
                allEvents.append(eventToAdd)

                
            }
            print("before")
            print(allEvents)

            

            
            
        })
        print("after")

        print(allEvents)
        return allEvents
        

        
        
        
    }
    
    

}
