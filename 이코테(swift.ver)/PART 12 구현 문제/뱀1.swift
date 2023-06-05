import Foundation

func solution() {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var time = 0
    var snake_length: [(Int,Int)] = []
    var apple = 1
    var map = Array(repeating: Array(repeating: 0, count: n), count: n)
    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        map[input[0]-1][input[1]-1] = 1
    }
    // 몸 길이 확인용
    var length_map = Array(repeating: Array(repeating: "o", count: n), count: n)
    let L = Int(readLine()!)!
    var direction: [(Int?,String)] = []
    for _ in 0..<L {
        let input = readLine()!.split(separator: " ").map{String($0)}
        direction.append((Int(input[0]),input[1]))
    }
    var start = (0,0)
    var way = 1     // 동 = 1 남 = 2 서 = 3 북 = 4
    length_map[start.0][start.1] = "x"
    snake_length.append((start.0,start.1))
    while true {
        // 이동
        switch way {
        case 1:
            start.1 += 1
            break
        case 2:
            start.0 += 1
            break
        case 3:
            start.1 -= 1
            break
        case 4:
            start.0 -= 1
            break
        default:
            break
        }
        print(start)
        time += 1   // 이동 시간 추가
        // 이동한 장소가 벽에 막혀있다면
        if start.0 < 0 || start.0 > n-1 || start.1 < 0 || start.1 > n-1 { break }
        // 뱀 이동 확인
        snake_length.append((start.0,start.1))
        // 이동한 장소에 이미 뱀의 몸이 있다면
        if length_map[start.0][start.1] == "x" { break }
        else { length_map[start.0][start.1] = "x" }
        
        // 뱀 이동경로
        if map[start.0][start.1] == 1 {
            // 사과를 만남
            apple += 1
            
        }
        while apple == snake_length.count {
            // 먹은 사과 개수보다 몸이 길다면
            // 다시 원상복구 및 배열 1 줄이기
            length_map[snake_length[0].0][snake_length[0].1] = "o"
            snake_length.removeFirst()
        }
        
        // 아직 방향 전환 지시가 남아있다면
        // 이동이 끝난 뒤 몸 회전
        if direction.isEmpty == false {
            if time == direction[0].0 {
                if direction[0].1 == "D" { way += 1 }
                else { way -= 1}
                if way > 4 { way = 0 }
                else if way < 1 { way = 4 }
                
                direction.removeFirst()
            }
        }
    }
    print(time)
    
    /*
     0 0 0 0 0 0
     0 0 0 0 0 0
     0 0 0 0 0 1
     0 0 1 0 0 0
     0 1 0 0 0 0
     0 0 0 0 0 0
     
     0 0 0 0 0 0 0 0 0 0 0
     1 0 0 0 0 0 0 0 0 0 0
     1 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0
     1 0 0 0 0 0 0 0 0 0 0
     1 0 0 0 0 0 0 0 0 0 0
     1 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0
     0 0 0 0 0 0 0 0 0 0 0
     */
}
solution()
