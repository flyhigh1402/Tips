//
//  ViewController.swift
//  Tips
//
//  Created by huy ngo on 10/29/15.
//  Copyright © 2015 huy ngo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DestinationViewDelegate {

    @IBOutlet var resultView: UIView!
    @IBOutlet var totalBilltxt: UITextField!

    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var tipsMoney: UILabel!
    @IBOutlet var for2lbl: UILabel!
    @IBOutlet var for3lbl: UILabel!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalBilltxt.becomeFirstResponder()
        self.resultView.hidden = true
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  /*  @IBAction func valueChanged(sender: AnyObject) {
        var currentValue = Int (slider.value)
        tipLabel.text = "\(currentValue)%"
    } */
    func viewUp(view:UIView,animationTime:Float)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
              UIView.setAnimationDuration(NSTimeInterval(animationTime))
        UIView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView: view, cache: false)
        UIView.commitAnimations()
    }
    @IBAction func typingBill(sender: AnyObject) {
        UIView.animateWithDuration(1.0, animations: {
            self.resultView.hidden = false
            self.tipsMoney.hidden = false
            self.totalBilltxt.frame = CGRect(x: 0, y: 70, width: self.totalBilltxt.frame.width, height: self.totalBilltxt.frame.height)
            self.resultView.frame = CGRect(x:0,y:150, width: 320, height: 700)
        })
        let currentValue = Int (slider.value)
        tipLabel.text = "\(currentValue)%"
        let totalAmount: Double = NSString (string: totalBilltxt.text!).doubleValue
        let finalTips = Double(currentValue) / 100
        let tips = totalAmount * finalTips
        let total = totalAmount + tips
        let total2 = total / 2
        let total3 = total / 3
        for2lbl.text = formatAsCurrency(total2)
        for3lbl.text = formatAsCurrency(total3)
        resultLabel.text = formatAsCurrency(total)
        tipsMoney.text = formatAsCurrency(tips)

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "settingview") {
            let svc = segue.destinationViewController as! SettingViewController
            svc.delegate = self
        }
    }
    func setValue(minValue: Float, maxValue: Float, current: Float) {
        slider.value = current
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        tipLabel.text = "\(current)%"
        let totalAmount: Double = NSString (string: totalBilltxt.text!).doubleValue
        let finalTips = Double(current) / 100
        let tips = totalAmount * finalTips
        let total = totalAmount + tips;
        resultLabel.text = formatAsCurrency(total)
        tipsMoney.text = formatAsCurrency(tips)
    }
    
    @IBAction func OnTap(sender: AnyObject) {
        view.endEditing(true)
    }
    func formatAsCurrency(number: NSNumber) -> String {
        return NSNumberFormatter.localizedStringFromNumber(
            number, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
        }
}



