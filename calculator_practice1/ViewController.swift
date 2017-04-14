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
    var performedMath = false
    var operation:Int = 0
    var complete = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblShow.text = ""
        lblOperation.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numbers(_ sender: UIButton) {
        if performedMath || complete {
            lblShow.text = String(sender.tag-1)
            currentNumber = Double(lblShow.text!)!
            performedMath = false
            complete = false
        }
        else {
            lblShow.text = lblShow.text! + String(sender.tag-1)
            currentNumber = Double(lblShow.text!)!
        }
        
    }

    @IBAction func operations(_ sender: UIButton) {
        
        
        switch sender.tag {
        case 11: //clear
            lblShow.text = ""
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
        case 13: //divide
            previousNumber = Double(lblShow.text!)!
            lblOperation.text = "x"
            operation = sender.tag
            performedMath = true
            break
        case 14: //divide
            previousNumber = Double(lblShow.text!)!
            lblOperation.text = "-"
            operation = sender.tag
            performedMath = true
            break
        case 15: //divide
            previousNumber = Double(lblShow.text!)!
            lblOperation.text = "+"
            operation = sender.tag
            performedMath = true
            break
        case 16:
            lblOperation.text = "="
            if operation == 12{
                lblShow.text = String(previousNumber / currentNumber)
            }
            else if operation == 13{
                lblShow.text = String(previousNumber * currentNumber)
            }
            else if operation == 14{
                lblShow.text = String(previousNumber - currentNumber)
            }
            else if operation == 15{
                lblShow.text = String(previousNumber + currentNumber)
            }
            complete = true
            break
        default:
            break
        }
        
    }
    
    
    
}

