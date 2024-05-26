누적합 개념으로 풀이해보았으나 시간초과   
세그먼트 트리로 풀어야 한다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k,m) = (input[0],input[1],input[2])
    /*
     1 2 3 4 5
     1 2 6 4 5
     2 ~ 5 = 17
     1 2 6 4 2 = 12
     */
    var arr: [Int] = []
    var sum = Array(repeating: 0, count: n+1)
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    
    var num = 0
    for i in 0..<n {
        num += arr[i]
        sum[i+1] = num
    }
    //print(sum)
    
    for _ in 0..<k+m {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        // 변경
        if input[0] == 1 {
            for i in input[1]...n {
                if input[2] >= arr[input[1]-1] {
                    sum[i] += (input[2] - arr[input[1]-1])
                } else {
                    sum[i] -= (arr[input[1]-1] - input[2])
                }
            }
            arr[input[1]-1] = input[2]
        } else if input[0] == 2 {
            print(sum[input[2]] - sum[input[1]-1])
        }
//        print(arr)
//        print(sum)
    }
}
solution()

```
```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k,m) = (input[0],input[1],input[2])
    var tree = Array(repeating: 0, count: n*4)
    var arr = [Int]()
    for _ in 0..<n{
        arr.append(Int(readLine()!)!)
    }
    
    func interval_sum(from:Int, end:Int, idx:Int, min:Int, max:Int) -> Int{
        if end < min || max < from{
            return 0
        }
        if min <= from && end <= max{
            return tree[idx]
        }
        
        let mid = (from+end)/2
        return interval_sum(from: from, end: mid, idx: idx*2, min: min, max: max) +
        interval_sum(from: mid+1, end: end, idx: idx*2+1, min: min, max: max)
    }

    
    func update_tree(from:Int, end:Int, idx:Int, target:Int, value:Int){
        if target < from || end < target{
            return
        }
        
        tree[idx] += value
        
        if from == end{
            arr[from] += value
            return
        }
        
        let mid = (from+end)/2
        update_tree(from: from, end: mid, idx: idx*2, target: target, value: value)
        update_tree(from: mid+1, end: end, idx: idx*2+1, target: target, value: value)
    }
    
    
    func makeTree(from n:Int, end m:Int, idx:Int) -> Int{
        if n == m{
            tree[idx] = arr[n]
            return tree[idx]
        }
        
        let mid = (n+m)/2
        tree[idx] = makeTree(from: n, end: mid, idx: idx*2) + makeTree(from: mid+1, end: m, idx: idx*2+1)
        return tree[idx]
    }
    
    
    var ans = [String]()

    makeTree(from: 0, end: n-1, idx: 1)
    print(tree)
    for _ in 0..<m+k{
        let cmd = readLine()!.split(separator: " ").map{Int($0)!}
        if cmd[0] == 1{
            let target_idx = cmd[1]-1
            let num = cmd[2]
            update_tree(from: 0, end: n-1, idx: 1, target: target_idx, value: num-arr[target_idx])
        }else{
            let min = cmd[1]-1
            let max = cmd[2]-1
            ans.append("\(interval_sum(from: 0, end: n-1, idx: 1, min: min, max: max))")
        }
    }
    
    
    print(ans.joined(separator: "\n"))
   
}
solution()

```
