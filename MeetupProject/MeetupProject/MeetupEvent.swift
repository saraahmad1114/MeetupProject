//
//  MeetupEvent.swift
//  MeetupProject
//
//  Created by Flatiron School on 1/28/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class MeetupEvent{
    
    var eventName: String?
    var meetupGroupName: String?
    var eventDateAndTime: Double?
    var rsvpdYes: Int?

    
    //Designated initializer 
    init(eventName: String, meetupGroupName: String, eventDateAndTime: Double, rsvpdYes: Int){
        self.eventName = eventName
        self.meetupGroupName = meetupGroupName
        self.eventDateAndTime = eventDateAndTime
        self.rsvpdYes = rsvpdYes
    }

}
