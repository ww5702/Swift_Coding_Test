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
같은 풀이이나 훨씬 빨라서 가져와보았다.   
0번째 인덱스부터 N-1까지 시작하여   
0 / 0,1 / 0,1,2 / 0,1,2,3 과 같이 증가하는 함수를 만들어준다.   
더하다가 해당 합이 s와 같다면 값을 더해준다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0], S = input[1]
    let series = readLine()!.split(separator: " ").map{Int(String($0))!}

    func findNumber(i: Int, sum: Int) -> Int {
        var count = 0
        if sum == S {
            count += 1
        }
        for index in i+1..<series.count {
            count += findNumber(i: index, sum: sum + series[index])
        }
        return count
    }

    var count = 0
    for i in 0..<N {
        count += findNumber(i: i, sum: series[i])
    }
    print(count)
}
solution()



```
