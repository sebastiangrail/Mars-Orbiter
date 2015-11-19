//
//  MarsOrbiterTests.swift
//  MarsOrbiterTests
//
//  Created by Sebastian Grail on 9/11/2015.
//  Copyright © 2015 Sebastian Grail. All rights reserved.
//

import Quick
import Nimble
import MarsOrbiter

private func haveType <T> (type: T.Type) -> Nimble.MatcherFunc<T> {
    return MatcherFunc { actualExpression, failureMessage in
        do {
            if let _ = try actualExpression.evaluate() {
                return true // types always match
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}

private struct TestTraitA: UnitTrait {
    typealias BaseTrait = TestTraitA
    
    static func toBaseUnit () -> Double { return 1 }
    static func abbreviation() -> String { return "" }
}

// MARK: - Unit conversion
class UnitConversionSpec: QuickSpec {
    override func spec() {
        describe("Conversion of units") {
            it("succeeds if the BaseTraits match") {
                expect(Meters(100).to(Kilometers)).to(equal(Kilometers(0.1)))
            }
        }
    }
}

// MARK: - Addition
class AdditionSpec: QuickSpec {
    override func spec() {
        describe("addition") {
            describe("T + T") {
                it("is T") {
                    expect(Meter(1) + Meter(2)).to(haveType(Meter))
                }
            }
        }
    }
}

// MARK: - Subtraction
class Subtraction: QuickSpec {
    override func spec() {
        describe("subtraction") {
            describe("T - T") {
                it("is T") {
                    expect(Meter(1) - Meter(2)).to(haveType(Meter))
                }
            }
        }
    }
}

// MARK: - Multiplication
class MultiplicationSpec: QuickSpec {
    override func spec() {
        describe("multiplication") {
            describe("T * Double") {
                it("is T") {
                    expect(Meters(1) * 10).to(haveType(Meter))
                }
            }
            
            describe("Double * T") {
                it("is T") {
                    expect(10 * Meters(1)).to(haveType(Meter))
                }
            }
            
            describe("T * U") {
                it("is Product<T,U>") {
                    expect(Meters(1) * Second(1)).to(haveType(Unit<Product<MeterTrait, SecondTrait>>))
                }
            }
            
            describe("(T/U) * U") {
                it("is T") {
                    let quotient = Meter(1).per(Second)
                    expect(quotient * Second(1)).to(haveType(Meter))
                }
            }
            
            describe("U * (T/U)") {
                it("is T") {
                    let quotient = Meter(1).per(Second)
                    expect(Second(1) * quotient).to(haveType(Meter))
                }
            }
            
            describe("(T/U) * (U/T)") {
                it("is unitless") {
                    let left = Meter(1).per(Second)
                    let right = Second(1).per(Meter)
                    expect(left * right).to(haveType(Double))
                }
            }
        }
    }
}

// MARK: - Division
class DivisionSpec: QuickSpec {
    override func spec() {
        
        describe("value construction via Unit.per") {
            it("constructs a quotient") {
                expect(Meters(1).per(Second)).to(haveType(Unit<Quotient<MeterTrait, SecondTrait>>))
            }
        }
        
        describe("reciprocal") {
            describe("reciprocal of T/U") {
                it("is U/T") {
                    expect(reciprocal(Meter(1).per(Second))).to(haveType(Unit<Quotient<SecondTrait, MeterTrait>>))
                }
            }
            
            describe("reciprocal of Unitless/T") {
                it("is T") {
                    let x = Unit<Quotient<UnitlessTrait, MeterTrait>>(1)
                    expect(reciprocal(x)).to(haveType(Meter))
                }
            }
        }
        
        describe("T/U") {
            it("is Quotient<T,U>") {
                expect(Meter(1) / Second(1)).to(haveType(Unit<Quotient<MeterTrait, SecondTrait>>))
            }
        }
        
        describe("T/T") {
            it("is Double") {
                expect(Meters(1) / Meters(2)).to(haveType(Double))
            }
        }
        
        describe("(T/U) / T = unitless/u") {
            it("is 1/U") {
                expect(Meter(1).per(Second) / Meter(1)).to(haveType(Unit<Quotient<UnitlessTrait, SecondTrait>>))
            }
        }
        
        describe("T / (T/U)") {
            it("is U") {
                expect(Meter(1) / Meter(1).per(Second)).to(haveType(Second))
            }
        }
        
    }
}
