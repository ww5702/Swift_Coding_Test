```
import Foundation
/*
재귀로 문제를 풀이한다
5개를 예로 들자면

제일 큰 원판을 제외한 4개를 2번으로 옮기고 1->2 (여기서 다시 재귀)
남은 제일 큰 원판(5)을 3번으로 옮긴다. 1->3
그리고 나머지 4개를 다시 번으로 옮긴다 2->3 (여기서 다시 재귀)

그 4개를 2번으로 옮기는 과정은 다음과 같다
제일 큰 원판(4)을 제외한 3개를 3으로 옮기고, 1->3 (여기서 다시 재귀)
남은 제일 큰 원판(4)를 2번으로 옮긴다. 1->2
그리고 3으로 옮긴 원판을 2번으로 옮긴다. 3->2

이와 같은 상황이 반복되는 것이다.

위의 규칙을 점화식으로 변경해보면 
옮길 원판의 개수n, 시작기둥 start, 목적지 기둥 end, 나머지 기둥을 mid라고 한다
n개의 원판을 start에서 end로
n-1개의 원판을 start -> mid
1개의 원판을 start -> end
n-1개의 원판을 mid -> end

*/
func solution(_ n:Int) -> [[Int]] {
    // mid를 구하는 함수
    func getMid(_ start: Int, _ end: Int) -> Int{
        if start == 1 {
            if end == 3 { return 2 }
            if end == 2 { return 3 }
        } else if start == 2 {
            if end == 1 { return 3 }
            if end == 3 { return 1 }
        } else {
            if end == 1 { return 2 }
            if end == 2 { return 1 }
        }
        return -1
    }
    // 위의 점화식을 함수로
    func move(_ n: Int, _ start: Int, _ end: Int) -> [[Int]]{
        if n == 1 { return [[start, end]] }
        
        var answer = [[Int]]()
        let mid = getMid(start,end)
        
        answer.append(contentsOf: move(n-1, start, mid))
        answer.append([start, end])
        answer.append(contentsOf: move(n-1, mid, end))
        
        return answer
    }
    return move(n, 1, 3)
}

```
