EMOT = ["STOP", "ADD", "SUB", "MULT", "MOVER", "MOVEM", "COMP", "BC", "DIV", "READ", "PRINT", "START",
      "END", "ORIGIN", "EQU", "LTORG", "DS", "DC", "AREG", "BREG", "CREG", "EQ", "LT", "GT", "NE", "ANY"]
file = open("code.txt")
lc=0
symbol=[]

for line in file:
    line = line.replace(",", " ")
    words = line.split()
    if words[0]=="START":
        lc=int(words[1])
    if words[0] not in EMOT:
        symbol.append((words[0],lc))
        lc+=1
    if words[0] in EMOT:
        lc+=1
for k,v in symbol:
    print(k,v)