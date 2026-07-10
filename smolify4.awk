#!/usr/bin/awk -f
function max(x, y) {
    return x > y ? x : y
}

function display(s1, s2,        len, i, a1, a2) {
    len = max(length(s1), length(s2))
    if (len % 2) ++len # make len even
    for (i = 1; i<= len; i++) {
        idx = (1*substr(s1, i, 1)) \
            + (2*substr(s1, i+1, 1)) \
            + (4*substr(s2, i, 1)) \
            + (8*substr(s2, i+1, 1))
        printf"%s", (c[idx])
        ++i
    }
    print ""
}

BEGIN {
    c[i++] = " " # 0000 SPACE
    c[i++] = "▘" # 0001 QUADRANT UPPER LEFT
    c[i++] = "▝" # 0010 QUADRANT UPPER RIGHT
    c[i++] = "▀" # 0011 UPPER HALF BLOCK
    c[i++] = "▖" # 0100 QUADRANT LOWER LEFT
    c[i++] = "▌" # 0101 LEFT HALF BLOCK
    c[i++] = "▞" # 0110 QUADRANT UPPER RIGHT AND LOWER LEFT
    c[i++] = "▛" # 0111 QUADRANT UPPER LEFT AND UPPER RIGHT AND LOWER LEFT
    c[i++] = "▗" # 1000 QUADRANT LOWER RIGHT
    c[i++] = "▚" # 1001 QUADRANT UPPER LEFT AND LOWER RIGHT
    c[i++] = "▐" # 1010 RIGHT HALF BLOCK
    c[i++] = "▜" # 1011 QUADRANT UPPER LEFT AND UPPER RIGHT AND LOWER RIGHT
    c[i++] = "▄" # 1100 LOWER HALF BLOCK
    c[i++] = "▙" # 1101 QUADRANT UPPER LEFT AND LOWER LEFT AND LOWER RIGHT
    c[i++] = "▟" # 1110 QUADRANT UPPER RIGHT AND LOWER LEFT AND LOWER RIGHT
    c[i++] = "█" # 1111 FULL BLOCK
}

{
    gsub(/[^[:space:]]/, "1")
    if (NR % 2) {
        prev = $0
    } else {
        display(prev, $0)
    }
}

END {
    if (NR % 2) {
        display(prev, "")
    }
}
