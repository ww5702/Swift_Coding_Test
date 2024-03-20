# LRU(Least Recently Used Algorithm)
쉽게 말해서 가장 최근에 사용한 내용을 첫번째로 가져다놓아   
다음에 또 사용하게 된다면 바로 꺼낼 수 있도록 구현하는 알고리즘이다.   
   
캐시의 크기가 3이고   
A,B,C,B,D가 들어가야한다면   
A   
B A   
C B A   
크기 3이 찰떄까지 위와 같이 삽입된뒤   
B가 캐시 안에 있으므로 맨앞에 추가   
B C A   
D는 없으므로 가장 오래된 A를 제거   
D B C 가 되는 구조이다.   
   
swift로 구현한다면    
```
var cache: [String] = []
    //print(newCities)
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
```
cache에 이미 삽입되어있던 도시가 나온다면 해당 도시 삭제 후 가장 뒤로 다시 삽입   
만약 없다면 append, 이미 cacheSize를 넘겼다면 가장 오래된 배열 삭제   
   
java로 구현한다면      
```
List<String> cache = new ArrayList<>();
for (int i = 0; i < cities.length; i++) {
  String city = cities[i].toLowerCase();
  // miss
  if (!cache.contains(city)) {
    answer += 5;
    if (cache.size() >= cacheSize) {
      cache.remove(0);
    }
    cache.add(city);
    continue;
  }
  if (cache.contains(city)) {
    cache.remove(city);
    cache.add(city);
    answer += 1;
  }
```

# LFU (Least Frequently Used) 
반대로 가장 자주 사용되지 않을때이다.   
캐시의 크기가 3이고   
A,B,C,B,D가 들어가야한다면   
A   
B A   
C B A   
크기 3이 찰떄까지 위와 같이 삽입된뒤   
B가 또 들어갈때 총 2회 삽입됨으로   
C B A 이지만 B는 count 2   
D가 들어온다면 count 1회인 데이터중 가장 마지막 데이터인 A삭제   
C B D   
   
