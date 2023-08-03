돌려야할 테두리를 상하좌우로 나눠 돌려주면서 최소값을 따로 빼내어준다.   
오른쪽으로 간다고 하나씩 건너가며 덮어쓰면 같은 숫자가 계속해서 이동하게 된다.   
따라서 오른쪽으로 이동한다면 맨 오른쪽숫자를 왼쪽숫자가 덮는다는 느낌으로 함수를 구성한다.   

```
import Foundation


func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var arr = [[Int]]()
    var result: [Int] = []
    for i in 0...rows-1 {
        let a = [Int](1+(columns*i)...columns*(i+1))
        arr.append(a)
    }
    
    func rotate(_ query: [Int]){
        let x = query[3]-query[1]
        let y = query[2]-query[0]
        var min: [Int] = []
        // 오른쪽으로 
        var temp = arr[query[0]][query[3]]
        min.append(temp)
        for i in stride(from:query[3], to:query[1],by: -1) {
            arr[query[0]][i] = arr[query[0]][i-1]
            min.append(arr[query[0]][i-1])
        }
        // 밑으로
        var temp2 = arr[query[2]][query[3]]
        min.append(temp2)
        for i in stride(from:query[2],to:query[0],by:-1) {
            arr[i][query[3]] = arr[i-1][query[3]]
            min.append(arr[i-1][query[3]])
        }
        // 왼쪽으로
        arr[query[0]+1][query[3]] = temp
        var temp3 = arr[query[2]][query[1]]
        min.append(temp3)
        for i in query[1]..<query[3] {
            arr[query[2]][i] = arr[query[2]][i+1]
            min.append(arr[query[2]][i+1])
        }
        // 위쪽으로
        arr[query[2]][query[3]-1] = temp2
        for i in query[0]..<query[2] {
            arr[i][query[1]] = arr[i+1][query[1]]
            min.append(arr[i+1][query[1]])
        }
        arr[query[2]-1][query[1]] = temp3

        result.append(min.min()!)
    }
    
    
    for q in 0..<queries.count {
        let query = queries[q].map{$0 - 1}
        rotate(query)
    }
    return result
}


```
