42프로에서 시간초과가 발생   
시간을 줄일 방법을 생각해봐야 한다.   

```
import Foundation
func solution(){
    let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,k) = (nmk[0],nmk[1],nmk[2])
    var yangboon: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        yangboon.append(input)
    }
    var board = Array(repeating: Array(repeating: 5, count: n), count: n)
    
    //var tree = Array(repeating: Array(repeating: [Int](), count: n), count: n)
    var tree: [(Int,Int,Int)] = []
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        tree.append((input[0]-1,input[1]-1,input[2]))
        //tree[input[0]-1][input[1]-1].append(input[2])
    }
    
//    for i in 0..<n {
//        print(tree[i])
//    }
    tree.sort(by: {$0.2 < $1.2})
    //print(tree)
    
    
    let dy = [-1,-1,-1,0,0,1,1,1]
    let dx = [-1,0,1,-1,1,-1,0,1]
    
    // k년 반복
    for _ in 0..<k {
        var deadTree: [(Int,Int,Int)] = []
        var liveTree: [(Int,Int,Int)] = []
        // 봄 (나이만큼 양분먹기)
        for i in 0..<tree.count {
            let t = tree[i]
            let (ty,tx,year) = (t.0, t.1, t.2)
            if board[ty][tx] < year {
                deadTree.append((ty,tx,year))
            } else {
                board[ty][tx] -= year
                liveTree.append((ty,tx,year+1))
            }
        }
        tree = liveTree
        
//        print("봄")
//        print(tree)
        
        
        // 여름 (양분 나눠주기)
        for i in 0..<deadTree.count {
            let t = deadTree[i]
            let (ty,tx,year) = (t.0, t.1, t.2/2)
            board[ty][tx] += year
        }
        
//        print("여름")
//        for i in 0..<n {
//            print(board[i])
//        }
        
        // 가을(번식)
        var newTree: [(Int,Int,Int)] = []
        for i in 0..<tree.count {
            let t = tree[i]
            let (ty,tx,year) = (t.0, t.1, t.2)
            if year%5 == 0 {
                for i in 0..<8 {
                    let newY = ty+dy[i]
                    let newX = tx+dx[i]
                    if (0..<n).contains(newY) && (0..<n).contains(newX) {
                        newTree.append((newY,newX,1))
                    }
                }
            }
        }
        tree += newTree
        tree.sort(by: {$0.2 < $1.2})
        
//        print("가을")
//        print(tree)
        
        // 겨울(양분 추가)
        for i in 0..<n {
            for j in 0..<n {
                board[i][j] += yangboon[i][j]
            }
        }
        
//        print("겨울")
//        for i in 0..<n {
//            print(board[i])
//        }
//        
//        print(tree)
        
    }
    print(tree.count)
}

solution()
/*
 */


```

2차원배열로 구성해서 그때마다 정렬하는것도 해봤지만 당연히 시간초과   

```
import Foundation
func solution(){
    let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,m,k) = (nmk[0],nmk[1],nmk[2])
    var yangboon: [[Int]] = []
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        yangboon.append(input)
    }
    var board = Array(repeating: Array(repeating: 5, count: n), count: n)
    
    var tree = Array(repeating: Array(repeating: [Int](), count: n), count: n)
    //var tree: [(Int,Int,Int)] = []
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        //tree.append((input[0]-1,input[1]-1,input[2]))
        tree[input[0]-1][input[1]-1].append(input[2])
    }
    
//    for i in 0..<n {
//        print(tree[i])
//    }
    //tree.sort(by: {$0.2 < $1.2})
    //print(tree)
    
    let dy = [-1,-1,-1,0,0,1,1,1]
    let dx = [-1,0,1,-1,1,-1,0,1]
    
    // k년 반복
    for _ in 0..<k {
        var deadTree: [(Int,Int,Int)] = []
        var growthTree: [(Int,Int)] = []
        // 봄 (나이만큼 양분먹기)
        
        for i in 0..<n {
            for j in 0..<n {
                if tree[i][j].count > 0 {
                    var liveTree: [Int] = []
                    for t in tree[i][j].sorted(by: <) {
                        if board[i][j] < t {
                            deadTree.append((i,j,t))
                        } else {
                            board[i][j] -= t
                            liveTree.append(t+1)
                            if (t+1)%5 == 0 {
                                growthTree.append((i,j))
                            }
                        }
                    }
                    tree[i][j] = liveTree
                }
                
                
            }
        }
        
//        print("봄")
//        for i in 0..<n {
//            print(tree[i])
//        }
        
        
        // 여름 (양분 나눠주기)
        for i in 0..<deadTree.count {
            let t = deadTree[i]
            let (ty,tx,year) = (t.0, t.1, t.2/2)
            board[ty][tx] += year
        }
        
//        print("여름")
//        for i in 0..<n {
//            print(board[i])
//        }
        
        // 가을(번식)
        for i in 0..<growthTree.count {
            let t = growthTree[i]
            let (ty,tx) = (t.0, t.1)
            for i in 0..<8 {
                let newY = ty+dy[i]
                let newX = tx+dx[i]
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    tree[newY][newX].append(1)
                }
            }
        }
        
//        print("가을")
//        for i in 0..<n {
//            print(tree[i])
//        }
        
        // 겨울(양분 추가)
        for i in 0..<n {
            for j in 0..<n {
                board[i][j] += yangboon[i][j]
            }
        }
        
//        print("겨울")
//        for i in 0..<n {
//            print(board[i])
//        }
        
    }
    
    var result = 0
    for i in 0..<n {
        for j in 0..<n {
            result += tree[i][j].count
        }
    }
    print(result)
}

solution()
/*
 */


```
5배수인 나무만 따로 관리해도 시간초과   
힙을 준비해야할것같다.   
```
var growthTree: [(Int,Int)] = []
        // 봄 (나이만큼 양분먹기)
        for i in 0..<tree.count {
            let t = tree[i]
            let (ty,tx,year) = (t.0, t.1, t.2)
            if board[ty][tx] < year {
                deadTree.append((ty,tx,year))
            } else {
                board[ty][tx] -= year
                liveTree.append((ty,tx,year+1))
                if (year+1) % 5 == 0 {
                    growthTree.append((ty,tx))
                }
            }
        }
        tree = liveTree
```
힙을 사용해도 시간초과   
```
var minPQ = Heap<Int>{$0 < $1}
var tree = Array(repeating: Array(repeating: minPQ, count: n), count: n)
```
