## Get Class name String and finding hidden/private methods in Swift standard lib

I sometime need to get the class name String, but I don't want to type it manually. And in current Swift 2.0, this trick will help you:

you can read more about these interesting stuffs in [Stack Overflow here](http://stackoverflow.com/questions/27912078/where-are-stdlib-gettypename-stdlib-getdemangledtypename-declared)

## Get Class name String
```
_stdlib_getDemangledTypeName(MyClass())
```
Example:
```
class Dai(){} //declare a class
_stdlib_getDemangledTypeName(Dai()) //must init the class
//output is "Dai"

```

## Find private method from Swift standard lib
Go to your console, and type as the following:
```
cd `xcode-select -p`/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/macosx
nm -a libswiftCore.dylib | grep "T _swift_stdlib"
```

you will see the result as something like this
```
000000000015dc40 T _swift_stdlib_CFSetGetValues
000000000015d9f0 T _swift_stdlib_NSObject_isEqual
000000000015dad0 T _swift_stdlib_NSStringASCIIHashValue
000000000015db00 T _swift_stdlib_NSStringHasPrefixNFD
000000000015db60 T _swift_stdlib_NSStringHasSuffixNFD
000000000015dbc0 T _swift_stdlib_NSStringLowercaseString
000000000015da90 T _swift_stdlib_NSStringNFDHashValue
000000000015dc00 T _swift_stdlib_NSStringUppercaseString
000000000015aa30 T _swift_stdlib_atomicCompareExchangeStrongPtr
000000000015aa50 T _swift_stdlib_atomicCompareExchangeStrongUInt32
000000000015aa60 T _swift_stdlib_atomicCompareExchangeStrongUInt64
000000000015aad0 T _swift_stdlib_atomicFetchAddUInt32
000000000015aae0 T _swift_stdlib_atomicFetchAddUInt64
000000000015aac0 T _swift_stdlib_atomicLoadPtr
000000000015aaa0 T _swift_stdlib_atomicLoadUInt32
000000000015aab0 T _swift_stdlib_atomicLoadUInt64
000000000015aa80 T _swift_stdlib_atomicStoreUInt32
000000000015aa90 T _swift_stdlib_atomicStoreUInt64
000000000015da50 T _swift_stdlib_compareNSStringDeterministicUnicodeCollation
0000000000132fd0 T _swift_stdlib_conformsToProtocol
000000000015ef80 T _swift_stdlib_demangleName
000000000015edb0 T _swift_stdlib_getDemangledMetatypeName
000000000015ee20 T _swift_stdlib_getDemangledTypeName
```

happy coding
