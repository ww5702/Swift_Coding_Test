```
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    /*
    cacheSicze의 배열을 만들고 
    LRU를 사용하므로 캐시 안에 존재하는 값을 제거해준다.
    LRU는 가장 오랫동안 참조되지 않은 값을 교체하는 기법이다.
    찾는 값이 없으면 결과값을 cache miss(5)만큼 증가하고 마지막값 제거
    */
    var result: Int = 0
    var cache: [String] = Array(repeating: "0", count: cacheSize)
    
    if cacheSize != 0 {
        // cache안에 city가 있으면 result + 1 없으면 + 5
        cities.forEach { city in
                       if cache.contains(city.lowercased()) {
                           result += 1
                           cache.remove(at: cache.firstIndex(of: city.lowercased())!)
                       } else {
                           result += 5
                           cache.remove(at: cache.count-1)
                       }
                       cache.insert(city.lowercased(), at: 0)
                       }
    } else {
        return cities.count * 5
    }
    return result
}
```

```
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    /*
    cacheSize의 배열을 만들고 
    LRU를 사용하므로 캐시 안에 존재하는 값을 제거해준다.
    LRU는 가장 오랫동안 참조되지 않은 값을 교체하는 기법이다.
    찾는 값이 없으면 결과값을 cache miss(5)만큼 증가하고 마지막값 제거
    */
    
    /*
    LRU는 값을 찾았다면 0으로 이동시키는 방법으로 한다 
    하지만 이를 뒤집어서 생각한다면 0으로 이동시키는것이 아닌 맨뒤로 append
    해주고 맨앞값을 지워주는 방식과 동일하게 생각할 수도 있다
    
    */
    var result: Int = 0
    var cache: [String] = []
    let newCities = cities.map { return $0.lowercased() }
    print(newCities)
    for city in newCities {
        if cache.contains(city) {
            result += 1
            cache.remove(at: cache.firstIndex(of: city)!)
            cache.append(city)
        } else {
            result += 5
            cache.append(city)
            if cache.count > cacheSize {
                cache.removeFirst()
            }
        }
    }
    return result
}
```
