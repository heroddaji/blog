Few ways to print out the varibales, stack trace in xcode LLDB console
===
Today I learned that when you set the breakpoint in Xcode, and when you debug at that moment,
you can examine your object variables in the LLDB (bottom right corner)
some of them are:

### Print our variables
```Swift
fr v <var>
p <expression>
po <var>
```

Also, this is a nice [Apple document](https://developer.apple.com/library/mac/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-command-examples.html
) for seeing some common debug command in the LLDB

### See stack trace
Also, at any give breakpoint (within your source code), you can print the stack-trace in the LLDB like this
```Swift
NSThread.callStackSymbols()
```
It is usefull when you want to check which datasource and delegate method the object calls before your breakpoint.

That's it gals and guys, happy coding
