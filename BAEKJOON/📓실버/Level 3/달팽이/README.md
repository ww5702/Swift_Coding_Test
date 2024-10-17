```
import Foundation
func solution(){
    let n = Int(readLine()!)!
    let value = Int(readLine()!)!
    
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    var (startY,startX) = (n/2, n/2)
    board[startY][startX] = 1
    
    var dir = 1
    var dirCnt = 1
    var num = 2
    
    // 1 2 3 4 북 동 남 서
    var cnt = 1
    while true {
        if dir == 1 {
            moveUp(cnt)
        } else if dir == 2 {
            moveRight(cnt)
        } else if dir == 3 {
            moveDown(cnt)
        } else if dir == 4 {
            moveLeft(cnt)
        }
        dir += 1
        if dir == 5 { dir = 1 }
        if num >= (n*n) { break }
        
//        for i in 0..<n {
//            print(board[i])
//        }
//        print()
        
        if dir == 1 {
            moveUp(cnt)
        } else if dir == 2 {
            moveRight(cnt)
        } else if dir == 3 {
            moveDown(cnt)
        } else if dir == 4 {
            moveLeft(cnt)
        }
        
        dir += 1
        if dir == 5 { dir = 1 }
        if num >= (n*n) { break }
        cnt += 1
        
//        for i in 0..<n {
//            print(board[i])
//        }
//        print()
    }
    
    var result = (0,0)
    for i in 0..<n {
        for j in 0..<n {
            print(board[i][j], terminator: " ")
            if board[i][j] == value {
                (result.0,result.1) = (i+1,j+1)
            }
        }
        print()
    }
    print("\(result.0) \(result.1)")
    
    func moveUp(_ cnt: Int) {
        for _ in 0..<cnt {
            startY -= 1
            if (0..<n).contains(startY) {
                //print(startY,startX)
                board[startY][startX] = num
                num += 1
            }
            
        }
    }
    
    func moveRight(_ cnt: Int) {
        for _ in 0..<cnt {
            startX += 1
            if (0..<n).contains(startX) {
                //print(startY,startX)
                board[startY][startX] = num
                num += 1
            }
            
        }
    }
    
    func moveDown(_ cnt: Int) {
        for _ in 0..<cnt {
            startY += 1
            if (0..<n).contains(startY) {
                //print(startY,startX)
                board[startY][startX] = num
                num += 1
            }
            
        }
    }
    
    func moveLeft(_ cnt: Int) {
        for _ in 0..<cnt {
            startX -= 1
            if (0..<n).contains(startX) {
                //print(startY,startX)
                board[startY][startX] = num
                num += 1
            }
            
        }
    }
    
    
}

solution()
/*
 1 1
 2 2
 3 3
 4 4
 5 5
 6 6
 가운데 좌표
 1 = 0,0
 3 = 1,1
 5 = 2,2
 7 = 3,3
 */


```
