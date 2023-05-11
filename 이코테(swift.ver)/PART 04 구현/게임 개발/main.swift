import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    let location = readLine()!.split(separator: " ").map{Int($0)!}
    var (x,y,direction) = (location[0],location[1],location[2])
    // 주어진 맵
    var map : [[Int]] = []
    // 이미 지나온 길을 1로 표시하기 위한 배열
    var already : [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    for _ in 0..<n {
        map.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    
    // x가 북 동 남 서 로 움직일 수 있는 방법
    let dx = [0,1,0,-1]
    // y가 북 동 남 서 로 움직일 수 있는 방법
    let dy = [-1,0,1,0]
    // 현재 서 있는 좌표를 1로
    already[x][y] = 1
    // 정답 제출을 위한 count
    var count = 1
    // 4번 회전했을때 의 3번 규칙을 위한 turn_time
    var turn_time = 0
    while true {
        // 일단 1번 규칙
        turn_left()
        // 돌고 난 뒤 움직인다면 도착할 곳의 좌표 nx, ny
        let nx = x + dx[direction]
        let ny = y + dy[direction]
        // 만약 움직이려는 곳이 0으로 육지이거나 / 아직 밟아보지 못한 땅이라면 일때의 if
        if already[nx][ny] == 0 && map[nx][ny] == 0 {
            // 밟았기에 지나온땅을 1로 변경
            already[nx][ny] = 1
            // 현재 위치를 나타내는 x와 y를 변경
            x = nx
            y = ny
            // 정답 제출의 count += 1
            count += 1
            turn_time += 1
            continue
        } else {
            // 만약 갈 길이 없다면 ( 이미 밟았던 땅이거나 / 바다이거나 ) turn_time만 += 1
            turn_time += 1
        }
        // 만약 4번 회전했다면 3번 규칙 실행
        if turn_time == 4 {
            // 왔던 방향 그대로 뒤로 한칸 이동
            let nx = x - dx[direction]
            let ny = y - dy[direction]
            // 만약 뒤로 한칸 이동해야하는 곳이 땅이라면 이동, 땅이 아니라 바다라면 종료.
            // 해당 규칙에는 이미 밟았던 땅인지 아닌지는 중요하지 않음
            if map[nx][ny] == 0 {
                x = nx
                y = ny
            } else {
                break
            }
            turn_time = 0
        }
    }
    func turn_left() {
        direction -= 1
        if direction == -1 {
            direction = 3
        }
    }
    print(count)
}
solution()
