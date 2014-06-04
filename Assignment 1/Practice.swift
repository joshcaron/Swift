//
//  Practice.swift
//
//
//  Created by Josh Caron on 6/4/14.
//
//  Practice problems located in HtDC for Assignment 1

// Problem 2.4 on page 17
class Automobile {
    var model: String
    var price: Int
    var mileage: Double
    var used: Bool
    
    init(model: String, price: Int, mileage: Double, used: Bool) {
        self.model = model
        self.price = price
        self.mileage = mileage
        self.used = used
    }
}

// Problem 3.1 on page 25
struct Address {
    let number: Int
    let name: String
    let city: String
}

class House {
    let address: Address
    var rooms: Int
    var price: Int
    
    init(address: Address, rooms: Int, price: Int) {
        self.address = address
        self.rooms = rooms
        self.price = price
    }
}

let maple = Address(number: 23, name: "Maple Street", city: "Brookline")
let joye = Address(number: 5, name: "Joye Road", city: "Newton")
let winslow = Address(number: 83, name: "Winslow Road", city: "Waltham")

var ranch = House(address: maple, rooms: 7, price: 375_000)
var colonial = House(address: joye, rooms: 9, price: 450_000)
var cape = House(address: winslow, rooms: 6, price: 235_000)

// Problem 4.4 on page 34
class Account {
    let id: Int
    var name: String
    var balance: Int
    
    init(id: Int, name: String, balance: Int) {
        self.id = id
        self.name = name
        self.balance = balance
    }
}

class Checking: Account {
    var minBalance: Int
    
    init(id: Int, name: String, balance: Int, minBalance: Int) {
        self.minBalance = minBalance
        super.init(id: id, name: name, balance: balance)
    }
}

class Savings: Account {
    var interestRate: Double
    
    init(id: Int, name: String, balance: Int, interestRate: Double) {
        self.interestRate = interestRate
        super.init(id: id, name: name, balance: balance)
    }
}

// I'm having problems with NSDate while coding in the REPL Playground,
// so I'm working around it with this silly little structure
struct SimpleDate {
    let day: Int
    let month: Int
    let year: Int
}

class CertificateOfDeposit: Account {
    var interestRate: Double
    var maturityDate: SimpleDate // Why build a new struct when this already exists?
    
    init(id: Int, name: String, balance: Int, interestRate: Double, maturityDate: SimpleDate) {
        self.interestRate = interestRate
        self.maturityDate = maturityDate
        super.init(id: id, name: name, balance: balance)
    }
}

var earl = Checking(id: 1729, name: "Earl Gray", balance: 1250, minBalance: 500)
var ima = CertificateOfDeposit(id: 4104, name: "Ima Flatt", balance: 10123, interestRate: 4.0, maturityDate: SimpleDate(day: 1, month: 6, year: 2005))
var annie = Savings(id: 2992, name: "Annie Proulx", balance: 800, interestRate: 3.5)


// Problem 5.3 on page 43
// Ignoring

// Problem 10.6 on page 102
class Image {
    var width: Int
    var height: Int
    var source: String
    
    init(width: Int, height: Int, source: String) {
        self.width = width
        self.height = height
        self.source = source
    }
    
    func sizeString() -> String {
        let area = width * height
        if area <= 10_000 {
            return "small"
        } else if area > 10_000 && area <= 1_000_000 {
            return "medium"
        } else {
            return "large"
        }
    }
}


// Problem 11.2 on page 113
struct TemperatureRange {
    var high: Int
    var low: Int
}

class WeatherRecord {
    let date: SimpleDate
    let today: TemperatureRange
    let normal: TemperatureRange
    let record: TemperatureRange
    let precipitation: Double
    
    init(date: SimpleDate, today: TemperatureRange, normal: TemperatureRange, record: TemperatureRange, precipitation: Double) {
        self.date = date
        self.today = today
        self.normal = normal
        self.record = record
        self.precipitation = precipitation
    }
    
    func withinRange() -> Bool {
        return today.low >= normal.low && today.high <= normal.high
    }
    
    func rainyDay(amount: Double) -> Bool {
        return precipitation > amount
    }
    
    func recordDay() -> Bool {
        return today.low < record.low || today.high > record.high
    }
}


// Problem 12.1 on page 125
// Do later, too much effort

// Problem 14.7 on page 140

class GroceryItem {
    let brandName: String
    let weight: Double
    let price: Double
    
    var unitPrice: Double {
    return price / weight
    }
    
    init(brandName: String, weight: Double, price: Double) {
        self.brandName = brandName
        self.weight = weight
        self.price = price
    }
    
    func lowerUnitPrice(amount: Double) -> Bool {
        return self.unitPrice < amount
    }
    
    func cheaperThan(other: GroceryItem) -> Bool {
        return self.lowerUnitPrice(other.unitPrice)
    }
}

class IceCream: GroceryItem {
    let flavor: String
    
    init(brandName: String, weight: Double, price: Double, flavor: String) {
        self.flavor = flavor
        super.init(brandName: brandName, weight: weight, price: price)
    }
}

enum CoffeeType {
    case Regular
    case Decaffeinated
}

class Coffee: GroceryItem {
    let type: CoffeeType
    
    init(brandName: String, weight: Double, price: Double, type: CoffeeType) {
        self.type = type
        super.init(brandName: brandName, weight: weight, price: price)
    }
}

enum JuiceState {
    case Frozen
    case Fresh
    case Bottled
    case Canned
}

class Juice: GroceryItem {
    let flavor: String
    let state: JuiceState
    
    init(brandName: String, weight: Double, price: Double, flavor: String, state: JuiceState) {
        self.flavor = flavor
        self.state = state
        super.init(brandName: brandName, weight: weight, price: price)
    }
}
