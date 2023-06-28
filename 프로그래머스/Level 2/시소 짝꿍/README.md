첫 제출   
보자마자 떠오른 생각은 유클리드 호제법을 이용해 최대공약수와 최소공배수를 구해 시소와의 비율에 맞다면   
count + 1 을 해주면 되겠다였다.   
하지만 이는 O(n^2)이기에 시간초과가 발생한다.   
```
import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var siso: [Int] = [1,2,3,4]
    // 최대 공약수
    func GCD(_ min: Int, _ max: Int) -> Int {
        let rem = min % max
        
        if rem == 0 {
            return max
        } else {
            return GCD(max,rem)
        }
    }
    
    // 최소 공배수
    func LCM(_ a: Int, _ b: Int) -> Int {
        return a * b / GCD(a,b)
    }
    var count = 0 
    for i in 0..<weights.count-1 {
        for j in i+1..<weights.count {
            let value = LCM(weights[i], weights[j])
            let a = value/weights[i]
            let b = value/weights[j]
            //print(value, a, b)
            if siso.contains(a) && siso.contains(b) {
                count += 1
            }
        }
    }
    //print(count)
    return Int64(count)
}
```

두번째 제출
이중 반복문을 사용하더라도 한정된 양을 지정해 max 값이더라도 넘지 않도록 했다.
만약 비율을 곱해줬을때 다른 비율을 곱한 상대값과 0으로 나눠진다면 +1
```
import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var position: [(Int,Int)] = [(1, 1), (2, 3), (2, 4), (3, 2), (3, 4), (4, 2), (4, 3)]
    var count = 0
    var dict: [Int:Int] = [:]
    for w in weights {
        for p in position {
            var n = w * p.0
            // 비율 첫번째꺼 나누기 두번째꺼가 0이라면 해당값으로
            // 다음 비율을 곱해서 0이 나오는 사람을 찾는다
            guard n % p.1 == 0 else { continue }
            n /= p.1
            guard dict[n] != nil else { continue }
            count += dict[n]!
        }
        // w일때 비율이 맞는 사람이 있을때마다 +1
        if dict[w] == nil {
            dict[w] = 1
        } else {
            dict[w]! += 1
        }
        //print(dict)
    }
    return Int64(count)
}
```

