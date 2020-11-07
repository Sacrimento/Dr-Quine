NAME = Colleen
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

diff:
	./c/$(NAME) > c_out
	diff c_out $(C_SRC)

	./asm/$(NAME) > asm_out
	diff asm_out $(ASM_SRC) 

	python3 $(PY_SRC) > py_out
	diff py_out $(PY_SRC)

clean:
	@rm -rf $(OBJ_DIR)
	@rm -rf c_out py_out asm_out

fclean: clean
	@rm -rf c/$(NAME)
	@rm -rf asm/$(NAME)

.PHONY = all clean fclean re c asm diff asm/$(NAME) c/$(NAME)
