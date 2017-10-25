//
//  MeetupAPIClient.swift
//  MeetupProject
//
//  Created by Flatiron School on 1/25/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class MeetupAPIClient{

    class func getMeetupEvents(zipCode: String, completion:@escaping(Array<Any>)->()){
        
        var jsonArrayOfDictionary : Array<Any> = []
        
        let meetupURL = "https://api.meetup.com/2/open_events.json?zip=\(zipCode)&time=,1w&key=\(Secrets.meetupAPIKey)"
        
        let convertedMeetupURL = URL(string: meetupURL)
        
        guard let unwrappedConvertedMeetupURL = convertedMeetupURL else {print("convertedMeetupURL did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedMeetupURL)
        
        let task = URLSession.shared.dataTask(with: request , completionHandler:{ (data, response, error) in
            
            guard let unwrappedData = data else {print("data did not unwrap"); return}
            
            let jsonResponseDictionary = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
            
            guard let unwrappedJsonResponseDictionary = jsonResponseDictionary else {
                print("jsonResponseDictionary did not unwrap"); return }
            
            guard let unwrappedResultsArray = unwrappedJsonResponseDictionary["results"] as? Array<Any> else {print("resultsArray did not unwarp"); return}
            
            jsonArrayOfDictionary = unwrappedResultsArray

            
            completion(jsonArrayOfDictionary)
    
        })
        
        task.resume()

    }


}
