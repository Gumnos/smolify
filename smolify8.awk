#!/usr/bin/awk -f

function display(        len, i, lineidx) {
    # find the length of the longest line in the set of lines
    len = length(data[0])
    for (i=1; i<length(data); i++) {
        if (length(data[i]) > len) {
            len = length
        }
    }
    if (len % 2) ++len # make len even
    idx = 0
    for (i = 1; i<= len; i++) {
        idx = (  1*substr(data[0], i,   1)) \
            + (  2*substr(data[1], i,   1)) \
            + (  4*substr(data[2], i,   1)) \
            + (  8*substr(data[0], i+1, 1)) \
            + ( 16*substr(data[1], i+1, 1)) \
            + ( 32*substr(data[2], i+1, 1)) \
            + ( 64*substr(data[3], i,   1)) \
            + (128*substr(data[3], i+1, 1)) \
            + 0
        printf"%s", (c[idx])
        ++i
    }
    print ""
}

BEGIN {
    for (i=0; i<256; i++) {
        # assumes UTF8
        c[i] = sprintf("%c", 10240+i)
    }
    CELL_DOTS = 8
    LINES = CELL_DOTS / 2
}

{
    gsub(/[^[:space:]]/, "1")
    mod = (NR-1) % LINES
    data[mod] = $0
    if (mod == LINES-1) {
        display()
        delete data
    }
}

END {
    if (NR % LINES < LINES) {
        display()
    }
}
