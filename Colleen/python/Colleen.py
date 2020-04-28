# 42

def p(s):
	print(s.format(chr(10), chr(9), chr(34), s))

def main():
	# Another one
	s = "# 42{0}{0}def p(s):{0}{1}print(s.format(chr(10), chr(9), chr(34), s)){0}{0}def main():{0}{1}# Another one{0}{1}s = {2}{3}{2}{0}{1}p(s){0}{0}main()"
	p(s)

main()
