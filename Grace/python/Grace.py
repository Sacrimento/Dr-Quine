# 42
de = 1
fine = 2

def main():
	f = open("Grace_kid.py", "w")
	s = "# 42{0}de = 1{0}fine = 2{0}{0}def main():{0}{1}f = open({2}Grace_kid.py{2}, {2}w{2}){0}{1}s = {2}{3}{2}{0}{1}f.write(s.format(chr(10), chr(9), chr(34), s)){0}{1}f.close(){0}{0}macro = main{0}macro(){0}"
	f.write(s.format(chr(10), chr(9), chr(34), s))
	f.close()

macro = main
macro()
