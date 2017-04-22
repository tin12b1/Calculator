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
    var temp:Double = 0
    
    //cac bien bool de xac dinh qua trinh tinh toan
    var complete = false
    var performedMath = false
    var isInteger:Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                let countDots = lblShow.text!.components(separatedBy: ".").count - 1
                if countDots == 0 {
                    lblShow.text = lblShow.text! + "."
                }
            }
        }else if performedMath || complete || lblShow.text == "0"{
            lblShow.text = String(sender.tag-1)
            performedMath = false
            complete = false
            //truong hop nhap moi mot con so vao
        }
        else {
            lblShow.text = lblShow.text! + String(sender.tag-1)
            //truong hop nhap tiep vao, tuc la tren man hinh da co chu so
        }
        currentNumber = Double(lblShow.text!)!
    }
    
    func calculation() { //ham tinh toan
        if (currentNumber.isNaN || previousNumber.isNaN) {
            lblShow.text = "Not a number"
            //kiem tra xem hien tai cac bien co phai la so khong
        } else {
            //phep chia
            if operation == 12 {
                if currentNumber == 0 {
                    lblShow.text = "Not a number"
                    //chia cho 0
                } else {
                    //kiem tra phai so nguyen hay khong
                    isInteger = floor(previousNumber / currentNumber) == previousNumber / currentNumber
                    if isInteger {
                        lblShow.text = String(Int(previousNumber / currentNumber))
                    } else{
                        lblShow.text = String(previousNumber / currentNumber)
                    }
                }
            }
            //phep nhan
            else if operation == 13 {
                isInteger = floor(previousNumber * currentNumber) == previousNumber * currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber * currentNumber))
                } else{
                    lblShow.text = String(previousNumber * currentNumber)
                }
            }
            //phep tru
            else if operation == 14 {
                isInteger = floor(previousNumber - currentNumber) == previousNumber - currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber - currentNumber))
                } else{
                    lblShow.text = String(previousNumber - currentNumber)
                }
            }
            //phep cong
            else if operation == 15 {
                isInteger = floor(previousNumber + currentNumber) == previousNumber + currentNumber
                if isInteger {
                    lblShow.text = String(Int(previousNumber + currentNumber))
                } else{
                    lblShow.text = String(previousNumber + currentNumber)
                }
            }
            //dau bang (=)
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
        case 11:
            lblShow.text = "0"
            lblOperation.text = ""
            currentNumber = 0
            previousNumber = 0
            count = 0
            break
            //xoa man hinh va bo nho
            
        case 12:
            if count >= 1 && performedMath == false {
                calculation()
                //kiem tra de xem co thuc hien lien tuc cac phep tinh khong
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "/"
            operation = sender.tag
            performedMath = true
            break
            //phep chia
            
        case 13:
            if count >= 1 && performedMath == false {
                calculation()
                //kiem tra de xem co thuc hien lien tuc cac phep tinh khong
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "x"
            operation = sender.tag
            performedMath = true
            break
            //phep nhan
            
        case 14:
            if count >= 1 && performedMath == false {
                calculation()
                //kiem tra de xem co thuc hien lien tuc cac phep tinh khong
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "-"
            operation = sender.tag
            performedMath = true
            break
            //phep tru
            
        case 15:
            if count >= 1 && performedMath == false {
                calculation()
                //kiem tra de xem co thuc hien lien tuc cac phep tinh khong
            }
            previousNumber = Double(lblShow.text!)!
            if !performedMath {
                count += 1
            }
            lblOperation.text = "+"
            operation = sender.tag
            performedMath = true
            break
            //phep cong
            
        case 16:
            lblOperation.text = "="
            count = 0
            calculation()
            break
            //dau bang
            
        case 17:
            if (currentNumber.isNaN || previousNumber.isNaN) {
                lblShow.text = "Not a number"
                //kiem tra xem hien tai cac bien co phai la so khong
            } else {
                temp = Double(lblShow.text!)!
                if Double(lblShow.text!)! != 0 && performedMath != true {
                    isInteger = floor(temp) == temp
                    if isInteger {
                        lblShow.text = String(Int(temp)*(-1))
                    } else{
                        lblShow.text = String(temp*(-1))
                    }
                    currentNumber = Double(lblShow.text!)!
                }
            }
            break
            //am/duong
            
        case 18: //%
            if (currentNumber.isNaN || previousNumber.isNaN) {
                lblShow.text = "Not a number"
                //kiem tra xem hien tai cac bien co phai la so khong
            } else {
                temp = Double(lblShow.text!)!/100
                isInteger = floor(temp) == temp
                if isInteger {
                    lblShow.text = String(Int(temp))
                } else{
                    lblShow.text = String(temp)
                }
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

