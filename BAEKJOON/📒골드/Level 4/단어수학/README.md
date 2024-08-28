구현문제이다.   
2   
GCF   
ACDEB   
일때 GCF에서 G는 100의 자리이고 C는 10의자리이다.   
따라서 해당 값을 dict에 넣어주고,   
모든 덧셈식에서 몇자리의 숫자인지 구해본다.   
위의 수식을 구했을떄   
A가 10000, C가 1010, G,F가 100 으로 순서대로 정렬하게된다.   
그렇다면 A,C,G,F가 9,8,7,6이 된다면 자연스럽게 가장 큰 수가 된다.   

```
import Foundation
func solution() {
    let n = Int(String(readLine()!))!
    var arr: [[Character]] = Array(repeating: [], count: n)
    var dict = [Character:Int]()
    var sum = 0
    for i in 0..<n{
        let read = readLine()!
        for j in read{
            arr[i].append(j)
        }
    }
   // print(arr)
    for i in 0..<n{
        for j in 0..<arr[i].count{
            dict[arr[i][j]] = 0
        }
    }
    //print(dict)
    
    for i in 0..<n{
        for j in 0..<arr[i].count{
            dict[arr[i][j]]! += Int(pow(10, Double(arr[i].count - j - 1)))
        }
    }
    //print(dict)
    var num = 9
    for i in dict.sorted(by: {$0.value > $1.value}) {
        sum += i.value * num
        num -= 1
    }
    print(sum)
}


solution()
/*
783 + 98654
 */

```
