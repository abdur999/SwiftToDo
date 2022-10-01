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


protocol Taggable {
    var tag:String {get}
    var data:Data{get}
    init(tag:String,data:Data)
}
protocol TaggPersistable:Taggable,CustomStringConvertible, Equatable {
    init(tag:String,contentsOf url:URL) throws
    func persist(to url:URL) throws
}
protocol TaggedEncodable:Taggable{
    var base64:String{get}
}

//WE can inheri at here using clone but instead of doing that way if we do it using the way of extension the code will be
//more readable
struct MyData {
    var tag: String
    
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag=tag
        self.data = data
    }
    
}
extension MyData:CustomStringConvertible{
    var description: String{
        return "Mydata\(tag)"
    }
}
extension MyData:TaggedEncodable{
    var base64: String {
        self.data.base64EncodedString()
    }
}
extension MyData:TaggPersistable{
    init(tag: String, contentsOf url: URL) throws {
        let data = try Data.init(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}

private class AmazonSevice:Service{
    var totalProfit: Float{
        return balance
    }

    func add(amount:Float) {
        balance = balance+amount
    }
    
    private var balance:Float = 0
    public init(){}
   
}
private class EtsySevice:Service{

    var totalProfit: Float{
        return balance
    }
    
    func add(amount:Float) {
        balance = balance+amount
    }
    private var balance:Float = 0
    public init(){}
    
}
protocol Service{
    var totalProfit:Float{get}
    func add(amount:Float)
}
//Controller will create object of type based on Service
//eg, if another kind of object need to add, we need to add another case in enum and implement protocol on that class/struct
class PaymentController {
    let services:[Service]
    init(services:[Service]){
        self.services=services
    }
    func calculateEarnings() -> Float {
        services.reduce(0){$0+$1.totalProfit}
    }
}

//BASED on service type set Service Type
//eg, if another kind of object need to add, we need to add another case
public enum ServiceType{
    case amazon
    case etsy
}
//Factory method for craete object
func makeService(service:ServiceType) -> Service{
    switch(service){
    case .amazon:
        return AmazonSevice()
    case .etsy:
        return EtsySevice()
    }
    
}

let amazonService = makeService(service:.amazon)
let etsyService = makeService(service:.etsy)
let controller = PaymentController(services: [amazonService,etsyService])
amazonService.add(amount:100)
etsyService.add(amount:100)
amazonService.add(amount:50)
print("Total Earned \(controller.calculateEarnings())")

//any type can conform to protocol
//can be adopted by class or struct

//Generic are deeply rooted in swift
//Protocol and generics walk hand in hand
//Swift collection types show how protocol and generics work together

func equals<T:Equatable>(lhs:T,rhs:T) -> Bool{
    return lhs == rhs
}

print(equals(lhs: 10.5, rhs: 10.55))
print(equals(lhs: 10, rhs: 10))
print(equals(lhs: "Abdur", rhs: "Abdur"))

//Any type can take input anytype data
//the class can hold anytype data
struct Wrapper<T> {
    var storage:T
    init(_ value:T){
        storage = value
    }
}

let dWrap = Wrapper(20.0)
let sWrap = Wrapper("20.0")
let iWrap = Wrapper(20)

//Associatedtype can hold anytype
//Data can be of anytype
protocol TaggableType{
    associatedtype Content
    var tag:String{get}
    var data:Content{get}
    init(tag:String,data:Content)
}
//here Data is type Double
struct TaggedDouble:TaggableType{
    var tag:String
    var data:Double
}
//here Data is type String
struct TaggedString:TaggableType{
    var tag:String
    var data:String
}
//here Data is type Int
struct TaggedInt:TaggableType{
    var tag:String
    var data:Int
}

//implement generic stack Protocol
public protocol StackProtocol{
    associatedtype E
    var count:Int{get}
    var isEmpty:Bool{get}
    func peek() -> E?
    mutating func push(_ item:E)
    mutating func pop() -> E?
}
//implement generic stack Struct
struct Stack<T>: StackProtocol {
    private var storage = [T]()
    mutating func push(_ item:T){
        storage.append(item)
    }
    mutating func pop() -> T?{
        return storage.popLast()
    }
    public func peek() -> T? {
        return storage.last
    }
    public var count: Int{return storage.count}
    public var isEmpty: Bool{return storage.isEmpty}
    
    
}


var stringStack = Stack<String>()
stringStack.push("apple")
stringStack.push("banana")
stringStack.push("cucumber")
stringStack.push("Dry fruit")
stringStack.push("fig")
stringStack.push("grapes")
stringStack.push("hug")
print(stringStack.pop())
print(stringStack.peek())
print(stringStack.pop())

//Error can be of type Custom
public enum WebserviceErrro:Error{
    case invalidURL(String)
    case inavalidPayload(URL)
    case forwordError(Error)
}
