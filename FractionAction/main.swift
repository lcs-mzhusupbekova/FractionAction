//
//  main.swift
//  ChipsFastFoodEmporium
//
//  Created by Gordon, Russell on 2018-04-04.
//  Copyright © 2018 Gordon, Russell. All rights reserved.
//

import Foundation

// INPUT
// Collect and filter user input here
var numerator = 0
while 1 == 1 {
    
    // prompt for a numerator
    print("Numerator?")
    
    // check if nil
    guard let givenInput = readLine() else {
        continue
    }
    
    // check if it is a number (Int)
    guard let integerInput = Int(givenInput) else {
        continue
    }
    
    // check if the numerator if non negative
    if integerInput <= 0 {
        continue
    }
    
    // put the numerator in its correct variable and break the loop
    numerator = integerInput
    break
}


// Making a variable for the denominator
var denominator = 0
while 1 == 1 {
    
    // prompt for the denominator
    print("Denominator?")
    
    guard let givenInput = readLine() else {
        continue
    }
    
    // check if it is a number (Int)
    guard let integerInput = Int(givenInput) else {
        continue
    }
    
    // check if the numerator if non negative
    if integerInput < 0 {
        continue
    }
    // put the denominator in its correct variable and break the loop
    denominator = integerInput
    break
}


// PROCESS and OUTPUT:

// Implement the primary logic of the problem here

// Let's get the quotient and the unreduced numerator
let quotient = numerator / denominator // 57 / 10 == 5
let unreducedOutputNumerator = numerator % denominator // 57 % 10 == 7

// If the fraction gives only whole numbers than divide and print the number
// whole number
if unreducedOutputNumerator == 0 {
    print("The result is: \n\(quotient)")
} else {
    
    print("The result is: \n\(quotient) \(unreducedOutputNumerator)/\(denominator)")
    
    // check if numerator is common factor of denominator
    if denominator % unreducedOutputNumerator == 0 {
        
        let fullyReducedNumerator = 1
        let fullyReducedDenominator = denominator/unreducedOutputNumerator
        
        if quotient > 0 {
            print("\(quotient) \(fullyReducedNumerator)/\(fullyReducedDenominator)")
        } else {
            // Don't show the quotiet when it is 0 : 1/2 not 0 1/2
            print("\(fullyReducedNumerator)/\(fullyReducedDenominator)")
        }
        
    } else {
        var gcf = 0 // not the real greatest common factor yet. Takes temporary value of 0
        for possibleFactor in stride(from:  unreducedOutputNumerator / 2, through: 2, by: -1){  // for ex 53/57, 53/2 as higher than a numerator's half, there is no gcf, so it woulg or half or less than half but greater than 1.
            //            by: -1 means if the number isn't factor for n and d, it would be eliminated.
            
            // When the counter variable "possibleFactor" evenly divides into both
            // the unreduced numerator and the  denominator
            // ... we have the GCF
            //
            // e.g.:
            //
            //                      54 % 3 == 0                                  57 % 3 == 0
            if unreducedOutputNumerator % possibleFactor == 0 && denominator % possibleFactor == 0 {
                
                // Now we know that "possibleFactor" is the greatest common factor (GCF)
                gcf = possibleFactor
                break // stop the loop
            }
            
        }
        // Get the parts of the reduced fraction
        let reducedNumerator = unreducedOutputNumerator / gcf
        let reducedDenominator = denominator / gcf
        
        // Print the reduced fraction
        if quotient > 0 {
            print("\(quotient) \(reducedNumerator)/\(reducedDenominator)")
        } else {
            // Don't show the quotiet when it is 0, i.e.: don't print 0 2/3, just print 2/3
            print("\(reducedNumerator)/\(reducedDenominator)")
        }
        
    }
}







