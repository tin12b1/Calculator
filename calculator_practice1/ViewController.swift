//
//  ViewController.swift
//  calculator_practice1
//
//  Created by Tran Van Tin on 4/14/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Khai báo 2 label: 1 để hiển thị số nhập vào, 1 để hiển thị phép tính hiện tại
    @IBOutlet var lblShow: UILabel!
    @IBOutlet var lblOperation: UILabel!
    
    // Khai báo các biến hỗ trợ việc tính toán
    var currentNumber:Double = 0
    var previousNumber:Double = 0
    var operation:Int = 0
    var count:Int = 0
    var temp:Double = 0
    
    // Các biến bool để kiểm soát quá trình tính toán
    var complete = false
    var performedMath = false


    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblShow.text = "0"
        lblOperation.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Hàm xử lý khi người dùng nhập vào
    @IBAction func numbers(_ sender: UIButton) {
        // Xử lý dấu thập phân
        if sender.tag == 19 {
            if lblShow.text == "0" {
                lblShow.text = "0."
            }
            else {
                let countDots = lblShow.text!.components(separatedBy: ".").count - 1
                if countDots == 0 {
                    lblShow.text = lblShow.text! + "."
                }
            }
        }
        else if performedMath || complete || lblShow.text == "0" {
            lblShow.text = String(sender.tag-1)
            performedMath = false
            complete = false
            //Trường hợp nhập mới 1 con số vào
        }
        else {
            lblShow.text = lblShow.text! + String(sender.tag-1)
            //Trường hợp nhập tiếp vào các con số đằng sau, khi đã nhập một hoặc vài con số
        }
        currentNumber = Double(lblShow.text!)!
    }
    
    // Hàm tính toán
    func calculation() {
        // Phép chia
        if operation == 12 {
            if currentNumber == 0 {
                lblShow.text = "Not a number"
                // Chia cho 0
            }
            else {
                temp = previousNumber / currentNumber
                if isInteger(temp: temp) {
                    lblShow.text = String(format: "%.0f", temp)
                    // Kiểm tra số nguyên
                }
                else {
                    lblShow.text = String(Double(temp))
                }
            }
        }
        // Phép nhân
        else if operation == 13 {
            temp = previousNumber * currentNumber
            if isInteger(temp: temp) {
                lblShow.text = String(format: "%.0f", temp)
            }
            else {
                lblShow.text = String(Double(temp))
            }
        }
        // Phép trừ
        else if operation == 14 {
            temp = previousNumber - currentNumber
            if isInteger(temp: temp) {
                lblShow.text = String(format: "%.0f", temp)
            }
            else {
                lblShow.text = String(Double(temp))
            }
        }
        // Phép cộng
        else if operation == 15 {
            temp = previousNumber + currentNumber
            if isInteger(temp: temp) {
                lblShow.text = String(format: "%.0f", temp)
            }
            else {
                lblShow.text = String(Double(temp))
            }
        }
        // Dấu bằng
        else {
            if isInteger(temp: currentNumber) {
                lblShow.text = String(format: "%.0f", currentNumber)
            }
            else {
                lblShow.text = String(Double(currentNumber))
            }
        }
        complete = true
    }
    
    // Xử lý khi người dùng nhấn các button còn lại
    @IBAction func operations(_ sender: UIButton) {
        switch sender.tag {
        case 11:
            lblShow.text = "0"
            lblOperation.text = ""
            currentNumber = 0
            previousNumber = 0
            operation = 0
            count = 0
            break
            // Xoá màn hình và bộ nhớ (các biến)
            
        case 12:
            if count >= 1 && performedMath == false {
                calculation()
                // Kiểm tra việc thực hiện liên tục các phép tính
            }
            if lblShow.text == "Not a number" {
                break
            }
            else {
                previousNumber = Double(lblShow.text!)!
            }
            if !performedMath {
                count += 1
            }
            lblOperation.text = "/"
            operation = sender.tag
            performedMath = true
            break
            // Button chia (/)
            
        case 13:
            if count >= 1 && performedMath == false {
                calculation()
                // Kiểm tra việc thực hiện liên tục các phép tính
            }
            if lblShow.text == "Not a number" {
                break
            }
            else {
                previousNumber = Double(lblShow.text!)!
            }
            if !performedMath {
                count += 1
            }
            lblOperation.text = "x"
            operation = sender.tag
            performedMath = true
            break
            // Button nhân (x)
            
        case 14:
            if count >= 1 && performedMath == false {
                calculation()
                // Kiểm tra việc thực hiện liên tục các phép tính
            }
            if lblShow.text == "Not a number" {
                break
            }
            else {
                previousNumber = Double(lblShow.text!)!
            }
            if !performedMath {
                count += 1
            }
            lblOperation.text = "-"
            operation = sender.tag
            performedMath = true
            break
            // Button trừ (-)
            
        case 15:
            if count >= 1 && performedMath == false {
                calculation()
                // Kiểm tra việc thực hiện liên tục các phép tính
            }
            if lblShow.text == "Not a number" {
                break
            } else {
                previousNumber = Double(lblShow.text!)!
            }
            if !performedMath {
                count += 1
            }
            lblOperation.text = "+"
            operation = sender.tag
            performedMath = true
            break
            // Button cộng (+)
            
        case 16:
            lblOperation.text = "="
            count = 0
            calculation()
            operation = 0
            break
            // Dấu bằng (=)
            
        case 17:
            if lblShow.text == "Not a number" {
                break
            } else {
                temp = Double(lblShow.text!)!
                if Double(lblShow.text!)! != 0 && performedMath != true {
                    if isInteger(temp: temp) {
                        lblShow.text = String(format: "%.0f", temp * (-1))
                    } else {
                        lblShow.text = String(Double(temp * (-1)))
                    }
                        currentNumber = Double(lblShow.text!)!
                }
            }
            break
            // Dấu âm
            
        case 18:
            if lblShow.text == "Not a number" {
                break
            } else {
                temp = Double(lblShow.text!)!/100
                if isInteger(temp: temp) {
                    lblShow.text = String(format: "%.0f", temp)
                } else {
                    lblShow.text = String(Double(temp))
                }
                currentNumber = Double(lblShow.text!)!
                complete = true
                count = 0
            }
            break
            // Dấu phần trăm (%)
            
        default:
            break
        }
        
    }
    
    // Hàm kiểm tra số nguyên
    func isInteger(temp: Double) -> Bool {
        if temp == floor(temp) {
            return true
        } else {
            return false
        }
    }
    
}


