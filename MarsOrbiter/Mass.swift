//
//  Mass.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 20/02/2016.
//  Copyright © 2016 Sebastian Grail. All rights reserved.
//

public typealias Gram = Unit<GramTrait>
public typealias Grams = Gram
public struct GramTrait: UnitTrait {
    public typealias BaseTrait = GramTrait
    public static func toBaseUnit () -> Double {
        return 1
    }
    
    public static func abbreviation() -> String {
        return "g"
    }
}

public typealias Kilogram = Unit<KilogramTrait>
public typealias Kilograms = Kilogram
public struct KilogramTrait: UnitTrait {
    public typealias BaseTrait = GramTrait
    public static func toBaseUnit () -> Double {
        return 1000
    }
    
    public static func abbreviation() -> String {
        return "kg"
    }
}

public typealias Milligram = Unit<MilligramTrait>
public typealias Milligrams = Milligram
public struct MilligramTrait: UnitTrait {
    public typealias BaseTrait = GramTrait
    public static func toBaseUnit () -> Double {
        return 1/1000
    }
    
    public static func abbreviation() -> String {
        return "mg"
    }
}

public typealias Tonne = Unit<TonneTrait>
public typealias Tonnes = Tonne
public typealias Ton = Tonne
public struct TonneTrait: UnitTrait {
    public typealias BaseTrait = GramTrait
    public static func toBaseUnit () -> Double {
        return 1000*1000
    }
    
    public static func abbreviation() -> String {
        return "t"
    }
}

public typealias Pound = Unit<PoundTrait>
public typealias Pounds = Pound
public struct PoundTrait: UnitTrait {
    public typealias BaseTrait = GramTrait
    public static func toBaseUnit () -> Double {
        return 453.592
    }
    
    public static func abbreviation() -> String {
        return "lb"
    }
}
