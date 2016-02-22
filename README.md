On December 11, 1998, NASA launched the Mars Climate Orbiter. About nine months later the spacecraft reached Mars, but due to ground-based computer software which produced output in pound-seconds instead of newton-seconds, the spacecraft encountered Mars on a wrong trajectory and disintegrated. The project costs were over $300 million.

## Types in Swift

Swift has a strong, static type system which prevents us from using e.g. `String` where `NSURL` is expected. This eliminates an entire classes of bugs. But even in Swift, numbers generally don't have a unit. If a function takes an `NSTimeInteval` we can pass in a `Double` that was returned by a function that calculates speed in miles per hour.

 
Mars Orbiter is a framework that provides lightweight wrappers around `Double` to add units of measurement to Swift. Some units like `Meter` or `Second` are provided, but it easy to add your own custom units. Units can be combined into fractions and products and units of the same kind can be converted (e.g. from meters per second to miles per hour).

## Features

- Type safe units with type safe operations
  - Type safe addition and subtraction: 10 meters + 5 meters = 15 meters
  - Type safe multiplication: 10 (meters/second) * 2 seconds = 20 meters
  - Type safe division: 60 meters / 2 second = 30 meters / second
- Automatic simplification: 10 (meter*meter) / 2 meters = 5 meters
- Explicit conversion between compatible units: 2 hectare to (meter*meter)
- No implicit conversion
- Pure Swift, currently Mac and iOS support

## Usage

To create a new value, simply instantiate the appropriate `Unit`
```
let distance = Kilometer(25)
let duration = Minute(40)
```

Use `+` and `-` to add to or subtract from the value, note that the units must match exactly
```
let totalDistance = distance + Kilometer(5)
let totalDuration = duration - Minute(10)
```

Use `*` and `/` to multiply and subtract values, use `to` to convert between units
```
let speed = (totalDistance / totalDuration).to(Unit<Quotient<Kilometer, Hour>>)
let distancePerHour = speed * Hour(1)
```

## Creating  units

A unit is defined by specializing the generic `Unit` type with a struct conforming to `UnitTrait`. The built in type `Meter` is defined as follows:

```swift
public struct MeterTrait: UnitTrait {
    public typealias Dimension = One
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

The `BaseTrait` typealias defines the base unit to use for conversion. `toBaseUnit()` returns the quantity in base unit.
`abbreviation` returns a human readable abbreviation of the unit. The `Dimension` typealias adds support for multidimensional
units (e.g. liters) that can be converted to their compound conunterparts (e.g. liters to cubic meters)

Your own units will play along nicely with existing units:
```
public struct SmootTrait: UnitTrait {
   ...
   public typealias BaseTrait = MeterTrait
   ...
}
public typealias Smoot = Unit<SmootTrait>

let x = Smoot(5).per(Second) // has type Quotient<Smoot, Second>
```

## Bugs and Feature Requests

Unit simplification is implemented using functions overloaded by the argument type. This needs to be done for every unit combination.
If you get and unexpected type as the result of an operation, please submit a pull request or file [an issue on github](https://github.com/sebastiangrail/Mars-Orbiter/issues).
