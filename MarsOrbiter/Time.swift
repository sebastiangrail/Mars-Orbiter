//
//  Time.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 9/11/2015.
//  Copyright © 2015 Sebastian Grail. All rights reserved.
//

public struct MillisecondTrait: UnitTrait {
    public typealias BaseTrait = SecondTrait
    public static func toBaseUnit () -> Double {
        return 1/1000
    }
    public static func abbreviation() -> String {
        return "ms"
    }
}

public typealias Seconds = Unit<SecondTrait>
public typealias Second = Seconds
public struct SecondTrait: UnitTrait {
    public typealias BaseTrait = SecondTrait
    public static func toBaseUnit () -> Double {
        return 1
    }
    public static func abbreviation() -> String {
        return "s"
    }
}

public typealias Minutes = Unit<MinuteTrait>
public typealias Minute = Minutes
public struct MinuteTrait: UnitTrait {
    public typealias BaseTrait = SecondTrait
    public static func toBaseUnit () -> Double {
        return 60
    }
    public static func abbreviation() -> String {
        return "min"
    }
}

public typealias Hours = Unit<HourTrait>
public typealias Hour = Hours
public struct HourTrait: UnitTrait {
    public typealias BaseTrait = SecondTrait
    public static func toBaseUnit () -> Double {
        return 60*60
    }
    public static func abbreviation() -> String {
        return "hr"
    }
}