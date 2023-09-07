```
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    print("go")
    var newboard: [[String]] = []
    for i in 0..<board.count {
        let value = board[i].map{String($0)}
        newboard.append(value)
    }
    var delete: [(Int,Int)] = []
    // delete.append((1,1))
    // delete.append((2,2))
    // print(delete)
    // print(delete[0])
    // print(delete[0].0)
    var result = 0
    var change = true
    // 바뀐게 없을때까지 반복
    while change {
        // 같은수가 있는지
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                if newboard[i][j] == newboard[i][j+1] &&
                newboard[i][j] == newboard[i+1][j] &&
                newboard[i][j] == newboard[i+1][j+1] {
                    delete.append((i,j))
                }
            }
        }
        // 삭제
        for d in delete {
            newboard[d.0][d.1] = ""
            newboard[d.0][d.1+1] = ""
            newboard[d.0+1][d.1] = ""
            newboard[d.0+1][d.1+1] = ""
        }
        // 칸 내리기
        for k in 0..<delete.count {
            for i in 0..<m-1 {
                for j in 0..<n {
                    if newboard[i+1][j] == "" {
                        newboard[i+1][j] = newboard[i][j]
                        newboard[i][j] = ""
                    }
                }
            }    
        }
        
        if delete.count != 0 {
            delete = []
            change = true
        } else {
            change = false
        }
    }
    return 0
}
```

