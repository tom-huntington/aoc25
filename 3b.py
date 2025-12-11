def f(s, ans='', pos=-1):
    l = len(s.strip())-n+1
    for i in range(n):
        pos = max(range(pos+1, l+i), key=lambda x: s[x])
        ans += s[pos]
    return int(ans)

n = 2
for i in 2, 12: print(sum(map(f, open('3.in'))))
