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
맞춘 블록을 내려주는 과정이 가장 오래 걸린것같다.   
제일 밑에서부터 올라가면서 제일먼저 "-"가 나오는 지점을 제일 하단의 지점으로 판단하고 풀이한다   

```
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    /*
    2차원배열로 바꿔준뒤
    4개로 모여있는 좌표 입력
    좌표에 있는 값들 변경, 지워지는 블록개수 더해주기
    블록 내려주기
    */
    var newboard: [[String]] = []
    for i in 0..<board.count {
        let value = board[i].map{String($0)}
        newboard.append(value)
    }
    var delete = Set<[Int]>()
    var cnt = 0
    
    while true {
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                let point = newboard[i][j]
                // 이미 제거된 위치라면 continue
                if point == "-" { continue }
                
                if point == newboard[i][j+1] &&
                point == newboard[i+1][j] &&
                point == newboard[i+1][j+1] {
                    delete.insert([i,j])
                    delete.insert([i+1,j])
                    delete.insert([i,j+1])
                    delete.insert([i+1,j+1])
                }
            }
        }
        
        // delete가 있으면 cnt더해주고 블록지우기, 없다면 break
        if !delete.isEmpty {
            cnt += delete.count
            for d in delete {
                newboard[d[0]][d[1]] = "-"
            }
            delete = []
        } else {
            break
        }
        
        
        // 밑에서 탐색하면서 내려주기
        for j in stride(from:0, to:n, by:1) {
            var first = 0 // 현재 내려와야할 행 위치
            if newboard[m-1][j] == "-" {
                first = m-1
            }
            for i in stride(from: m-2, through: 0, by: -1) {
                if newboard[i][j] == "-" {
                    if i > first {
                        first = i
                    }
                } else if newboard[i+1][j] == "-" {
                    newboard[first][j] = newboard[i][j]
                    newboard[i][j] = "-"
                    first -= 1
                }
            }
        }
    }
    return cnt
}
```
