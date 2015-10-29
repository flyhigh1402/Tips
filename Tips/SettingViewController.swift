//
//  SettingViewController.swift
//  Tips
//
//  Created by huy ngo on 10/29/15.
//  Copyright © 2015 huy ngo. All rights reserved.
//

import UIKit
protocol DestinationViewDelegate {
    func setValue( minValue:Float, maxValue:Float, current:Float);
}

class SettingViewController: UIViewController {


    @IBOutlet var defaultRate: UITextField!
    @IBOutlet var minRate: UITextField!
    @IBOutlet var maxRate: UITextField!

    var delegate : DestinationViewDelegate! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func EndEdit(sender: AnyObject) {
        let defaultTips: Float = NSString (string: defaultRate.text!).floatValue
        let maxTips: Float = NSString (string: maxRate.text!).floatValue
        let minTips: Float = NSString (string: minRate.text!).floatValue
        delegate.setValue(minTips, maxValue: maxTips, current: defaultTips)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
