//
//  Area.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 20/02/2016.
//  Copyright © 2016 Sebastian Grail. All rights reserved.
//

public typealias Are = Unit<AreTrait>
public struct AreTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public typealias Dimension = Two
    public static func toBaseUnit () -> Double {
        return 100
    }
    public static func abbreviation() -> String {
        return "a"
    }
}

public typealias Hectare = Unit<HectareTrait>
public struct HectareTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public typealias Dimension = Two
    public static func toBaseUnit () -> Double {
        return 10_000
    }
    public static func abbreviation() -> String {
        return "ha"
    }
}

public typealias Acre = Unit<AcreTrait>
public struct AcreTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public typealias Dimension = Two
    public static func toBaseUnit () -> Double {
        return 4_046.8564224
    }
    public static func abbreviation() -> String {
        return "ac"
    }
}
