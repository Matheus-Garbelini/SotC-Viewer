#!/usr/bin/env python
import sys, os, mmap
from struct import unpack

#
# We can brute force everything
#

def xfferr (msg):
    sys.stderr.write (msg)
    sys.exit (1)

digs = {}
def ent (map, pos):
    buf = map[pos:pos+20*4]
    D = unpack ("<20I", buf)

    def r4 (off):
        return map[pos+off:pos+off+4]

    if not buf[0:4] in ["xff\x00", "xff2"]:
        return None

    if D[1] <> 0:
        return None

    if D[2] <> 0:
        return None

    size = D[5]
    entr = D[19]

    buf = r4 (0x50 + 3*4)
    sechdroff = unpack ("<I", buf)[0] + 8 * 4
    secoff = unpack ("<I", r4 (sechdroff + 7*4))[0]
    buf = r4 (secoff + entr)
    if buf ==  "\x01\x00\x00\x00":
        return (size, "skb")
    elif buf == "\x0c\x00\x00\x00":
        return (size, "anb")
    elif buf == "NMO\x00":
        return (size, "nmo")
    elif buf == "NTO2":
        return (size, "nto")
    else:
        return None

def findname (map, pos, ext):
    startpos = pos - 16384
    if startpos < 0:
        startpos = 0
    buf = map[startpos:pos]
    pos = buf.rfind ("." + ext)
    if pos == -1:
        return None
    else:
        pos1 = buf[:pos].rfind ("\x00")
        if pos1 == -1:
            pos1 = 0
        return buf[pos1+1:pos+4]

def main (path):
    x = open (path, "rb")
    x.seek (0, 2)
    s = x.tell ()
    b = 1024*1024*20
    offset = 0

    while s > 0:
        b = min (s, b)
        m = mmap.mmap (x.fileno (), b, None, mmap.ACCESS_READ, offset)
        h = {}

        pos = 0
        chunk = 40000
        while pos < s:
            buf = m[pos:pos+chunk]
            off = buf.find ("xff\x00")

            if off == -1:
                pos += chunk
                continue

            pos += off
            tup = ent (m, pos)
            if tup == None:
                pos += 1
                continue

            size, ext = tup
            name = findname (m, pos, ext)
            if not name in h:
                if name != None and name[0] <> 0x80:             # oh well
                    print "%x %10d %s" % (pos + offset, size, name)
                h[name] = True
            pos += size
        offset += b
        s -= b
        m.close ()

main (sys.argv[1])
