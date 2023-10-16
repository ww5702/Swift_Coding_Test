처음 고민해봤을때 첫번째 글자부터 정확히 반대 글자와 같다면   
left, right를 한칸씩 서로를 향해 당겨주고   
달라지거나 left가 right보다 커진다면 반복문을 탈출시켜준다.   
탈출시켰을때 left > right라면 전부 같은 글자가 반복된거였으니 해당 값을 기존 answer와 비교하여   
큰 값으로 바꿔준다.   
시간초과가 날것같아서 하면서도 안될줄 알았지만 문자열 s의 길이가 2,500이어서 단순 반복문으로도 풀이가 가능했던것같다.   

```
import Foundation

func solution(_ s:String) -> Int {
    /*
    앞뒤로 뒤집어도 똑같다면
    홀수일때는 가운데 글자 빼고 같아야하고
    짝수라면 반으로 나눴을때 서로 같아야한다
    */
    var s = s.map{String($0)}
    var answer = 0
    
    for i in 0..<s.count {
        for j in stride(from: s.count-i, to: answer, by: -1) {
            var left = i
            var right = i + j - 1
            while left <= right, s[left] == s[right] {
                left += 1
                right -= 1
            }
            
            if left > right { answer = max(answer, j)}
        }
    }

    return answer
}
```
