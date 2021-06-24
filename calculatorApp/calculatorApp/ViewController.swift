//
//  ViewController.swift
//  calculatorApp
//
//  Created by NAMAN GARG on 6/4/21.
//

import UIKit

class ViewController: UIViewController {
    var currentNum: Double = 0
    var prevNum: Double = 0
    var calculate = false
    var opr = 0
    
    @IBOutlet var screenLable: UILabel!
    
    @IBOutlet var landscapeStackView: UIStackView!
    @IBOutlet var portraitStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
    }
    func updateView(){
        if UIDevice.current.orientation.isLandscape {
            landscapeStackView.isHidden = false
        }else{
            landscapeStackView.isHidden = true
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateView()
    }
    
    
    @IBAction func getNumbers(_ sender: UIButton) {
        if calculate == true{
            screenLable.text = String(sender.tag - 1)
            currentNum = Double(screenLable.text!)!
            calculate = false
        }
        else{
            screenLable.text = screenLable.text! + String(sender.tag - 1)
            currentNum = Double(screenLable.text!)!
        }
    }
    
    
    @IBAction func performCalculation(_ sender: UIButton) {
        if screenLable.text != "" && sender.tag != 11 && sender.tag != 16{
            prevNum = Double(screenLable.text!)!
            switch sender.tag {
            case 12:
                screenLable.text = "+"
            case 13:
                screenLable.text = "-"
            case 14:
                screenLable.text = "×"
            case 15:
                screenLable.text = "÷"
            default:
                screenLable.text = ""
            }
            calculate = true
            opr = sender.tag
        }
        else if sender.tag == 11{
            switch opr {
            case 12:
                screenLable.text = String(prevNum+currentNum)
            case 13:
                screenLable.text = String(prevNum - currentNum)
            case 14:
                screenLable.text = String(prevNum*currentNum)
            case 15:
                screenLable.text = String(prevNum/currentNum)
            default:
                screenLable.text = String(currentNum)
            }
        }else {
            screenLable.text = "0"
            prevNum = 0
            currentNum = 0
            opr = 0
                
            }
            
    }
    
    
    


}

