# 42
define = 1
s = "# 42{0}define = 1{0}s = {2}{3}{2}{0}l = lambda x: x.write(s.format(chr(10), chr(9), chr(34), s)) and x.close(){0}{0}try:{0}{1}l(open({2}Grace_kid.py{2}, {2}w{2})){0}except OSError:{0}{1}pass{0}"
l = lambda x: x.write(s.format(chr(10), chr(9), chr(34), s)) and x.close()

try:
	l(open("Grace_kid.py", "w"))
except OSError:
	pass
