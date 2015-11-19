//
//  Operators.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 20/02/2016.
//  Copyright © 2016 Sebastian Grail. All rights reserved.
//


// MARK: - Addition
public func + <Trait: UnitTrait> (lhs: Unit<Trait>, rhs: Unit<Trait>) -> Unit<Trait> {
    return Unit<Trait>(lhs.value + rhs.value)
}


// MARK: - Subtraction
public func - <Trait: UnitTrait> (lhs: Unit<Trait>, rhs: Unit<Trait>) -> Unit<Trait> {
    return Unit<Trait>(lhs.value - rhs.value)
}


// MARK: - Multiplication

// T * Double = T
public func * <T: UnitTrait> (lhs: Unit<T>, rhs: Double) -> Unit<T> {
    return Unit<T>(lhs.value * rhs)
}

// Double * T = T
public func * <T: UnitTrait> (lhs: Double, rhs: Unit<T>) ->Unit<T> {
    return Unit<T>(lhs * rhs.value)
}

// T * U = Product<T,U>
public func * <Trait1: UnitTrait, Trait2: UnitTrait> (lhs: Unit<Trait1>, rhs: Unit<Trait2>) -> Unit<Product<Trait1, Trait2>> {
    return Unit<Product<Trait1, Trait2>>(lhs.value * rhs.value)
}

// (T/U) * U = T
public func * <T: UnitTrait, U: UnitTrait> (lhs: Unit<Quotient<T,U>>, rhs: Unit<U>) -> Unit<T> {
    return Unit<T>(lhs.value * rhs.value)
}

// U * (T/U) = T
public func * <T: UnitTrait, U: UnitTrait> (lhs: Unit<U>, rhs: Unit<Quotient<T,U>>) -> Unit<T> {
    return rhs*lhs
}

// (T/U) * (U/T) = Double
public func * <T: UnitTrait, U: UnitTrait>  (lhs: Unit<Quotient<T,U>>, rhs: Unit<Quotient<U,T>>) -> Double {
    return lhs.value * rhs.value
}


// MARK: - Division

// U / U = Double
public func / <T: UnitTrait> (lhs: Unit<T>, rhs: Unit<T>) -> Double {
    return lhs.value / rhs.value
}

// T / U = Quotient<T,U>
public func / <Trait1: UnitTrait, Trait2: UnitTrait> (lhs: Unit<Trait1>, rhs: Unit<Trait2>) -> Unit<Quotient<Trait1, Trait2>> {
    return Unit<Quotient<Trait1, Trait2>>(lhs.value / rhs.value)
}

// (T/U) / T = Quotient<Unitless, U>
public func / <Trait1: UnitTrait, Trait2: UnitTrait> (lhs: Unit<Quotient<Trait1, Trait2>>, rhs: Unit<Trait1>) -> Unit<Quotient<UnitlessTrait, Trait2>> {
    return Unit<Quotient<UnitlessTrait, Trait2>>(lhs.value / rhs.value)
}

// T / (T/U) = T * (U/T) = U
public func / <Trait1: UnitTrait, Trait2: UnitTrait> (lhs: Unit<Trait1>, rhs: Unit<Quotient<Trait1, Trait2>>) -> Unit<Trait2> {
    return Unit<Trait2>(lhs.value / rhs.value)
}









