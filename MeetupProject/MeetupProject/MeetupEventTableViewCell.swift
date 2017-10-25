//
//  MeetupEventTableViewCell.swift
//  MeetupProject
//
//  Created by Flatiron School on 1/29/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class MeetupEventTableViewCell: UITableViewCell {
    
    var eventNameLabel: UILabel!
    var eventDateAndTimeLabel: UILabel!
    var meetupGroupNameLabel: UILabel!
    var rsvpdYesLabel: UILabel!
    var favoriteEventButton: UIButton!
    
    var event: MeetupEvent! {
        didSet {
            eventNameLabel.text = event.eventName
            eventDateAndTimeLabel.text = String(describing: event.eventDateAndTime)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.eventNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        self.eventDateAndTimeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        self.meetupGroupNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        self.rsvpdYesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        self.addSubview(self.eventNameLabel)
        self.addSubview(self.eventDateAndTimeLabel)
        self.addSubview(self.meetupGroupNameLabel)
        self.addSubview(self.rsvpdYesLabel)
        
        self.addSubview(self.favoriteEventButton)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func favoriteEvent() {
        
        // call back to Core Data to persist the event
        
        
        
    }

}
