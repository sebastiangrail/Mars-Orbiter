//: Playground - noun: a place where people can play

import MarsOrbiter


let speed = Meters(4).per(Second)
let time = Seconds(60)
let distance = speed * time

distance.to(Miles).to(Meters).to(Meters)

speed.to(Kilometers.per(Hour))


