# 이분 탐색 알고리즘을 배워 봅시다.	
## 1920 수 찾기
이분정렬을 활용해 풀이한다.   
```
import Foundation

func solution() {
    let N = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    arr.sort()
    let M = Int(readLine()!)!
    let value = readLine()!.split(separator: " ").map{Int($0)!}
    for v in value {
        checkOk(v) ? print(1) : print(0)
    }
    
    func checkOk(_ num: Int) -> Bool {
        var start = 0, end = N-1
        while start <= end {
            let mid = (start+end)/2
            if arr[mid] == num { return true }
            
            if arr[mid] > num {
                end = mid-1
            } else {
                start = mid+1
            }
        }
        return false
    }
}

solution()

```
## 1654 랜선자르기
주어진 랜선의 크기중 start를 1로 하는것이 중요하다.   
나머지는 평범한 이분정렬처럼 구해준다.   
단, N과 같다고 바로 return해주는것이 아닌   
최대 길이를 구하는것이기에 start를 계속해서 끌어올려준다.   

```
import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let(K,N) = (input[0],input[1])
    var arr: [Int] = []
    for _ in 0..<K {
        arr.append(Int(readLine()!)!)
    }
    arr.sort()
    var start = 1
    var end = arr.last!
    var result = 0
    while start <= end {
        let mid = (start+end)/2
        var ret = 0
        for i in arr {
            ret += (i/mid)
        }
        if ret >= N {
            result = max(result,mid)
            start = mid+1
        } else {
            end = mid-1
        }
    }
    print(result)
}

solution()

```
## 2805 나무 자르기
주어진 값들을 정렬 후 이분탐색에 쓰일 start, end값을 지정한다.   
지정후 mid값을 기준으로 나무들을 잘랐을때 가져가는 나무인(temp)값이   
원하는 M의 크기보다 클 경우 바로 return해주는것이 아닌   
M을 가져갈 수 있는 최대의 나무 높이를 구하기 위해   
start 값을 mid+1로 설정해준다.   
당연히 M보다 적을 경우 자를 나무의 높이를 낮춰줘야하기에 end값을 조정해준다.   
```
import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,M) = (input[0],input[1])
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    arr.sort()
    var start = 1, end = arr.last!
    var result = 0
    while start <= end {
        let mid = (start+end)/2
        var temp = 0
        for a in arr {
            if a > mid {
                temp += (a-mid)
            }
        }
        if temp >= M {
            result = max(result,mid)
            start = mid + 1
        } else {
            end = mid - 1
        }
        
    }
    print(result)
}

solution()

```
## 2110 공유기 설치 
이분 탐색은 무엇을 기준으로 이분탐색할 것인가 설정하는 것이 중요하다.   
여기서는 공유기 사이의 거리를 기준으로 이분탐색해본다.   
최대 거리는 arr.last - arr.first 이다.   
따라서 현 예제로는 9-1 = 8 이다.   
이제 start = 1, end = 8일때 사이의 값을 mid로 지정하고   
반복문을 돌면서 두 공유기 (prev,cur)의 사이가 mid를 넘는다면 count+1   
반복문을 전부 끝냈을떄 count값이 C보다 많다면 거리를 더 넓혀도 된다고 판단   
start = mid + 1, 만약 해당 거리로 공유기를 원하는 만큼 설치할수없다면   
end = mid - 1를 해준다.   
```
import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (N,C) = (input[0],input[1])
    var arr: [Int] = []
    for _ in 0..<N {
        arr.append(Int(readLine()!)!)
    }
    arr.sort()
    var start = 1, end = arr[N-1]-arr[0]
    var result = 0
    
    while start <= end {
        
        var count = 1
        let mid = (start+end)/2
        //print(start,end,mid)
        var prev = arr[0]
        // mid 라는 사이거리를 만족시키면서 공유기를 세울 수 있는가
        for i in 1..<N {
            let cur = arr[i]
            if cur-prev >= mid {
                count += 1
                prev = cur
            }
        }
        if count < C {
            end = mid - 1
        } else {
            result = max(result,mid)
            start = mid + 1
        }
    }
    print(result)
}

solution()

```
## 1300 K번째 수   
당연히 해당값을 오름차순으로 정렬하고 출력하려 한다면 시간초과가 발생한다.   
따라서 문제를 다른 관점에서 바라볼 필요가 있다.   
   
1 2 3 4   
2 4 6 8   
3 6 9 12   
4 8 12 16   
   
예를 들어 n=4일때 B[10] = 6은 무슨 뜻을 의미할까   
6보다 작거나 같은 값이 최소 10개나 있다는 뜻을 의미한다.   
(1,2,2,3,3,4,4,4,6,6)   
B[9] = 6 또한 6보다 작거나 같은 값이 최소 9개 있다는 의미이다.   
   
여기서 우리는 6(x)을 찾는 이분 탐색을 실행해야한다.   
만약 x가 k보다 작다면 start값을 올려주고,   
k보다 크거나 같다면 end값을 내려주는것이다.   
   
그렇다면 6보다 작거나 같은값은 어떻게 구할까   
구구단에서 6보다 작은 수를 구하는 방법은 쉽다   
1단 = (6/1) = 6개   
2단 = (6/2) = 3개   
3단 = (6/3) = 2개   
등등 반복된다.   
따라서 반복문을 통해 count += (mid/i)를 통해 구할 수 있다.   
   
하지만 여기서 예외사항이 있다.   
n이 4, k가 13이라고 가정하자   
구구단의 몫을 통해 count값을 구할때   
1단 13개 2단 6개 등등 25가 나오지만   
행렬은 nxn -> 4x4로 최대 16개까지 밖에 존재하지않는다.   
따라서 min(n,(mid/i))를 통해 최대값을 지정해주고 count를 구해준다.   
   
이제 남은건 upper / lower 중 지정해주는것이다.   
n이 4이고 x가 4일때 4보다 작거나 같은 수는 6,7,8행 으로 여러개이다.   
k값에 대해 x보다 작은 수가 k값이랑 같은 경우의 수가 여러개이기 때문에   
찾고자 하는 값과 같거나 큰 수가 있는 첫번째 인덱스를 찾는 lower를 사용한다.   


```
import Foundation

func solution() {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var start = 1, end = n*n
    //B[k] B[7] = 6이라면 반대로 말한다면 6보다 작거나 같은수가 최소 7개가 있다는 소리이다.
    while start <= end {
        var count = 0
        let mid = (start+end)/2
        //print(start,end,mid)
        for i in 1...n {
            // n이 4 k가 13이라고 가정하자 만약 min()을 넣지 않는다면
            // count는 (13+6+4+3), 26이 된다. 하지만 생각해보면 해당값은 n을 넘길수없다.
            // 따라서 최대 n, 최소 k/i로 값을 고정시켜준다.
            count += min(n,(mid/i))
        }
        if count >= k {
            end = mid - 1
        } else {
            start = mid + 1
        }
        //print(start,end,mid)
    }
    print(start)
}

solution()

```
## 12015 가장 긴 증가하는 부분 수열2
LIS (Longest Incresing Subsequence) 최장증가부분수열이다.   
동적계획법으로 풀이하지만 이분탐색으로도 풀이할 수 있다.   

일단 배열의 last보다 크다면 넣고 continue   
하지만 last보다 작더라도 result에 있는 현재 넣으려는 수보다 가장 가까운   
큰 수와 현재 넣은 수를 교체해주는 방식으로 배열을 변화시킨다.   

```
import Foundation

func solution() {
    let a = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var result: [Int] = []
    result.append(arr.first!)
    for i in 1..<a{
        //print(arr[i])
        if result.last! < arr[i] {
            result.append(arr[i])
            continue
        }
        
        var start = 0
        var end = result.count
        while start <= end {
            let mid = (start+end)/2
            if result[mid] < arr[i] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        result[start] = arr[i]
    }
    print(result.count)
}

solution()
 

```
