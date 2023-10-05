100,000개의 개수를 1차 반복문을 통해 풀이하였다.   
처음에 중복제거를 통해 보석의 종류를 구해주고   
반복문을 통해 하나씩 임시배열에 집어넣다가 보석의 종류가 같아진다면   
그때부터 while문을 통해 종류가 부족해질때까지 반복해서 범위를 구해준다.   
범위가 더 최소값이라면 변환해준다.   
```
import Foundation

func solution(_ gems:[String]) -> [Int] {
    var type = Set(gems).count
    var temp: [String] = []
    var start = 0, end = -1
    var result: [Int] = [start,gems.count-1]
    for gem in 0..<gems.count {
        temp.append(gems[gem])
        end += 1
        //print("현재 temp",temp,start,end)
        // 만약 종류가 다 들어가있다면 계속해서 반복
        while Set(temp).count == type {
            //print("종류 다 들어감",temp,start,end)
            // 만약 더 짧은 구간으로 가능하다면
            if end - start < result[1] - result[0] {
                //print("최소값 갱신")
                result[0] = start
                result[1] = end
            }
            temp.removeFirst()
            start += 1
        }
    }
    return [result[0]+1,result[1]+1]
}
```
