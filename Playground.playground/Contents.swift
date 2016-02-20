//: Playground - noun: a place where people can play

import MarsOrbiter


let speed = Meters(4).per(Second)
let time = Seconds(60)
let distance = speed * time

distance.to(Miles).to(Meters).to(Meters)

speed.to(Kilometers.per(Hour))

let area = Kilometers(1) * Kilometers(1)
area.to(Hectare)

let volume = Meter(2) * Meter(2) * Meter(1)
volume.to(Liter)

Hectare(1).to(Unit<Product<FootTrait, FootTrait>>)

Hectare(0.4).to(Unit<Product<MeterTrait, MeterTrait>>)

Liter(1).to(Imperial.Pint.self)

func derivative (f: Double -> Double) -> Double -> Double {
    let epsilon = 0.0000000001
    return { x in
        let justBefore = f(x-epsilon)
        let justAfter  = f(x+epsilon)
        return (justAfter-justBefore) / (2*epsilon)
    }
}

func derivative <T: UnitTrait, U: UnitTrait> (f: Unit<T> -> Unit<U>) -> Unit<T> -> Unit<Quotient<U, T>> {
    let epsilon = Unit<T>(0.00000001)
    return { x in
        let justBefore = f(x-epsilon)
        let justAfter  = f(x+epsilon)
        return (justAfter-justBefore) / (2*epsilon)
    }
}

func f (x: Second) -> Meter { return Meter(x.value) }
let f_prime = derivative(derivative(f))

