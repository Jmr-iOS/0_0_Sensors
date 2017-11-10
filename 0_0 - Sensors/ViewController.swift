/************************************************************************************************************************************/
/** @file		ViewController.swift
 *  @project    0_0 - Sensors
 * 	@brief		x
 * 	@details	x
 *
 * 	@author		Justin Reina, Firmware Engineer, Jaostech
 * 	@created	6/8/16
 * 	@last rev	x
 *
 *
 * 	@notes		x
 *
 * 	@section	Opens
 * 			none current
 *
 * 	@section	Legal Disclaimer
 * 			All contents of this source file and/or any other Jaostech related source files are the explicit property on Jaostech
 * 			Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;

        self.accelerometerDemo();
        
        print("ViewController.viewDidLoad():       viewDidLoad() complete");
        
        //listen to 'Home' press
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
                                                         name: NSNotification.Name.UIApplicationWillResignActive,
                                                         object: nil);
    
        return;
    }

    
    @objc func accelerometerDemo() {
        
        let a : Accelerometer = Accelerometer();
        
        print("maybe \(a.hash)");
        print(" ");
        return;
    }

    
    @objc func applicationWillResignActive(_ notification: Notification) {
        print("I'm out of focus, home was pressed!");
        return;
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();

        return;
    }
}

