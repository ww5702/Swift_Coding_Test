import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    // 3배로 확장시킨 자물쇠
    var extendedLock = [[Int]](repeating: [Int](repeating: 0, count: 3 * N), count: 3 * N)
    print(extendedLock)
    
    // 확장된 행렬에서 원래의 자물쇠행렬이 위치하는 범위
    let extendedRange = N..<2*N
    
    // 확장된 행렬에서 자물쇠 위치 탐색하며 열리는지 판단
    func canOpen(_ lock: [[Int]]) -> Bool {
        for i in extendedRange {
            for j in extendedRange {
                if lock[i][j] != 1 { return false }
            }
        }
        return true
    }
    
    // 입력받았을때, 이미 전부 1이면 return
    if (lock.filter{$0.contains(0)}).isEmpty { return true }
    
    // 확장된 배열에 자물쇠 집어넣기
    for i in 0..<N {
        for j in 0..<N {
            extendedLock[i + N][j + N] = lock[i][j]
        }
    }
    
    var tempKey = key
    var tempExtendedLock = extendedLock
    
    // 3번 회전
    while count <= 4 {
        for i in (N - M + 1)..<2 * N {
            for j in (N - M + 1)..<2 * N {
                tempExtendedLock = extendedLock
                for row in 0..<N {
                    for col in 0..<M {
                        tempExtendedLock[i + row][j + col] += tempKey[row][col]
                    }
                }
                if canOpen(tempExtendedLock) { return true }
            }
        }
        tempKey = rotation(tempKey)
        count += 1
    }
    return false
}

// 90도 회전함수
func rotation(_ key : [[Int]]) -> [[Int]] {
    var rotatedKey = [[Int]](repeating: [Int](repeating: 0, count: M), count: M)
    for col in 0..<M {
        for row in (0..<M).reversed() {
            rotatedKey[col][M - 1 - row] = key[row][col]
        }
    }
    return rotatedKey
}


var key: [[Int]] = []
var lock: [[Int]] = []
for _ in 0..<3 {
    key.append(readLine()!.split(separator: " ").map{Int($0)!})
}
for _ in 0..<3 {
    lock.append(readLine()!.split(separator: " ").map{Int($0)!})
}
let M = key.count
let N = lock.count
var count = 1


print(key)
var result = solution(key, lock)
if  result == true { print("true") }
else { print("false") }
