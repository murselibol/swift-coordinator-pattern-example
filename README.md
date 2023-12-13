# Swift - Coordinator Pattern

This repository is an example developed with Swift UIKit, inspired by [Soroush Khanlou](https://khanlou.com/)'s Coordinator design pattern.

###  Different methods implemented in order to avoid Retain Cycle


| &nbsp;&nbsp;&nbsp;Branch&nbsp;&nbsp;&nbsp; |  |
| ------ | ------ |
| [main][b-v1] | Terminating the Coordinator within the deInit method of the ViewController  |
| [version-2][b-v2]  | Abstracting the termination process on the main branch from the ViewController, moving it into the Coordinator, and calling the abstracted method within the deInit method    |
| [version-3][b-v3]  | Creating the BaseViewController class that will be inherited by the other ViewControllers, and terminating the Coordinator from within the BaseViewController    |


[b-v1]: <https://github.com/murselibol/swift-coordinator-pattern-example/tree/main>
[b-v2]: <https://github.com/murselibol/swift-coordinator-pattern-example/tree/version-2>
[b-v3]: <https://github.com/murselibol/swift-coordinator-pattern-example/tree/version-3>



## Credits
[Soroush Khanlou: Presenting Coordinators](https://www.youtube.com/watch?v=a1g3k3NObkE)  
[How to use the coordinator pattern in iOS apps](https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps)  
[Advanced coordinators in iOS](https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios)  
