from re import findall
for lo, hi in findall(r'(\d+)-(\d+)', *open(0)):
    b = 0
    for i in range(int(lo), int(hi)+1):
        if findall(r'^(\d+)\1+$', str(i)): b += i

    print(b)

