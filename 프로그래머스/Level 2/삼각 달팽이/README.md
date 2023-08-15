어떻게 풀이를 해야할까 고민을 하던 도중 n개의 2차원 배열을 만들어   
왼쪽 밑 대각선으로 내려간다면 row를 증가시키고   
오른쪽으로 이동한다면 col을 증가시키고   
왼쪽 위로 올라간다면 row 와 col을 감소시키는 규칙을 적용시켜 풀이를 하였다.   
그리고 중첩된 2차원 배열은 flatMap을 이용하여 1차원 배열로 변환후 filter를 이용해 0이 아닌 값들만 추출한다.   
```
import Foundation

func solution(_ n:Int) -> [Int] {
    var result: [[Int]] = [[Int]](repeating: Array(repeating:0, count: n), count: n)
    let max = n * (n+1) / 2
    var (row, col) = (-1,0)
    var i = n
    var j = 0
    var currentNum = 0
    
    // 왼쪽 밑으로 내려간다면 col 증가
    // 오른쪽으로 이동한다면 row 증가
    // 왼쪽 위 대각선으로 올라간다면 row col 감소
    while i > 0 {
        j = 0
        while (j<i) {
            row += 1
            currentNum += 1
            result[row][col] = currentNum
            j += 1
        }
        j = 0
        while (j<i-1) {
            col += 1
            currentNum += 1
            result[row][col] = currentNum
            j += 1
        }
        j = 0
        while (j<i-2) {
            row -= 1
            col -= 1
            currentNum += 1
            result[row][col] = currentNum
            j += 1
        }
        i -= 3
        
    }
    
    return result.flatMap{$0}.filter{$0 != 0}
}
```
