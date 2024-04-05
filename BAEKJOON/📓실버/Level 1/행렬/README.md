dfs가 아니라 그리디로 풀이한다고 생각하면 더 편하다.   
50줄이 최대이기 때문이다.   
위에서부터 [i][j]씩 비교하는데 범위는 -3까지이다.   
0열을 기준으로 생각해봤을떄   
다를때마다 change함수를 실행해준다.   
한 열이 다 변화가 끝냈을떄   
한열을 검사해본다.   
만약 틀린게 있다면 절대 서로 같게 만들 수 없다는 뜻이다.   

```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var matrixA: [[String]] = []
    var matrixB: [[String]] = []
    var cnt = 0
    
    for _ in 0..<n {
        let input = Array(readLine()!).map{(String($0))}
        matrixA.append(input)
    }
    for _ in 0..<n {
        let input = Array(readLine()!).map{(String($0))}
        matrixB.append(input)
    }
    //print(matrixA, matrixB)
    var isPossible = true
    func changeBoard() {
        if n < 3 || m < 3 {return}
        
        for i in 0..<n-2 {
            for j in 0..<m-2 {
                if matrixA[i][j] != matrixB[i][j] {
                    reverseBoard(i, j)
                    cnt += 1
                }
                
                if j == m-3 {
                    for k in m-3..<m {
                        if (matrixA[i][k] != matrixB[i][k]) { return }
                    }
                }
            }
        }
    }
    
    func reverseBoard(_ y: Int, _ x: Int) {
        for r in y..<y+3 {
            for c in x..<x+3 {
                matrixA[r][c] = matrixA[r][c] == "0" ? "1" : "0"
            }
        }
    }
    
    changeBoard()
    print(matrixA == matrixB ? cnt : -1)
    
}
solution()

```
