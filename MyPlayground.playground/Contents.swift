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


let myClass = Myclass()
myClass.closure1(){ name in
 print(name)
}
// call the closure
myClass.greet()

// closure call
myClass.greetUser("Delilah")

// closure call
var result = myClass.findSquare(4)

myClass.grabLunch(search: {
  print("Alfredo's Pizza: 2 miles away")
})
myClass.grabLunch(message:"Let's go out for lunch")  {
      print("Alfredo's Pizza: 2 miles away")
}
myClass.grabLunchWithEscaping(message:"Let's go out for lunch"){
    
}
// pass closure without {}
myClass.display(greet: print("Hello World!"))

class Myclass {
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
