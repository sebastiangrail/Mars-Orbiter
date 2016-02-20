//
//  Volume.swift
//  MarsOrbiter
//
//  Created by Sebastian Grail on 20/02/2016.
//  Copyright © 2016 Sebastian Grail. All rights reserved.
//

public typealias Liter = Unit<LiterTrait>
public struct LiterTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public typealias Dimension = Three
    public static func toBaseUnit () -> Double {
        return 0.001
    }
    public static func abbreviation() -> String {
        return "l"
    }
}

public struct Imperial {
    public typealias Pint = Unit<PintTrait>
    public struct PintTrait: UnitTrait {
        public typealias BaseTrait = MeterTrait
        public typealias Dimension = Three
        public static func toBaseUnit () -> Double {
            return 0.000568261
        }
        public static func abbreviation() -> String {
            return "imp pt"
        }
    }
    
    public typealias Quart = Unit<QuartTrait>
    public struct QuartTrait: UnitTrait {
        public typealias BaseTrait = MeterTrait
        public typealias Dimension = Three
        public static func toBaseUnit () -> Double {
            return 0.00113652
        }
        public static func abbreviation() -> String {
            return "imp qt"
        }
    }
    
    public typealias Gallon = Unit<GallonTrait>
    public struct GallonTrait: UnitTrait {
        public typealias BaseTrait = MeterTrait
        public typealias Dimension = Three
        public static func toBaseUnit () -> Double {
            return 0.00454609
        }
        public static func abbreviation() -> String {
            return "imp gal"
        }
    }
}

public struct USLiquid {
    public typealias Pint = Unit<PintTrait>
    public struct PintTrait: UnitTrait {
        public typealias BaseTrait = MeterTrait
        public typealias Dimension = Three
        public static func toBaseUnit () -> Double {
            return 0.000473176
        }
        public static func abbreviation() -> String {
            return "imp pt"
        }
    }
    
    public typealias Quart = Unit<QuartTrait>
    public struct QuartTrait: UnitTrait {
        public typealias BaseTrait = MeterTrait
        public typealias Dimension = Three
        public static func toBaseUnit () -> Double {
            return 0.000946353
        }
        public static func abbreviation() -> String {
            return "imp qt"
        }
    }
    
    public typealias Gallon = Unit<GallonTrait>
    public struct GallonTrait: UnitTrait {
        public typealias BaseTrait = MeterTrait
        public typealias Dimension = Three
        public static func toBaseUnit () -> Double {
            return 0.00378541
        }
        public static func abbreviation() -> String {
            return "imp gal"
        }
    }
}

public typealias FluidOunce = Unit<FluidOunceTrait>
public struct FluidOunceTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public typealias Dimension = Three
    public static func toBaseUnit () -> Double {
        return 2.95735e-5
    }
    public static func abbreviation() -> String {
        return "imp gal"
    }
}
