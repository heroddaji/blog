Simple trick to update your tableView datasource from asynchronous data requests in iOS, Swift
==
I has just working with [Parse SDK](http://parse.com) recently. Parse is a fantastic mobile backend solution, no double about it.
One thing I need to do very often is to fetch the data and update my tableView. Problem is Parse usually fetch data in the background thread, while I need to update UI stuffs in main thread such as:

* stop loading indicator
* Reload my tableView
* Update other views, etc.

and the way I do it is using Swift closure!

for example, in my UITableViewController class, I use [Pull-to-refresh control](https://medium.com/ios-os-x-development/ios-tips-pull-to-refresh-in-less-than-30-seconds-ef884520f0df) to request for my Parse data like this

```Swift

@IBAction func refresh(sender: UIRefreshControl) {
    requestForParseData() //1: get parse data
    updateUI() //2: now I need to udpate my UI after I get Parse data
}

func requestForParseData(completion: ()->()){
    let query = PFQuery(className: String(MyClass))
    query.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
            /// get parse data
    }
}
```

It may seem straightforward, but as you can see, Parse requests are asynchronous, my method **updateUI()** will get executed before the data is retrieved. Now how can I update my UI just after Parse data get returned? I pass a Swift closure name **completion** to method **requestForParseData()** that in-turn will call the **updateUI()** in the **main queue, using dispatch_async feature**, here is the trick:

```Swift
@IBAction func refresh(sender: UIRefreshControl) {
    requestForParseData{ () -> Void in
        updateUI()
    }
}

func requestForParseData(completion: ()->()){
    let query = PFQuery(className: String(MUBeacon))
    query.findObjectsInBackgroundWithBlock { (objects:[PFObject]?, error:NSError?) -> Void in
        dispatch_async(dispatch_get_main_queue(){ () -> Void in
            /// get parse data
            completion() // call this block to execute the updateUI method
        }
    }
}
```

Now all of my UI will get update accordingly as soon as the Parse data is retrieved, very convinient.

That's it, happy coding gals and guys!!!
