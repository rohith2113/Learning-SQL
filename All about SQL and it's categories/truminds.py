def ABPairs(N):
    b = 1
    m = 0

    while N + m != 2 * (N ^ m):
        mask = 2 * b - 1
        if ((N + m) & mask) != ((2 * (N ^ m)) & mask):
            m += b
        b *= 2
    pass
    return m



T = int(input())
for _ in range(T):
    N = int(input())
    out_ = ABPairs(N)
    print (out_)