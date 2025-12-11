data = open(0).read().split()

def maxj(s, k):
    r, p = '', 0
    for i in range(k):
        p = max(range(p, len(s)-k+i+1), key=lambda x: s[x])
        r += s[p]
        p += 1
    return int(r)

print([maxj(s, 2) for s in data])
# print(sum(maxj(s, 12) for s in data))
