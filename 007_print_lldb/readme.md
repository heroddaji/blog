Few ways to print out the varibales, stack trace in Xcode LLDB console
===
Today I learned that when you set the breakpoint in Xcode, and when you debug at that moment,
you can examine your object variables in the LLDB (bottom right corner),
and some of them are:

### Print our variables
```Swift
fr v <var>
p <expression>
po <var>
dump <var>
```

for example:
```Swift
fr v self.ID
p String(DKBeacon)
po timer
```

this is a nice [Apple document](https://developer.apple.com/library/mac/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-command-examples.html
) for seeing some common debug commands in the LLDB

### See stack trace
Moreover, at any give breakpoint (within your source code), you can print the stack-trace in the LLDB like this
```Swift
p NSThread.callStackSymbols()
```
It is useful when you want to check which datasource or delegate methods that the object calls before your breakpoint.

That's it gals and guys, happy coding
