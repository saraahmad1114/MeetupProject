//
//  MeetupDataStore.swift
//  MeetupProject
//
//  Created by Flatiron School on 1/28/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class MeetupDataStore{

    static let sharedInstance = MeetupDataStore()
    private init(){}
    //singleton for this class - will be needing it to reference everything from here! 
    //Note to self! 
    
    var meetupEvents: [MeetupEvent] = []
    
    func getMeetupEvents (zipCode: String, completion:@escaping ([MeetupEvent]) -> ()) {
    
        MeetupAPIClient.getMeetupEvents(zipCode: zipCode) { (arrayOfDictionaries) in
      
        //MeetupAPIClient.getMeetupEvents { (zipCode, arrayOfDictionaries) in
            for singleDictionaryEvent in arrayOfDictionaries{
            
                guard let unwrappedSingleDictionaryEvent = singleDictionaryEvent as? [String: Any]else {print("SingleDictionaryEvent did not unwrap"); return}
                
                guard
                    let nameOfSingleMeetupEvent = unwrappedSingleDictionaryEvent["name"] as? String,
                    //NAME OF THE MEETUP EVENT
                    
                    let timeOfSingleMeetupEvent = unwrappedSingleDictionaryEvent["time"] as? Double,
                    //TIME OF THE MEETUP EVENT
                    
                    let yesRSVPdOfSingleMeetupEvent = unwrappedSingleDictionaryEvent["yes_rsvp_count"] as? Int
                    else {print("ERROR OCCURRED IN THE DATASTORE"); return}
                    //HOW MANY PEOPLE RSVP'D TO THE EVENT
                
                guard let unwrappedGroupDictionary = unwrappedSingleDictionaryEvent["group"] as? [String: Any] else {print("GroupDictionary did not unwrap"); return}
                
                guard let unwrappedGroupNameOfSingleMeetupEvent = unwrappedGroupDictionary["name"] as? String else
                {print("groupName did not unwrap"); return}
                //MEETUP GROUP NAME
                
                let singleMeetupEventObject = MeetupEvent.init(eventName: nameOfSingleMeetupEvent, meetupGroupName: unwrappedGroupNameOfSingleMeetupEvent, eventDateAndTime: timeOfSingleMeetupEvent, rsvpdYes: yesRSVPdOfSingleMeetupEvent)
                
                    print("****************************************")
                    print(singleMeetupEventObject.eventName)
                    print(singleMeetupEventObject.eventDateAndTime)
                    print(singleMeetupEventObject.meetupGroupName)
                    print(singleMeetupEventObject.rsvpdYes)
                    print("****************************************")
                
                self.meetupEvents.append(singleMeetupEventObject)
                print(self.meetupEvents.count)
            
            }
            completion(self.meetupEvents)
        }
    }


}
