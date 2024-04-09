조합으로 부분수열을 뽑아내고,   
해당 부분수열의 합이 s인지 판별한다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,s) = (input[0],input[1])
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var answer = 0
    
    for i in 1...n {
        let result = [Int]()
        combi(result, i, 0)
    }
    
    func combi(_ result: [Int], _ target: Int, _ index: Int) {
        if result.count == target {
            //print(result)
            if cal(result) { answer += 1 }
            return
        }
        
        for i in index..<arr.count {
            combi(result + [arr[i]], target, i+1)
        }
    }
    
    func cal(_ arr: [Int]) -> Bool {
        return arr.reduce(0, +) == s ? true : false
    }
    print(answer)
}
solution()



```
