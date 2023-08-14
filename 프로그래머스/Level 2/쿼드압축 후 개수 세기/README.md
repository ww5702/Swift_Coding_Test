1024부터 /2씩 진행되면서 (0,0)을 초기값으로 설정후 그 초기값과 수가 다르다면   
바로 1~4사분면에 따른 행 렬의 값을 변경하여 재귀함수로 함수 실행   
사분면에 따른 col row의 값을 알맞게 설정할 수 있다면 쉽게 풀이할 수 있는 문제   

```
import Foundation
var zeroCount = 0
var oneCount = 0
    /*
    1사분면 = row~n/2 col~n/2
    2사분면 = 행은 그대로 row~n/2 col+n/2 
    3사분면 = 열은 그대로 row+n/2 , col~n/2
    4사분면 = rowo+n/2 col+n/2
    */
func recursive(_ arr:[[Int]], _ row: Int, _ col: Int, _ n : Int) {
    var first = arr[row][col] // 최초값
        
    // 주어진 구역을 돌면서
    for i in row..<row + n {
        for j in col..<col + n {
            // 만약 서로 숫자가 다르다면 바로 해당 구역을 /2
            if first != arr[i][j] {
                recursive(arr, row, col, n/2)
                recursive(arr, row, col+n/2, n/2)
                recursive(arr, row+n/2, col, n/2)
                recursive(arr, row+n/2, col+n/2, n/2)
                    
                return
            }
        }
    }
    if first == 1 {
        oneCount += 1
    }else {
        zeroCount+=1
    }
}
func solution(_ arr:[[Int]]) -> [Int] {
    recursive(arr, 0, 0, arr[0].count)
    return [zeroCount, oneCount]
}
```
