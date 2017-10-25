//
//  SplashViewController.swift
//  MeetupProject
//
//  Created by Flatiron School on 1/28/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var splashView: SplashView = SplashView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.view.addSubview(splashView)
        splashView.layoutSubviews()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let when = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.splashView.animateImage({
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = UINavigationController(rootViewController: ViewController())
                self.navigationController?.pushViewController(ViewController(), animated: false)
                print("Inside animation")
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
