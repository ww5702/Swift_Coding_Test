에라토스테네스의 체로 지워가는 방식을 활용해봤지만 런타임에러 발생   

```
import Foundation
func solution(){
    let minmax = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (min,max) = (minmax[0], minmax[1])
    
    var list = Array(repeating: true, count: max+1)
    list[0] = false
    if min > 1 {
        for i in 2...Int(sqrt(Double(max))) {
            let num = i*i
            //print("제겁",num)
            for j in 1...max/num {
                //print(j)
                list[num*j] = false
            }
        }
    }
    
    
    print(list[min...max].filter{$0}.count)
    
}

solution()
/*
 4 9 16
 4 8
 1 2 3 5 6 7 10
 */


```
