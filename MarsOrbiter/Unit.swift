//
//  Unit.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 9/11/2015.
//  Copyright © 2015 Sebastian Grail. All rights reserved.
//

public protocol UnitTrait {
    typealias BaseTrait
    typealias Dimension = One
    static func toBaseUnit () -> Double
    static func abbreviation () -> String
}

extension UnitTrait {
    public static func toBaseUnit () -> Double { return 1 }
}

public struct Unit<Trait: UnitTrait> {
    public let value: Double
    
    public init (_ value: Double) {
        self.value = value
    }
}

public extension Unit {
    func to <U: UnitTrait where U.BaseTrait == Trait.BaseTrait, U.Dimension == Trait.Dimension> (type: Unit<U>.Type) -> Unit<U> {
        return Unit<U>(value * Trait.toBaseUnit() / U.toBaseUnit())
    }
    
    func per <T: UnitTrait> (type: Unit<T>.Type) -> Unit<Quotient<Trait, T>> {
        return Unit<Quotient<Trait, T>>(value)
    }
    
    static func per <T: UnitTrait> (type: Unit<T>.Type) -> Unit<Quotient<Trait, T>>.Type {
        return Unit<Quotient<Trait, T>>.self
    }
    
    var squared: Unit<Product<Trait, Trait>> { return  Unit<Product<Trait, Trait>>(value * value) }
}

extension Unit: Equatable {
}

public func == <Trait: UnitTrait> (lhs: Unit<Trait>, rhs: Unit<Trait>) -> Bool {
    return lhs.value == rhs.value
}

extension Unit: CustomStringConvertible {
    public var description: String { return "\(value) \(Trait.abbreviation())" }
}
