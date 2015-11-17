//
//  CompoundUnits.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 10/11/2015.
//  Copyright © 2015 Sebastian Grail. All rights reserved.
//

public func square <T: UnitTrait> (type: Unit<T>) -> Unit<Product<T, T>>.Type {
    return Unit<Product<T, T>>.self
}

public protocol QuotientType {
    typealias Numerator: UnitTrait
    typealias Denominator: UnitTrait
}

public struct Quotient <T: UnitTrait, U: UnitTrait> : UnitTrait, QuotientType {
    public typealias Numerator = T
    public typealias Denominator = U
    
    public typealias BaseTrait = Quotient<T,U>
    public static func abbreviation() -> String {
        return "\(T.abbreviation())/\(U.abbreviation())"
    }
}

public extension Unit where Trait: QuotientType {
    func to <U: protocol<UnitTrait, QuotientType> where U.Numerator.BaseTrait == Trait.Numerator.BaseTrait, U.Denominator.BaseTrait == Trait.Denominator.BaseTrait> (type: Unit<U>.Type) -> Unit<U> {
        let ownBaseFactor = Trait.Numerator.toBaseUnit() / Trait.Denominator.toBaseUnit()
        let otherBaseFactor = U.Numerator.toBaseUnit() / U.Denominator.toBaseUnit()
        return Unit<U>(value * ownBaseFactor / otherBaseFactor)
    }
    
}

public struct Product <T: UnitTrait, U: UnitTrait> : UnitTrait {
    public typealias BaseTrait = Product<T,U>
    public static func abbreviation() -> String {
        return "\(T.abbreviation())*\(U.abbreviation())"
    }
}

func * <Trait1: UnitTrait, Trait2: UnitTrait> (lhs: Unit<Trait1>, rhs: Unit<Trait2>) -> Unit<Product<Trait1, Trait2>> {
    return Unit<Product<Trait1, Trait2>>(lhs.value * rhs.value)
}

func / <Trait1: UnitTrait, Trait2: UnitTrait> (lhs: Unit<Trait1>, rhs: Unit<Trait2>) -> Unit<Quotient<Trait1, Trait2>> {
    return Unit<Quotient<Trait1, Trait2>>(lhs.value / rhs.value)
}

// u/u = unitless
public func / <T: UnitTrait> (lhs: Unit<T>, rhs: Unit<T>) -> Double {
    return lhs.value / rhs.value
}

// (t/u)*u = t
public func * <T: UnitTrait, U: UnitTrait> (lhs: Unit<Quotient<T,U>>, rhs: Unit<U>) -> Unit<T> {
    return Unit<T>(lhs.value * rhs.value)
}

// scalar multiplication
public func * <T: UnitTrait> (lhs: Unit<T>, rhs: Double) -> Unit<T> {
    return Unit<T>(lhs.value * rhs)
}

public func * <T: UnitTrait> (lhs: Double, rhs: Unit<T>) ->Unit<T> {
    return Unit<T>(lhs * rhs.value)
}
