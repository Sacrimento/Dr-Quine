all: colleen grace sully

colleen:
	make -C Colleen

grace:
	make -C Grace

sully:
	make -C Sully

clean:
	make -C Colleen clean
	make -C Grace clean
	make -C Sully clean

fclean:
	make -C Colleen fclean
	make -C Grace fclean
	make -C Sully fclean

re:
	make -C Colleen re
	make -C Grace re
	make -C Sully re

.PHONY = all colleen grace sully clean fclean re
