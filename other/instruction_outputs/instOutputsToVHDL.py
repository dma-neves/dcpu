import sys

args = sys.argv
codeFile = args[1]
f = open(codeFile,'r')

outs = {}

inst = ""
for line in f:

    if ':' in line:
        inst = line[:-2]
    
    elif not ('#' in line) :
        
        words = line.split()
        if len(words) != 0:

            o = words[0]

            if o in outs:
                outs[o].append(inst)
            else:
                outs[o] = [inst]

for k in outs:

    print(k + " <= En and (", end = '')

    i = 0
    for o in outs[k]:
        print(o, end = '')

        if i < len(outs[k])-1:
            print(' or ', end = '')

        i += 1

    print(');')
