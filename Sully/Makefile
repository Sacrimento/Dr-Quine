NAME = Sully
FLAGS = -Wall -Werror -Wextra

OBJ_DIR = ./obj/

ASM_SRC = asm/$(NAME).s
C_SRC = c/$(NAME).c
PY_SRC = python/$(NAME).py

OBJ_C = $(addprefix $(OBJ_DIR), $(C_SRC:.c=.o))
OBJ_ASM = $(addprefix $(OBJ_DIR), $(ASM_SRC:.s=.o))

all: c asm

re: fclean all

c: c/$(NAME)

c/$(NAME): $(OBJ_C)
	@clang -o c/$(NAME) $^

$(OBJ_DIR)%.o : %.c
	@mkdir -p $(OBJ_DIR)c
	@clang $(FLAGS) -o $@ -c $^ 

asm: asm/$(NAME)

asm/$(NAME): $(OBJ_ASM)
	@clang -o asm/$(NAME) $^

$(OBJ_DIR)%.o : %.s
	@mkdir -p $(OBJ_DIR)asm
	@nasm -f elf64 -o $@ $^

diff: all
	@rm -f c/$(NAME)_* asm/$(NAME)_* python/$(NAME)_*
	@rm -f $(NAME)_* $(NAME)_* $(NAME)_*

	./c/$(NAME)
	-diff c/$(NAME).c $(NAME)_5.c
	-diff $(NAME)_5.c $(NAME)_4.c
	-diff $(NAME)_4.c $(NAME)_3.c
	-diff $(NAME)_3.c $(NAME)_2.c
	-diff $(NAME)_2.c $(NAME)_1.c
	-diff $(NAME)_1.c $(NAME)_0.c

	./asm/$(NAME)
	-diff asm/$(NAME).s $(NAME)_5.s
	-diff $(NAME)_5.s $(NAME)_4.s
	-diff $(NAME)_4.s $(NAME)_3.s
	-diff $(NAME)_3.s $(NAME)_2.s
	-diff $(NAME)_2.s $(NAME)_1.s
	-diff $(NAME)_1.s $(NAME)_0.s

	python3 $(PY_SRC)
	-diff python/$(NAME).py $(NAME)_5.py
	-diff $(NAME)_5.py $(NAME)_4.py
	-diff $(NAME)_4.py $(NAME)_3.py
	-diff $(NAME)_3.py $(NAME)_2.py
	-diff $(NAME)_2.py $(NAME)_1.py
	-diff $(NAME)_1.py $(NAME)_0.py

clean:
	@rm -rf $(OBJ_DIR)
	@rm -f c/$(NAME)_* asm/$(NAME)_*  python/$(NAME)_*
	@rm -f $(NAME)_* $(NAME)_* $(NAME)_*

fclean: clean
	@rm -rf c/$(NAME)
	@rm -rf asm/$(NAME)

.PHONY = all clean fclean re c asm diff asm/$(NAME) c/$(NAME)
