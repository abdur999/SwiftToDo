import UIKit

var greeting = "Hello, playground"
class Abc{
    var number1:Int = 0
    
    var number2:Int{
        return 1*2
    }
}
class Pqr:Abc {
//    override var number1:Int = 4 //Its not possible as stored property cannot be overriden
    override var number2:Int {
        return 4
    }
}
let newitem = getOccureceOfCharSimultanously(word:["a","a","a","b","b","b","b","c","c","a","a","a","s","s"])
print(newitem)
func getOccureceOfCharSimultanously(word:[String]) -> String {
    var lastWord=""
    var allWord = ""
    lastWord=word[0]
    var count = 0
    for item in word {
        if lastWord == item {
            count=count+1
        }
        else {
            lastWord = "\(lastWord)\(count)"
            allWord = "\(allWord)\(lastWord)"
            lastWord = item
            count = 1
        }
    }
    lastWord = "\(lastWord)\(count)"
    allWord = "\(allWord)\(lastWord)"

    return allWord
}

//CLOSURE OBJECT CREATION
let closure = Closure()
closure.closure1(){ name in
 print(name)
}
// call the closure
closure.greet()

// closure call
closure.greetUser("Delilah")

// closure call
var result = closure.findSquare(4)

closure.grabLunch(search: {
  print("Alfredo's Pizza: 2 miles away")
})
closure.grabLunch(message:"Let's go out for lunch")  {
      print("Alfredo's Pizza: 2 miles away")
}
closure.grabLunchWithEscaping(message:"Let's go out for lunch"){
    
}
// pass closure without {}
closure.display(greet: print("Hello World!"))

//CLOSURE CLASS DECLARATION
class Closure {
    //Closure with param and return type as Void
    func closure1(name:(String)->Void){
        name("rachita")
    }
    //Closure Variable without parameter and return type
    var greet = {
      print("Hello, World!")
    }
    // closure that accepts one parameter
    let greetUser = { (name: String)  in
        print("Hey there, \(name).")
    }
//    Closure That Returns Value
    var findSquare = { (num: Int) -> (Int) in
      var square = num * num
      return square
    }
//    Closure as function parameter
    func grabLunch(search: () -> ()) {
      // closure call
      search()
    }
//    Trailing Closure
    func grabLunch(message: String, search: ()->()) {
      search()
    }
//  Escaping Closure By default Closure are nonescaping
    func grabLunchWithEscaping(message: String, search: @escaping()->()) {
      search()
    }

//    Here, the @autoclosure automatically adds curly braces.
    func display(greet: @autoclosure () -> ()) {
     greet()
    }
}
//THIS PROTOCOL CAN IMPLEMENT IN STRUCT AS WELL AS CLASS
protocol SampleProtocol { //If we inheri AnyObject protocol then mutating is not needed as inherit AnyObject make the protocl reference type.
    //Reference type can change Without mutating keyword seeBelow
    var tag:String {get set}
    var data:Data{get}
    static var counter:Int{get}
    
    mutating func update(data:Data) -> Bool
    static func incrementCounter()
    init(tag:String, data:Data)
}
//THIS PROTOCOL CAN IMPLEMENT IN CLASS ONLY
protocol SampleProtocolAny:AnyObject {
    var tag:String {get set}
    var data:Data{get}
    static var counter:Int{get}
    
    func update(data:Data) -> Bool
    static func incrementCounter()
    init(tag:String, data:Data)
}
//STRUCT IMPLEMENT Protocol
struct ImplStruct:SampleProtocol{
    var tag: String
    
    var data: Data
    
    static var counter: Int = 0
    
    mutating func update(data: Data) -> Bool {
        self.data = data
        return true
    }
    
    static func incrementCounter() {
        counter+=1
    }
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    
}
//CLASS IMPLEMENT AnyObject Protocol
class ImplStructAny:SampleProtocolAny{
    var tag: String
    
    var data: Data
    
    static var counter: Int = 0
    
    func update(data: Data) -> Bool {
        self.data = data
        return true
    }
    
    static func incrementCounter() {
        counter+=1
    }
    
    required init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    
}


protocol Encryption {
    func xor(key:Int8) -> Self?
}
//If the sorce implementation(source code) is not available still we can add function
extension String:Encryption {
    func xor(key: Int8) -> String? {
        return String(bytes: self.utf8.map{ $0 ^ UInt8(key) }, encoding: .utf8)
    }
}

let source = "Hello World"
let target = source.xor(key: 42)

print("target is :- ")
print(target ?? "failed to encode")
print("target is :- ")
print(42 ?? "failed to decode")


protocol Shape{
    var area:Double{get}
}
struct square:Shape{
    let side:Double
    
    var area: Double{
        return side*side
    }
}
struct Rectangle:Shape{
    let width:Double
    let height:Double
    
    var area: Double{
        return width*height
    }
}
struct Rhombus:Shape{
    let d1:Double
    let d2:Double
    var area: Double{
        return (d1*d2)/2
    }
}
struct Circle:Shape{
    let radius:Double
    var area: Double{
        return 2*(22/7)*radius
    }
}
//create instance of type Solid implementation and assign inside Object of type protocol
//when we call method depend upon type of object object/method execute accordingly
//below object initialize of Rectangle type
let rectangle:Shape = Rectangle(width: 10, height: 20)
print(rectangle.area)

//below object initialize of Square type
let square1:Shape = square(side: 10)
print(square1.area)

//below object initialize of Circle type
let circle:Shape = Circle(radius: 10)
print(circle.area)
