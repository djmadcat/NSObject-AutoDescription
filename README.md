# NSObject-AutoDescription

NSObject+AutoDescription is an category that greatly simplifies the process of writing `description` method for data models.

## Overview

`- (NSString *)description` method provide information about receiver instance. By default this method prints the object name and its address in memory. It looks like `<NAUser: 0x6b67f70>` and... pretty useless.
If you have a lot of classes-models in project, overloading `description` method for each class is very difficult and dreary. This category is based on reflection. By getting properties names and values it provides information about receiver in standard manner.

## NSArray, NSDictionary and NSSet description problem

NSArray, NSDictionary and NSSet by default provides human-readable description. But there is one small problem: it contains newline symbols and white spaces. If we use default description for NSArray, NSDictionary or NSSet in user defined class description we get `\n`, `\t`, `\"`, and `\\` symbols. It looks ugly. For a clear description of these "erroneous" classes there is `CleanDescription` category. These categories emulate standard descriptions, but without special characters.

## Example usage

``` objective-c
#import "NAUser.h"
#import "NSObject+AutoDescription.h"

@implementation NAUser

- (NSString *)description
{
    return [self autoDescription];
}

@end
```

## Read more

- http://stackoverflow.com/questions/7521683/nsdictionary-description-formatting-problem-treats-structure-like-char-data
- http://atkit.com/dev/objective-c/auto-description-category-nsobject-object/
- http://iosdevelopertips.com/cocoa/overriding-nsobject-description-method.html

## Contact

Alexey Aleshkov

- https://github.com/djmadcat
- https://twitter.com/coreshock
- djmadcat@gmail.com

## License

NSObject-AutoDescription is available under the BSD 2-Clause license. See the `LICENSE` file for more info.
