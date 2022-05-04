//
//  CalculatorBrain.swift
//  MidtermProject_FullCalculator
//
//  Created by Admin on 2022/5/4.
//

import Foundation

class CalculatorBrain {
    
    var brainCell = CalculatorBrainCell<String>()
    var CurrentOperation:String! = ""
    var CurrentOperand:String! = "0"
    var calculatorResult:Decimal! = 0
    var operationPriority:Int! = 0
    var tempo:[String]! = []

    let operationPriorityOrder:[String: Int]! = ["÷" : 2, "/" : 2, "×" : 2, "*" : 2, "-" : 1, "+" : 1]
    
    public func inputOperand(operand:String) {
        tempoInsert(items: CurrentOperation)
        realTimeCalculate()
        operandToBrainCell()
        
        if(CurrentOperand == "0" && operand != ".") {
            CurrentOperand = operand
        }
        else if (CurrentOperand.contains(".") && operand == ".") {
        }
        else {
            CurrentOperand = CurrentOperand + operand
        }
    }

    public func inputEqual() {
        CurrentOperation = ""
        CurrentOperand = deleteZeroOrDecimalPoint(operand: CurrentOperand)
        tempoInsert(items: CurrentOperand)
        saveOperandInBrainCell()
        
        if(brainCell.elementCount() >= 3) {
            tempoInsert(items: "=")
            
            while(brainCell.elementCount() >= 3) {
                calculateResult()
                brainCell.push(item: CurrentOperand)
            }
        } else {
            CurrentOperand = brainCell.pop()
            tempo.removeLast()
        }
    }
    
    public func inputProcessing(input: String) {
        CurrentOperand = deleteZeroOrDecimalPoint(operand: CurrentOperand)
        tempoInsert(items: CurrentOperand)
        saveOperandInBrainCell()
        
        CurrentOperation = input
    }

    public func records() -> String {
        return tempo.joined(separator: " ")
    }
        
    public func operandOpposite() {
        if(CurrentOperand.prefix(1) == "-") {CurrentOperand.removeFirst()}
        else {CurrentOperand = "-" + CurrentOperand}
    }
    
    public func operandPercentage() {
        var operand:Double! = Double(CurrentOperand)
        operand = operand * 0.01
        CurrentOperand = String(operand)
    }
    
    public func clearAll() {
        calculatorResult = 0
        CurrentOperand = "0"
        tempo.removeAll()
        while(!brainCell.isElementEmpty()) {brainCell.pop()}
    }
    
    private func realTimeCalculate() {
        if(CurrentOperation != "" && brainCell.elementCount() >= 3) {
            if(compareOperationPriorityPrevCurrent()) {
                calculateResult()
                saveOperandInBrainCell()
            }
        }
    }
    
    private func operandToBrainCell() {
        if(CurrentOperation != "") {
            operationPriority = operationPriorityOrder[CurrentOperation]
            brainCell.push(item: CurrentOperation)
            CurrentOperation = ""
        }
    }
    
    private func saveOperandInBrainCell() {
        if(CurrentOperand != "") {
            brainCell.push(item: CurrentOperand)
            CurrentOperand = ""
        }
    }
    
    private func compareOperationPriorityPrevCurrent() -> Bool {
        let comparison = operationPriority >= (operationPriorityOrder[CurrentOperation]!)
        return comparison
    }
    
    private func tempoInsert(items: String) {
        if(items != "") {tempo.append(items)}
    }
    

    private func calculateResult() {
        let rightOperand:Decimal! = Decimal(string: brainCell.pop()!)
        let calOperator = brainCell.pop()!
        let leftOperand:Decimal! = Decimal(string: brainCell.pop()!)
        
        switch calOperator {
        case "+":
            addition(a: leftOperand, b: rightOperand)
        case "-":
            subtraction(a: leftOperand, b: rightOperand)
        case "×":
            multiplication(a: leftOperand, b: rightOperand)
        case "*":
            multiplication(a: leftOperand, b: rightOperand)
        case "÷":
            division(a: leftOperand, b: rightOperand)
        case "/":
            division(a: leftOperand, b: rightOperand)
        default:
            break
        }
        
        CurrentOperand = deleteZeroOrDecimalPoint(operand: NSDecimalNumber(decimal: calculatorResult).stringValue)
    }
    
    private func addition(a:Decimal!, b:Decimal!) {
        calculatorResult = a + b
    }
    
    private func subtraction(a:Decimal!, b:Decimal!) {
        calculatorResult =  a - b
    }
    
    private func multiplication(a:Decimal!, b:Decimal!) {
        calculatorResult = a * b
    }
    
    private func division(a:Decimal!, b:Decimal!) {
        if(b == 0) {
            calculatorResult = 0
        }
        else {
            calculatorResult = a / b
        }
    }
    
    private func deleteZeroOrDecimalPoint(operand: String) -> String {
        var formatOperand = operand
        
        if(formatOperand.contains(".")) {
            while(formatOperand.last == "0") {formatOperand.removeLast()}
            if(formatOperand.last == ".") {formatOperand.removeLast()}
        }
        
        return formatOperand
    }
    
}
