//
//  ViewController.swift
//  calculator_practice1
//
//  Created by Tran Van Tin on 4/14/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblShow: UILabel!
    @IBOutlet var lblOperation: UILabel!
    
    var currentNumber:Double = 0
    var previousNumber:Double = 0
    var operation:Int = 0

    
    var complete = false
    var performedMath = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblShow.text = "0"
        lblOperation.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //input numbers
    @IBAction func numbers(_ sender: UIButton) {
        if sender.tag == 19 {
            if lblShow.text == "0" {
                lblShow.text = "0."
            }
            else{
                let countdots = lblShow.text!.components(separatedBy: ".").count - 1
                if countdots == 0 {
                    lblShow.text = lblShow.text! + "."
                }
            }
        }else if performedMath || complete || lblShow.text == "0"{
            lblShow.text = String(sender.tag-1)

            performedMath = false
            complete = false
        }
        else {
            lblShow.text = lblShow.text! + String(sender.tag-1)

            
        }
        currentNumber = Double(lblShow.text!)!
        
    }
    
    //calculating
    @IBAction func operations(_ sender: UIButton) {
        
        switch sender.tag {
        case 11: //clear
            lblShow.text = "0"
            lblOperation.text = ""
            currentNumber = 0
            previousNumber = 0
            break
            
        case 12: //divide
            previousNumber = Double(lblShow.text!)!

            lblOperation.text = "/"
            operation = sender.tag
            performedMath = true
            
            break
            
        case 13: //multiple
            previousNumber = Double(lblShow.text!)!

            lblOperation.text = "x"
            operation = sender.tag
            performedMath = true

            break
            
        case 14: //minus
            previousNumber = Double(lblShow.text!)!

            lblOperation.text = "-"
            operation = sender.tag
            performedMath = true

            break
            
        case 15: //plus
            previousNumber = Double(lblShow.text!)!

            lblOperation.text = "+"
            operation = sender.tag
            performedMath = true
            break
            
        case 16: //press equal
            lblOperation.text = "="
            
            
            if operation == 12 {
                if currentNumber == 0 { //divide to 0
                    break
                } else {
                lblShow.text = String(previousNumber / currentNumber)
                }
            }
            else if operation == 13 {
                lblShow.text = String(previousNumber * currentNumber)
            }
            else if operation == 14 {
                lblShow.text = String(previousNumber - currentNumber)
            }
            else if operation == 15 {
                lblShow.text = String(previousNumber + currentNumber)
            }
            
            complete = true

            break
            
        case 17: //negative
            if Double(lblShow.text!)! != 0 && performedMath != true {
                lblShow.text = String(Double(lblShow.text!)! * (-1))
                currentNumber = Double(lblShow.text!)!
            }
            break
            
        case 18: //%
            lblShow.text = String(Double(lblShow.text!)! / (100))
            currentNumber = Double(lblShow.text!)!
            complete = true
            break
            
        default:
            break
        }
        
    }
    
    
    
}

