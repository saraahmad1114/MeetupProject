//
//  SplashView.swift
//  MeetupProject
//
//  Created by Flatiron School on 1/28/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

import UIKit

typealias completion = () -> Void

final class SplashView: UIView{

    var animationTime: Double = 0.0
    
    var meetupImage: UIImageView = {
        let image = UIImage(named: "meetupLogo.png")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frame = UIScreen.main.bounds
        addViews()
    }
    
    func addViews() {
        addSubview(meetupImage)
        meetupImage.translatesAutoresizingMaskIntoConstraints = false
        meetupImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.50).isActive = true
        meetupImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.50).isActive = true
        meetupImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        meetupImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func expandImage() -> CGAffineTransform {
        let expandImage: CGAffineTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        return expandImage
    }
    
    func animateImage(_ handler: completion? = nil) {
        UIView.animate(withDuration: 0.5, animations: {
            self.meetupImage.transform = self.expandImage()
        }, completion: { finished in
            weak var appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.window?.rootViewController = ViewController()
            self.meetupImage.alpha = 0
            handler?()
        })

    }








}
