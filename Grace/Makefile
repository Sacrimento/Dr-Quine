NAME = Grace
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
	rm -f $(NAME)_kid.c
	./c/$(NAME)
	diff $(NAME)_kid.c $(C_SRC)

	rm -f $(NAME)_kid.s
	./asm/$(NAME)
	diff $(NAME)_kid.s $(ASM_SRC) 

	rm -f $(NAME)_kid.py
	python3 $(PY_SRC)
	diff $(NAME)_kid.py $(PY_SRC)

clean:
	@rm -rf $(OBJ_DIR)
	@rm -f $(NAME)_kid.c $(NAME)_kid.s $(NAME)_kid.py
	@rm -f c/$(NAME)_kid.c asm/$(NAME)_kid.s python/$(NAME)_kid.py

fclean: clean
	@rm -rf c/$(NAME)
	@rm -rf asm/$(NAME)

.PHONY = all clean fclean re c asm diff asm/$(NAME) c/$(NAME)
