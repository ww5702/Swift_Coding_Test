import Foundation
func solution() {
    let n = Int(readLine()!)!
    var coin = Array(readLine()!.split(separator: " ").map{Int($0)!})
    coin.sort(by: >)
    print(coin)
    var guess = 0
    while true {
        guess += 1
        var result = guess
        for i in coin {
            if result >= i {
                result -= i
            }
        }
        if result != 0 {
            print(guess)
            break
            
        }
    }
    
}
solution()
