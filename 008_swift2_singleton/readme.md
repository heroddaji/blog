Singleton pattern in Swift 2
==

Today I work on a utility class that act as a Data storage to for my model.

First I make all of its method to be class methods, but soon I realize I need to initialize some value before the class methods can bed used... Hmm, as that moment, I think this is a good candidate for a Singleton class.

And it is not difficult to make a Singleton class in Swift 2, this sample code show you how you can do it

```Swift
class MySingleton{
    static private var mySelf:MySingleton!

    static var sharedInstance {
        get{
            if myself == nil{
                myself = MySingleton()
            }
            return myself
        }
    }

    func method1(){
        //define your functions here
    }
}
```

That is it, now you have a Singleton class, now you can simply call like this to access it
```Swift
MySingleton.sharedInstance.method1()
```

Happy coding gals and guys!
