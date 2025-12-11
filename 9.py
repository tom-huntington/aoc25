from typing import Tuple
from itertools import pairwise, combinations

def intersects(la: Tuple[complex, complex], lb: Tuple[complex, complex]) -> bool:

    def orient(a: complex, b: complex, c: complex) -> float:
        # Cross product (b - a) × (c - a)
        return (b.real - a.real)*(c.imag - a.imag) - (b.imag - a.imag)*(c.real - a.real)

    def on_segment(a: complex, b: complex, c: complex) -> bool:
        # Given collinearity, check if c lies on segment ab
        return (min(a.real, b.real) <= c.real <= max(a.real, b.real) and
                min(a.imag, b.imag) <= c.imag <= max(a.imag, b.imag))

    p1, p2 = la
    p3, p4 = lb

    o1 = orient(p1, p2, p3)
    o2 = orient(p1, p2, p4)
    o3 = orient(p3, p4, p1)
    o4 = orient(p3, p4, p2)

    # General case
    if (o1 > 0 and o2 < 0 or o1 < 0 and o2 > 0) and \
       (o3 > 0 and o4 < 0 or o3 < 0 and o4 > 0):
        return True

    # Special cases (collinear)
    if o1 == 0 and on_segment(p1, p2, p3): return True
    if o2 == 0 and on_segment(p1, p2, p4): return True
    if o3 == 0 and on_segment(p3, p4, p1): return True
    if o4 == 0 and on_segment(p3, p4, p2): return True

    return False

red = [complex(*eval(l)) for l in open(0) ]
bounds = list(pairwise((*red, red[0])))

def interior_edges(w,z):
    sign = lambda x: (x > 0) - (x < 0)
    d = complex(sign((w-z).real), sign((w-z).imag))
    a, b = w - d, z + d
    return (
    (a, complex(a.real,b.imag)), (complex(a.real,b.imag), b),
    (b, complex(b.real,a.imag)), (complex(b.real,a.imag), a),)

rectedges = [interior_edges(a, b) for (a, b) in combinations(red, 2) ]

cabs = lambda c: complex(abs(c.real), abs(c.imag))
cmul = lambda c: c.real*c.imag
print(max(cmul(cabs(re[0][0]-re[2][0])+3+3j) for re in rectedges if all(not intersects(e, b) for e in re for b in bounds)))
