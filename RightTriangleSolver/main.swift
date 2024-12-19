//
//  main.swift
//  RightTriangleSolver
//
//  Created by admin on 9/5/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

var triangleLetterInput : String //store the letter
var tempValue : Double //temporarily store the value

// initialize the measurements
// variables for the angles
var calcAngleA : Double = 0.0
var calcAngleB : Double = 0.0
var calcAngleC : Double = 0.0

// variables for the sides
var calcSideA : Double = 0.0
var calcSideB : Double = 0.0
var calcSideC : Double = 0.0

// side and angle counters
var numOfSides : Int = 0
var numOfAngles : Int = 0
var sideGiven : String = ""

//Boolean variables to use for the CONTROL FLOW
var isRight : Bool = false
var isTriangle : Bool = false

//Amount of each side/angle
var isThreeSides : Bool = false
var isTwoSides : Bool = false
var isOneSide : Bool = false
var isThreeAngles : Bool = false

//if there is a value for each side/angle
var isValueAngleA : Bool = false
var isValueAngleB : Bool = false
var isValueAngleC : Bool = false
var isValueSideA : Bool = false
var isValueSideB : Bool = false
var isValueSideC : Bool = false

//Setup a constant for pi
let pi = 3.14159

print("Welcome to the right triangle solver!")

while((numOfSides + numOfAngles) <= 2){
    if numOfSides + numOfAngles < 3 {
        print("Please enter the type of measurement (s)ide or (a)ngle.")
        triangleLetterInput = readLine()!
        if triangleLetterInput == "s" {
            print("which one (a, b, c)?")
            sideGiven = readLine()!
            switch sideGiven{
            case "a":
                if calcSideA == 0.0 {
                    print("Enter the value for side a:")
                    if let value = Double(readLine()!) {
                        calcSideA = value
                        numOfSides += 1
                    } else {
                        print("Sorry that response is invalid.")
                    }
                }
                
            case "b":
                if calcSideB == 0.0 {
                    print("Enter the value for side b:")
                    if let value = Double(readLine()!) {
                        calcSideB = value
                        numOfSides += 1
                    } else {
                        print("Sorry that response is invalid.")
                    }
                }
                
            case "c":
                if calcSideC == 0.0 {
                    print("Enter the value for side c:")
                    if let value = Double(readLine()!) {
                        calcSideC = value
                        numOfSides += 1
                    } else {
                        print("Sorry that response is invalid.")
                    }
                }
            default:
                print("Input error, run again")
            }
        } else {
        
            print("which one (a, b, c)?")
            var angleGiven = readLine()!
            switch angleGiven{
                
            case "a":
                if calcAngleA == 0.0 {
                    print("Enter the value for angle a (in degrees):")
                    if let value = Double(readLine()!) {
                        if value <= 90.0 {
                            calcAngleA = value
                            numOfAngles += 1
                        }
                    } else {
                        print("Sorry that response is invalid.")
                    }
                }
           
            case "b":
                if calcAngleB == 0.0 {
                    print("Enter the value for angle b (in degrees):")
                    if let value = Double(readLine()!) {
                        if value <= 90.0 {
                            calcAngleB = value
                            numOfAngles += 1
                        }
                    } else {
                        print("Sorry that response is invalid.")
                    }
                }

            case "c":
                if calcAngleC == 0.0 {
                    print("Enter the value for angle c (in degrees):")
                    if let value = Double(readLine()!) {
                        if value <= 90.0 {
                            calcAngleC = value
                            numOfAngles += 1
                        }
                    } else {
                        print("Sorry that response is invalid.")
                    }
                }
            default:
                print("Input error, run again")
            }
        }
    }
}//end for asking for which measurement 

//Determine what type of measurements that you have been given. ie two sides and 1 angle, 3 sides, 2 angles and 1 side
//Note that 3 angles is a failure case, you cannot determine the dimensions of a triangle with 3 angles
//func determineMeasurementType(){
if numOfSides == 3{
    isThreeSides = true
    print("Three sides have been given.")
} else if numOfSides == 2 && numOfAngles == 1 {
    isTwoSides = true
    print("Two sides and one angle have been proivided")
} else if numOfSides == 1 && numOfAngles == 2 {
    isOneSide = true
    print("One side and two angles have been proivided")
} else if numOfAngles == 3 {
    isThreeAngles = true
    print("invalid measurements")
} else {
    print("Error, invalid combination of inputs")
}//end of determining the amount of sides and angles

//Order the sides and angles (make sure that the largest angle is angle C
//func sortForThreeSides() {
if isThreeSides {
    if calcSideA > calcSideB && calcSideA > calcSideC {
        let temp = calcSideA
        calcSideA = calcSideC
        calcSideC = temp
    } else if calcSideB > calcSideA && calcSideB > calcSideC {
        let temp = calcSideB
        calcSideB = calcSideC
        calcSideC = temp
    }
    print("Sides sorted for three sides:")
}// end of sorting for three sides

//func sortForTwoSidesAndOneAngle() {
if isTwoSides {
    if calcAngleA == 90 {
        
        let tempAngle = calcAngleA
        calcAngleA = calcAngleC
        calcAngleC = tempAngle
        
        
        let tempSide = calcSideA
        calcSideA = calcSideC
        calcSideC = tempSide
    } else if calcAngleB == 90 {
        
        let tempAngle = calcAngleB
        calcAngleB = calcAngleC
        calcAngleC = tempAngle
        
        
        let tempSide = calcSideB
        calcSideB = calcSideC
        calcSideC = tempSide
    }
    print("Sorted for two sides and one angle:")
}//end of sorting for two sides

//func sortForOneSide() {
if isOneSide {
    if calcAngleA == 90 {
        
        let tempAngle = calcAngleA
        calcAngleA = calcAngleC
        calcAngleC = tempAngle
        
        let tempSide = calcSideA
        calcSideA = calcSideC
        calcSideC = tempSide
    } else if calcAngleB == 90 {
        
        let tempAngle = calcAngleB
        calcAngleB = calcAngleC
        calcAngleC = tempAngle
        
        let tempSide = calcSideB
        calcSideB = calcSideC
        calcSideC = tempSide
        
    } else if calcAngleC != 90 && calcAngleC != 0 {
        
        if calcAngleA == 0.0 {
            let tempAngle = calcAngleC
            calcAngleC = calcAngleA
            calcAngleA = tempAngle
            
            let tempSide = calcSideC
            calcSideC = calcSideA
            calcSideA = tempSide
        } else if calcAngleB == 0.0 {
            let tempAngle = calcAngleC
            calcAngleC = calcAngleB
            calcAngleB = tempAngle
            
            let tempSide = calcSideC
            calcSideC = calcSideB
            calcSideB = tempSide
        }
    }
    print("Sorted for one side and two angles:")
}//end of sorting for one side

//Determine if the measurements form a triangle
if isThreeSides {
    if calcSideA + calcSideB > calcSideC {
        isTriangle = true
        print("It is a triangle")
    }
} else if isTwoSides || isOneSide {
    if calcAngleA + calcAngleB + calcAngleC < 180 {
        isTriangle = true
        print("It is a triangle")
    }
} else {
    print("It is not a triangle")
}//end of triangle check

//Determine if the measurements form a right triangle
if (isThreeSides){
    if calcSideA * calcSideA + calcSideB * calcSideB == calcSideC * calcSideC {
        print("The triangle is a right triangle")
        isRight = true
    } else {
        print(" The triangle is not a right triangle")
    }
} else if (isTwoSides) {
    if calcAngleC == 90 {
        if calcSideC != 0 {
            if (calcSideC > calcSideB && calcSideC > calcSideA) || calcSideC == 0 {
                print("it is a right triangle")
                isRight = true
            }
        } else {
            isRight = true
        }
    } else if (calcAngleA != 0 && calcAngleB != 0) {
        if (calcSideA != 0 && calcSideB != 0){
            if abs(tan(calcAngleA * pi / 180) - (calcSideA / calcSideB)) < 0.001{
                isRight = true
            }
        } else if (calcSideA != 0 && calcSideC != 0){
            if abs(sin(calcAngleA * pi / 180) - (calcSideA / calcSideC)) < 0.001 {
                isRight = true
            }
        } else if (calcSideB != 0 && calcSideC != 0) {
            if abs(cos(calcAngleA * pi / 180) - (calcSideB / calcSideC)) < 0.001 {
                isRight = true
            }
        } else {
            isRight = false
        }
    } else if (calcAngleB != 0){
        if (calcSideA != 0 && calcSideB != 0) {
            if abs(tan(calcAngleB * pi / 180) - (calcSideA / calcSideB)) < 0.001 {
                isRight = true
            }
        } else if (calcSideA != 0 && calcSideC != 0) {
            if abs(cos(calcAngleB * pi / 180) - (calcSideA / calcSideC)) < 0.001 {
                isRight = true
            }
        } else if (calcSideB != 0 && calcSideC != 0) {
            if abs(sin(calcAngleB * pi / 180) - (calcSideB / calcSideC)) < 0.001 {
                isRight = true
            }
        }
    }
} else if (isOneSide) {
    if (calcAngleC == 90 || calcAngleA + calcAngleB == 90) {
        print("It is a right triangle")
        isRight = true
    } else {
        print ("It is not a right triangle. Try again.")
        isRight = false
    }
}//end of right triangle check

//Determine the remaining measurements based on information provided
if isRight {
    if (isThreeSides) {
        calcAngleC = 90
        calcAngleB = atan(calcSideB / calcSideA) * 180 / pi
        calcAngleA = 90 - calcAngleB
        print("Your triangle has the following measurements:")
        print("a = \(calcSideA) b = \(calcSideB) c = \(calcSideC)")
        print("A = \(calcAngleA) B = \(calcAngleB) C = \(calcAngleC)")
    } else if (isTwoSides) {
        if (calcSideC == 0) {
            calcSideC = sqrt((calcSideA * calcSideA) + (calcSideB * calcSideB))
            calcAngleC = 90
            if calcAngleB == 0 {
                calcAngleB = atan(calcSideB / calcSideA) * 180 / pi
            }
            if calcAngleA == 0 {
                calcAngleA = 90 - calcAngleB
            }
        } else if (calcSideB == 0) {
            calcSideB = sqrt((calcSideC * calcSideC) - (calcSideA * calcSideA))
            calcAngleC = 90
            if calcAngleB == 0 {
                calcAngleB = atan(calcSideB / calcSideA) * 180 / pi
            }
            if calcAngleA == 0 {
                calcAngleA = 90 - calcAngleB
            }
        } else if (calcSideA == 0) {
            calcSideA = sqrt((calcSideC * calcSideC) - (calcSideB * calcSideB))
            calcAngleC = 90
            if calcAngleB == 0 {
                calcAngleB = atan(calcSideB / calcSideA) * 180 / pi
            }
            if calcAngleA == 0 {
                calcAngleA = 90 - calcAngleB
            }
        }
        print("Your triangle has the following measurements:")
        print("a = \(calcSideA) b = \(calcSideB) c = \(calcSideC)")
        print("A = \(calcAngleA) B = \(calcAngleB) C = \(calcAngleC)")
    } else if (isOneSide) {
        if (calcAngleA == 0) {
            calcAngleA = 180 - (calcAngleB + calcAngleC)
        } else if (calcAngleB == 0) {
            calcAngleB = 180 - (calcAngleA + calcAngleC)
        } else {
            calcAngleC = 90
        }
        if (calcSideA == 0 && calcSideB == 0) {
            calcSideA = calcSideC * sin(calcAngleA * pi / 180)
            calcSideB = calcSideC * cos(calcAngleA * pi / 180)
        } else if (calcSideA == 0 && calcSideC == 0) {
            calcSideA = calcSideB / tan(calcAngleB * pi / 180)
            calcSideC = calcSideB / cos(calcAngleB * pi / 180)
        } else if (calcSideB == 0 && calcSideC == 0) {
            calcSideB = calcSideA * tan(calcAngleB * pi / 180)
            calcSideC = calcSideA / cos(calcAngleB * pi / 180)
        }
        print("Your triangle has the following measurements:")
        print("a = \(calcSideA) b = \(calcSideB) c = \(calcSideC)")
        print("A = \(calcAngleA) B = \(calcAngleB) C = \(calcAngleC)")
    } else {
        print("It is not a triangle")
    }
} else {
    print("Not a right triangle")
}//end of solve

