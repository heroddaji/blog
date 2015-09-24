Singleton pattern in Swift 2
==

Today I worked on a utility class that acts as a Data storage for my model classes.

First I made all of its method to be class methods, but soon I realized I need to initialize some variables before the class methods can bed use 🐷... Hmm, as that moment, I thought this is a good candidate for a Singleton class.

And it is not difficult to make a Singleton class in Swift 2, this sample code show you how to do it

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
