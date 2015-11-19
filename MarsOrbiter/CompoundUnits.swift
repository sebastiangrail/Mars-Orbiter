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

public struct UnitlessTrait: UnitTrait {
    public typealias BaseTrait = UnitlessTrait
    public static func toBaseUnit () -> Double {
        return 1
    }
    
    public static func abbreviation () -> String {
        return "1"
    }
}

public struct Quotient <T: UnitTrait, U: UnitTrait> : UnitTrait, QuotientType {
    public typealias Numerator = T
    public typealias Denominator = U
    
    public typealias BaseTrait = Quotient<T,U>
    public static func abbreviation() -> String {
        return "\(T.abbreviation())/\(U.abbreviation())"
    }
}

public func reciprocal <T: UnitTrait> (x: Unit<Quotient<UnitlessTrait, T>>) -> Unit<T> {
    return Unit<T>(1/x.value)
}

public func reciprocal <T: UnitTrait, U: UnitTrait> (x: Unit<Quotient<T, U>>) ->  Unit<Quotient<U, T>> {
    return Unit<Quotient<U, T>>(1/x.value)
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
