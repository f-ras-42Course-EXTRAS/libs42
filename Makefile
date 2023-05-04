# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: fras <fras@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2023/05/01 18:18:49 by fras          #+#    #+#                  #
#    Updated: 2023/05/04 21:01:59 by fras          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libft-extended
CC = gcc
CFLAGS = -Werror -Wextra -Wall $(INCLUDE)
INCLUDE = -I include $(EXT_INCLUDES)
EXT_INCLUDES = $(foreach lib,$(LIBRARY_DIR),-I lib/$(lib)/include)
LIBRARY_DIR = libft ft_printf gnl_lib
LIBRARY_NAMES = libft libftprintf gnl_lib
LIBRARIES = $(addprefix lib/, $(join \
			$(addsuffix /, $(LIBRARY_DIR)), $(addsuffix .a, $(LIBRARY_NAMES))))
SRC_DIR = src
OBJ_DIR = obj
SOURCES = $(shell find $(SRC_DIR) -type f -name "*.c")
OBJECTS = $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(SOURCES:%.c=%.o))
RM = rm -f

# Targets
.PHONY: all clean fclean re directories updatelibs

all: $(NAME)

$(NAME): $(LIBRARIES) directories $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $(OBJECTS) $(LIBRARIES)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $^	

# Libraries

libft: lib/libft/libft.a

ft_printf: lib/ft_printf/libftprintf.a

get_next_line:

$(LIBRARIES):
	$(MAKE) -C lib/$(basename $(notdir $@)) all

updatelibs:
	git submodule update --init

# Directories
directories:
	@find $(SRC_DIR) -type d | sed 's/$(SRC_DIR)/$(OBJ_DIR)/' | xargs mkdir -p

# Cleaning
clean:
	$(RM) $(OBJECTS)
	$(RM) -r obj

fclean: clean
	@for lib in $(LIBRARY_DIR); do \
		$(MAKE) -C lib/$$lib fclean; \
	done
	$(RM) $(NAME)

re: fclean all