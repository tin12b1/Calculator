//
//  ViewController.swift
//  calculator_practice1
//
//  Created by Tran Van Tin on 4/14/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //khai bao 2 label: 1 de hien thi so nhap vao, 1 de hien thi phep tinh
    @IBOutlet var lblShow: UILabel!
    @IBOutlet var lblOperation: UILabel!
    
    //khai bao cac bien de tien viec tinh toan
    var currentNumber:Double = 0
    var previousNumber:Double = 0
    var operation:Int = 0
    var count:Int = 0
    
    //cac bien bool de xac dinh qua trinh tinh toan
    var complete = false
    var performedMath = false
    var isInteger:Bool = false

    
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
    
    //ham xu ly khi nguoi dung nhap vao
    @IBAction func numbers(_ sender: UIButton) {
        //xu ly dau thap phan
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
        }else if performedMath || complete || lblShow.text == "0"{ //truong hop nhap moi mot con so vao
            lblShow.text = String(sender.tag-1)
            performedMath = false
            complete = false
        }
        else { //truong hop nhap tiep vao, tuc la tren man hinh da co chu so
            lblShow.text = lblShow.text! + String(sender.tag-1)
        }
        currentNumber = Double(lblShow.text!)!
    }
    
    func calculation() { //ham tinh toan
        if (currentNumber.isNaN || previousNumber.isNaN) { //kiem tra xem hien tai cac bien co phai la so khong
            lblShow.text = "Not a number"
        } else {
            if operation == 12 { //phep chia
                if currentNumber == 0 { //chia cho 0
                    lblShow.text = "Not a number"
                } else {
                    isInteger = floor(previousNumber / currentNumber) == previousNumber / currentNumber
                    if isInteger { //kiem tra phai so nguyen hay khong
                        lblShow.text = String(Int(previousNumber / currentNumber))
                    } else{
                        lblShow.text = String(previousNumber / currentNumber)
                    }
                }
            }
            else if operation == 13 { //phep nhan
                isInteger = floor(previousNumber * currentNumber) == previousNumber * currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber * currentNumber))
                } else{
                    lblShow.text = String(previousNumber * currentNumber)
                }
            }
            else if operation == 14 { //phep tru
                isInteger = floor(previousNumber - currentNumber) == previousNumber - currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber - currentNumber))
                } else{
                    lblShow.text = String(previousNumber - currentNumber)
                }
            }
            else if operation == 15 { //phep cong
                isInteger = floor(previousNumber + currentNumber) == previousNumber + currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber + currentNumber))
                } else{
                    lblShow.text = String(previousNumber + currentNumber)
                }
            }
            else {
                currentNumber = Double(lblShow.text!)!
                isInteger = floor(currentNumber) == currentNumber
                if isInteger {
                    lblShow.text = String(Int(currentNumber))
                } else{
                    lblShow.text = String(currentNumber)
                }
            }
            complete = true
        }
    }
    
    //xu ly khi nguoi dung nhan cac button con lai
    @IBAction func operations(_ sender: UIButton) {
        
        switch sender.tag {
        case 11: //xoa man hinh va bo nho
            lblShow.text = "0"
            lblOperation.text = ""
            currentNumber = 0
            previousNumber = 0
            count = 0
            break
            
        case 12: //phep chia
            if count >= 1 && performedMath == false { //kiem tra de xem co thuc hien lien tuc cac phep tinh khong
                calculation()
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "/"
            operation = sender.tag
            performedMath = true
            break
            
        case 13: //phep nhan
            if count >= 1 && performedMath == false {
                calculation()
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "x"
            operation = sender.tag
            performedMath = true
            break
            
        case 14: //phep tru
            if count >= 1 && performedMath == false {
                calculation()
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "-"
            operation = sender.tag
            performedMath = true
            break
            
        case 15: //phep cong
            if count >= 1 && performedMath == false {
                calculation()
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "+"
            operation = sender.tag
            performedMath = true
            break
            
        case 16: //dau bang
            lblOperation.text = "="
            count = 0
            calculation()
            break
            
        case 17: //am/duong
            if (currentNumber.isNaN || previousNumber.isNaN) {
                lblShow.text = "Not a number"
            } else {
                if Double(lblShow.text!)! != 0 && performedMath != true {
                    lblShow.text = String(Double(lblShow.text!)! * (-1))
                    currentNumber = Double(lblShow.text!)!
                    count = 0
                }
            }
            break
            
        case 18: //%
            if (currentNumber.isNaN || previousNumber.isNaN) {
                lblShow.text = "Not a number"
            } else {
                lblShow.text = String(Double(lblShow.text!)! / (100))
                currentNumber = Double(lblShow.text!)!
                complete = true
                count = 0
            }
            break
            
        default:
            break
        }
        
    }
    
    
    
}

