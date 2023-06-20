```
import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
 var (a,b,c,d) = (51,51,0,0)
 for i in 0..<wallpaper.count {
     for j in 0..<wallpaper[i].count {
         if wallpaper[i][j] == "#" {
             if i < a { a = i }
             if j < b { b = j }
             if i > c { c = i }
             if j > d { d = j }
         }
     }
 }
 print(a,b,c,d)
 return []
}
```
