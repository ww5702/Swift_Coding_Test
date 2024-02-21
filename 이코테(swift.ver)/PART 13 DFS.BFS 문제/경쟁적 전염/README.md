q를 2개 운영해서 bfs로 풀이하는 문제이다.   
해당 바이러스들은 1초씩 점염되고, 낮은 숫자의 바이러스부터 이동하게 된다.   
따라서 k개의 바이러스 배열을 만들고,   
s초 만큼 k개의 바이러스를 반복문으로 실행한다.   
예를 들어 1번의 바이러스가 bfs 하게 되어 동서남북으로 각자 움직이고   
해당 좌표들을 새로운 q에 저장하여 bfs가 끝났을때(1초가 지났을떄)   
해당 바이러스 배열에 다시 넣어준다.   
위와 같은 과정을 s초만큼 반복하여 해당좌표를 출력해준다.   
2%에서 처음에 실패헀는데, bfs 함수를 실행할때 idx를 while문으로 돌아올때 +1해줘야하는것을   
평소의 bfs와 동일하게 생각하여 동서남북 움직일때마다 +1을 해줘버렸다.   
위와 같이 풀이한다면 만약 1번 바이러스가 좌표가 2개라면 1번 좌표만 1초 이동하고 종료하게 된다.   

```
import Foundation

func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    var board = Array(repeating: Array(repeating: 0, count: n), count: n)
    var viruses: [[(Int,Int)]] = Array(repeating: [], count: k)
    let dy = [1,-1,0,0]
    let dx = [0,0,1,-1]
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<n {
            board[i][j] = input[j]
            if input[j] != 0 {
                viruses[input[j]-1].append((i,j))
            }
        }
    }
    let input2 = readLine()!.split(separator: " ").map{Int($0)!}
    let (s,x,y) = (input2[0],input2[1],input2[2])
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    //print(board)
    //print(viruses)
    
    func bfs(_ start: Int) {
        var storeQ: [(Int,Int)] = []
        var q = viruses[start]
        //print(q)
        var idx = 0
        
        while q.count > idx {
            let cur = q[idx]
            //print(cur)
            idx += 1
            visited[cur.0][cur.1] = true
            
            for i in 0..<4 {
                let newY = cur.0 + dy[i]
                let newX = cur.1 + dx[i]
                
                if (0..<n).contains(newY) && (0..<n).contains(newX) {
                    if !visited[newY][newX] {
                        visited[newY][newX] = true
                        board[newY][newX] = start+1
                        storeQ.append((newY,newX))
                        
                    }
                }
            }
        }
        //print(storeQ)
        viruses[start] = storeQ
    }
    
    
    for _ in 0..<s {
        for i in 0..<k {
            bfs(i)
//            for z in 0..<n {
//                print(board[z])
//            }
//            print()
        }
    }
    print(board[x-1][y-1])
}
solution()

/*
 3 3
 1 0 2
 0 0 0
 3 0 0
 2 3 2
 
 
 3 5
 4 0 1
 0 0 0
 0 1 0
 3 3 3
 */


```
