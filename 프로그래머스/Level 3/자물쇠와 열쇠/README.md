구현문제이다.   
lock를 확장시켜서 가로 세로를 x3으로 재구성하여 만들어준다.   
key를 한칸씩 옮기면서 더해줬을떄 9칸이 전부 1이 된다면 true를 return해준다.   
```
import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    /*
    맨 왼쪽 위에서부터 시작해서 제일 밑까지 key를 대입해본다
    만약 lock이 0을 포함하지 않는다면 풀린다
    1~9까지 순환하고
    key를 90도 회전 후 다시 순환
    이렇게 4번 반복
    
    쉽게 순환하기 위해 lock크기 x3을 만들자 
    그렇다면 가운데에 lock이 위치하게 되므로 자물쇠는 [N..<2*N][N..<2*N]
    에 위치하게 된다.
    그리고 키는 [N-M+1..<2*N][N-M+1..<2*N]부터 시작하게 된다.
    
    
    (1,0) -> (0,1) -> (1,2)
    (2,1) -> (1,0) -> (0,2)
    (2,2) -> (2,0) -> (0,0)
    */
    let M = key.count, N = lock.count
    var lock = lock, key = key
    // key 회전
    func rotatedKey90(_ key : [[Int]]) -> [[Int]] {
        var rotatedKey = [[Int]](repeating: [Int](repeating: 0, count: M),count: M)
        for col in 0..<M {
            for row in (0..<M).reversed() {
                rotatedKey[col][M-1-row] = key[row][col]
            }
        }
        return rotatedKey
    }
    
    // 열수있는지
    func isPossible(_ lock: [[Int]]) -> Bool {
        for i in 0..<N {
            for j in 0..<N {
                if lock[i+N][j+N] != 1 { return false }
            }
        }
        return true
    }
    
    var extendedLock = [[Int]](repeating: [Int](repeating: 0, count: 3 * N), count: 3 * N)
    // lock 확장
    for i in 0..<N {
        for j in 0..<N {
            extendedLock[i+N][j+N] = lock[i][j]
        }
    }
    var tempExtendedLock = extendedLock
    var direction = 4
    // 4번 반복
    for _ in 0..<4 {
        //print(key)
        for i in (N-M+1)..<2*N {
            for j in (N-M+1)..<2*N {
                tempExtendedLock = extendedLock
                for col in 0..<M {
                    for row in 0..<M {
                        tempExtendedLock[i+col][j+row] += key[col][row]
                    }
                }
                // for i in 0..<tempExtendedLock.count {
                //     print(tempExtendedLock[i])
                // }
                //print(tempExtendedLock)
                if isPossible(tempExtendedLock) {
                    return true
                }
            }
        }
        key = rotatedKey90(key)
    }
    return false
}
```
