import UIKit


typealias errorHandler = (Error?) -> ()

class A {
    
    let b = B()

    func callsFunctionBFromA() {
        b.testIfExecutionContinuesAfterCompletionCallBAck { error in
            if error != nil {
                print("There is some error")
            }
        }
    }
    
}

class B {
    
    func testIfExecutionContinuesAfterCompletionCallBAck(completionHandler: errorHandler) {
        self.callsNoErrorFunctionFromB { error in
            completionHandler(error)
            print("After Completion")
            guard error == nil else {
                return
            }
        }
    }
    
    func callsNoErrorFunctionFromB(completion: errorHandler) {
        completion(nil)
    }
}

enum ErrorType : Error {
    case noNIlError
}

let a = A()
a.callsFunctionBFromA()
