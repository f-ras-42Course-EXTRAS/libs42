# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: fras <fras@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2022/12/16 14:34:17 by fras          #+#    #+#                  #
#    Updated: 2023/05/04 22:04:38 by fras          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = gnl_lib.a
CC = gcc
CFLAGS = -Werror -Wextra -Wall $(INCLUDE)
INCLUDE = -I ./include
SRC_DIR = .
OBJ_DIR = obj
BUFFER_SIZE = 32
SOURCES = $(shell find $(SRC_DIR) -type l -name "*.c")
OBJECTS = $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(SOURCES:%.c=%.o))


.PHONY: all clean fclean re directories

$(NAME): directories $(OBJECTS)
	ar -rcs $(NAME) $(OBJECTS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $^ -D BUFFER_SIZE=$(BUFFER_SIZE)

all: $(NAME)

directories:
	mkdir $(OBJ_DIR)

clean:
	rm -f $(OBJECTS)
	rm -rf obj

fclean: clean
	rm -f $(NAME)

re: fclean all
