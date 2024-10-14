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
