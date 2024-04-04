```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Double($0)!}
    let (Ax,Ay) = (input[0],input[1])
    let (Bx,By) = (input[2],input[3])
    let (Cx,Cy) = (input[4],input[5])
    let area = (Ax * By + Bx * Cy + Cx * Ay) - (Ay * Bx + By * Cx + Cy * Ax)
    //print(area)
    if (area == 0.0) {
        print(-1.0)
    } else {
        let a1 = sqrt(abs((Ax-Bx) * (Ax-Bx) + (Ay-By) * (Ay-By))) * 2
        let a2 = sqrt(abs((Ax-Cx) * (Ax-Cx) + (Ay-Cy) * (Ay-Cy))) * 2
        let a3 = sqrt(abs((Cx-Bx) * (Cx-Bx) + (Cy-By) * (Cy-By))) * 2
        var big = max(a1, max(a2,a3))
        var small = min(a1, min(a2,a3))
        print(big - small)
    }
}
solution()

```
