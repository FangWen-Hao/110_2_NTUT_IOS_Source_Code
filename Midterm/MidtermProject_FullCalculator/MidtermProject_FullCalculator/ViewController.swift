//
//  ViewController.swift
//  MidtermProject_FullCalculator
//
//  Created by Admin on 2022/5/4.
//

import UIKit

class ViewController: UIViewController {
    lazy var brain = CalculatorBrain()

    let viewColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(103 / 255),
                        blue: CGFloat(120 / 255), alpha: 1.0)

    let operandsBtnColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(147 / 255),
                        blue: CGFloat(171 / 255), alpha: 1.0)

//    let lightestBlue:[Int] = [0, 175, 193]
    let funcsBtnColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(175 / 255),
                        blue: CGFloat(193 / 255), alpha: 1.0)

    let yellow:[CGFloat] = [(CGFloat(255 / 255)), (CGFloat(209 / 255)), (CGFloat(36 / 255))]
    lazy var operatorsBtnColor = UIColor(red: yellow[0], green: yellow[1],
    blue: yellow[2], alpha: 1.0)
    
    @IBOutlet weak var labelOperation: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet var clearBtn: UIButton!
    
    @IBOutlet var operandsBtn: [UIButton]!
    @IBOutlet var operatorsBtn: [UIButton]!
    @IBOutlet var funcsBtn: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        setViewProperties()
        setLabelsProperties()
    }
    
    @IBAction func operatorBtnPressed(_ sender: UIButton) {
        if let operatorBtnPressed =  sender.titleLabel?.text {
            brain.inputProcessing(input: operatorBtnPressed)
            resetOperatorsBtn()
            sender.setTitleColor(operatorsBtnColor, for: .normal)
            sender.backgroundColor = UIColor.white
        }
        
    }
    
    @IBAction func operandsBtnPressed(_ sender: UIButton) {
        if let operandsBtnPressed =  sender.titleLabel?.text {
            brain.inputOperand(operand: operandsBtnPressed)
            clearBtn.setTitle("C", for: .normal)
            updateModelViewLabels()
        }
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        if clearBtn.title(for: .normal) == "AC"{
            for btn in operatorsBtn{
                btn.setTitleColor(UIColor.white, for: .normal)
                btn.backgroundColor = operatorsBtnColor
            }
        }
        
        if clearBtn.title(for: .normal) == "C"{
            brain.CurrentOperand = "0"
            if brain.tempo.isEmpty{
                brain.CurrentOperand = "0"
                brain.tempo.removeAll()
                brain.clearAll()
                clearBtn.setTitle("AC", for: .normal)
            }
            else{
                clearBtn.setTitle("AC", for: .normal)
                if labelResult.text == "0"{
                    if labelOperation.text != "÷" || labelOperation.text != "*" || labelOperation.text != "+" || labelOperation.text != "-"{
                        brain.tempo.removeLast()
                    }
                    brain.clearAll()
                }
            }
        }
        
        else{
            brain.clearAll()
            clearBtn.setTitle("AC", for: .normal)
        }
        updateModelViewLabels()
    }
    
    @IBAction func percentageFuncBtnPressed(_ sender: Any) {
        brain.operandPercentage()
        updateModelViewLabels()
    }

    @IBAction func operatorOppositeFuncBtnPressed(_ sender: Any) {
        brain.operandOpposite()
        updateModelViewLabels()
    }
    
    @IBAction func equalBtnPressed(_ sender: UIButton) {
        brain.inputEqual()
        for btn in operatorsBtn{
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = operatorsBtnColor
        }
        updateModelViewLabels()
    }

    private func updateModelViewLabels() {
        labelResult.text = brain.CurrentOperand
        labelOperation.text = brain.records()
    }

    private func setViewProperties() {
        setOperandsBtnProperties()
        setOperatorsBtnProperties()
        setFuncsBtnProperties()
    }
    
    private func setLabelsProperties() {
        labelOperation.textColor = UIColor.white
        labelResult.textColor = UIColor.white
    }

    private func setFuncsBtnProperties() {
        for index in funcsBtn.indices{
            let btn = funcsBtn[index]

            btn.layer.cornerRadius = btn.frame.width / 2
            btn.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    private func setOperatorsBtnProperties() {
        for index in operatorsBtn.indices{
            let btn = operatorsBtn[index]

            btn.layer.cornerRadius = btn.frame.width / 2
            btn.layer.masksToBounds = true
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = operatorsBtnColor
        }
    }
    
    private func setOperandsBtnProperties() {
        for index in operandsBtn.indices{
            let btn = operandsBtn[index]

            if(btn.titleLabel?.text == "0") {
                btn.layer.cornerRadius = 38
            } else {
                btn.layer.cornerRadius = btn.frame.width / 2
            }
            btn.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    private func resetOperatorsBtn () {
        for btn in operatorsBtn{
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = operatorsBtnColor
        }
    }
}
