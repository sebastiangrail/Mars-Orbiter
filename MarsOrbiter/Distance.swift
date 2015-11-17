//
//  Distance.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 9/11/2015.
//  Copyright © 2015 Sebastian Grail. All rights reserved.
//

// Mark: Metric

public typealias Meters = Unit<MeterTrait>
public typealias Meter = Meters
public struct MeterTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public static func toBaseUnit () -> Double {
        return 1
    }
    public static func abbreviation() -> String {
        return "m"
    }
}

public typealias Millimeters = Unit<MillimeterTrait>
public typealias Millimeter = Millimeters
public struct MillimeterTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public static func toBaseUnit () -> Double {
        return 1/1000
    }
    public static func abbreviation() -> String {
        return "mm"
    }
}

public typealias Centimeters = Unit<CentimetersTrait>
public typealias Centimeter = Centimeters
public struct CentimetersTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public static func toBaseUnit () -> Double {
        return 1/100
    }
    public static func abbreviation() -> String {
        return "cm"
    }
}

public typealias Kilometers = Unit<KilometerTrait>
public typealias Kilometer = Kilometers
public struct KilometerTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public static func toBaseUnit () -> Double {
        return 1000
    }
    public static func abbreviation() -> String {
        return "km"
    }
}


// Mark: Imperial

public typealias Inches = Unit<InchTrait>
public typealias Inch = Inches
public struct InchTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public static func toBaseUnit () -> Double {
        return 0.0254
    }
    public static func abbreviation() -> String {
        return "in"
    }
}

public typealias Feet = Unit<FootTrait>
public typealias Foot = Feet
public struct FootTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public static func toBaseUnit () -> Double {
        return 0.3048
    }
    public static func abbreviation() -> String {
        return "ft"
    }
}

public typealias Miles = Unit<MileTrait>
public typealias Mile = Miles
public struct MileTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public static func toBaseUnit () -> Double {
        return 1609.344
    }
    public static func abbreviation() -> String {
        return "miles"
    }
}
