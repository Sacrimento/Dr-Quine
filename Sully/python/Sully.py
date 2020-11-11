import os
X = 5
def main():
	if X < 0:
		return
	s = "import os{0}X = {4}{0}def main():{0}{1}if X < 0:{0}{1}{1}return{0}{1}s = {2}{3}{2}{0}{1}try:{0}{1}{1}f = open({2}Sully_{5}{6}.py{2}.format(X), {2}w{2}){0}{1}except OSError:{0}{1}{1}return{0}{1}f.write(s.format(chr(10), chr(9), chr(34), s, X-1, chr(123), chr(125))){0}{1}f.close(){0}{1}if X <= 0:{0}{1}{1}return{0}{1}os.system({2}python Sully_{5}{6}.py{2}.format(X)){0}{0}main(){0}"
	try:
		f = open("Sully_{}.py".format(X), "w")
	except OSError:
		return
	f.write(s.format(chr(10), chr(9), chr(34), s, X-1, chr(123), chr(125)))
	f.close()
	if X <= 0:
		return
	os.system("python Sully_{}.py".format(X))

main()
