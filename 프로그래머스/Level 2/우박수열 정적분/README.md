첫 제출   
문제를 해석하는데 더 오랜 시간이 걸린것같았다.   
우박수열을 먼저 진행해준 함수를 만들었고,   
해당 함수로 범위에 따른 사다리꼴 넓이를 구한 배열을 만들어주었다.   
다시 start와 end를 설정한다음 해당 범위일 때 예외를 설정해주고,   
예외를 벗어나지않는다면 해당 범위만큼 사다리꼴 넓이를 합쳐주었다.   
```
import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    /*
    5로 시작하는 우박수열은 5 ⇒ 16 ⇒ 8 ⇒ 4 ⇒ 2 ⇒ 1 입니다. 
    그래프에서 꺾이는 지점을 경계로 5개의 구역으로 나눠보면 
    각각의 구간 넓이는 10.5, 12, 6, 3, 1.5 입니다.
    */
    let collatz = ubak(k)
    //print(collatz)

    var sum: [Double] = []
    for i in 0..<collatz.count-1 {
        sum.append((Double(collatz[i]) + Double(collatz[i+1])) / 2)
    }
    let start = 0
    let end = sum.count
    //print(sum)
    var result: [Double] = []
    for i in ranges {
        let newStart = start + i[0]
        let newEnd = end + i[1]
        //print(newStart, newEnd)

        // 만약 newStart가 start~end사이에 없거나
        // newEnd가 start~end 사이에 없거나
        // newStart가 newEnd보다 크다면 -1
        if !(start...end ~= newStart) || !(start...end ~= newEnd) || newStart > newEnd {
            result.append(-1)
            continue
        }
        if newStart == newEnd {
            result.append(0)
            continue
        }
        
        let arr = sum[newStart..<newEnd]
        //print(arr)
        result.append(arr.reduce(0,+))
        //print(result)
    }
    //print(result)
    return result
}

func ubak(_ n: Int) -> [Int] {
    var n = n
    var arr: [Int] = []
    arr.append(n)
    while n != 1 {
        n = n % 2 == 0 ? n/2 : (n*3)+1
        arr.append(n)
    }
    return arr
}
```
