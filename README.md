On December 11, 1998, NASA launched the Mars Climate Orbiter. About nine months later the spacecraft reached Mars, but due to ground-based computer software which produced output in pound-seconds instead of newton-seconds, the spacecraft encountered Mars on a wrong trajectory and disintegrated. The project costs were over $300 million.

## Types in Swift

Swift has a strong, static type system which prevents us from using e.g. `String` where `NSURL` is expected. This eliminates an entire classes of bugs. But even in Swift, numbers generally don't have a unit. If a function takes an `NSTimeInteval` we can pass in a `Double` that was returned by a function that calculates speed in miles per hour.

 
Mars Orbiter is a framework that provides lightweight wrappers around `Double` to add units of measurement to Swift. Some units like `Meter` or `Second` are provided, but it easy to add your own custom units. Units can be combined into fractions and products and units of the same kind can be converted (e.g. from meters per second to miles per hour).


## Creating  units

A unit is defined by specializing the generic `Unit` type with a struct conforming to `UnitTrait`. The built in type `Meter` is defined as follows:

```swift
public struct MeterTrait: UnitTrait {
    public typealias BaseTrait = MeterTrait
    public static func toBaseUnit () -> Double {
        return 1
    }
    public static func abbreviation() -> String {
        return "m"
    }
}

public typealias Meters = Unit<MeterTrait>
```

The `BaseTrait` typealias defines the base unit to use for conversion. `toBaseUnit()` returns the quantity in base unit. `abbreviation` returns a human readable abbreviation of the unit.