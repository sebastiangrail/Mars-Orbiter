//
//  MultidimensionalUnits.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 20/02/2016.
//  Copyright © 2016 Sebastian Grail. All rights reserved.
//

public enum One {}
public enum Two {}
public enum Three {}

// MARK: - Converting Product<T,T> and 2-dimensional unit with same base as T
public extension Unit where Trait: ProductTraitType, Trait.Left == Trait.Right, Trait.Left.Dimension == One {
    func to <U: UnitTrait where U.BaseTrait == Trait.Left.BaseTrait, U.Dimension == Two>
        (type: Unit<U>.Type) -> Unit<U>
    {
        return Unit<U>(value * Trait.Left.toBaseUnit() * Trait.Left.toBaseUnit() / U.toBaseUnit())
    }
}

public extension Unit where Trait.Dimension == Two {
    func to <U: ProductTraitType where U.Left == U.Right, U.Left.Dimension == One, U.Left.BaseTrait == Trait.BaseTrait>
        (type: Unit<U>.Type) -> Unit<U>
    {
        return Unit<U>(value * Trait.toBaseUnit() / (U.Left.toBaseUnit() * U.Right.toBaseUnit()))
    }
}

public extension Unit
  where Trait: ProductTraitType,
        Trait.Left: ProductTraitType,
        Trait.Left.Left == Trait.Left.Right,
        Trait.Left.Right == Trait.Right,
        Trait.Right.Dimension == One
{
    func to <U: UnitTrait where U.BaseTrait == Trait.Right.BaseTrait, U.Dimension == Three> (type: Unit<U>.Type) -> Unit<U> {
        return Unit<U>(value * Trait.Right.toBaseUnit() * Trait.Right.toBaseUnit()  * Trait.Right.toBaseUnit() / U.toBaseUnit())
    }
}
