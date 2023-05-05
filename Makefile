# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: fras <fras@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2023/05/01 18:18:49 by fras          #+#    #+#                  #
#    Updated: 2023/05/05 02:27:32 by fras          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libft-extended.a
CC = gcc
CFLAGS = -Werror -Wextra -Wall $(INCLUDE)
INCLUDE = -I include $(EXT_INCLUDES)
EXT_INCLUDES = $(foreach lib,$(LIBRARY_DIR),-I lib/$(lib)/include)
LIB_DIR = libft ft_printf gnl_lib
LIBRARIES = libft.a libftprintf.a gnl_lib.a
USED_LIBS = $(shell find -type f -name "*.a")
LIBRARY_PATHS = $(addprefix lib/, $(join \
			$(addsuffix /, $(LIB_DIR)), $(LIBRARIES)))
SRC_DIR = src
OBJ_DIR = obj
SOURCES = $(shell find $(SRC_DIR) -type f -name "*.c")
OBJECTS = $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(SOURCES:%.c=%.o))
RM = rm -f

# Functions
find_lib_path = $(filter %/$(1), $(LIBRARY_PATHS))

# Targets
.PHONY: all clean fclean re directories updatelibs

all: $(NAME)

$(NAME): directories $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $(OBJECTS)
	@echo "DONE... Succesful libraries used: $(USED_LIBS)"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $^	

# Libraries
$(LIBRARIES):
	$(MAKE) $(call find_lib_path,$@)
	cp $(call find_lib_path,$@) $@
	@echo "DONE... Succesful libraries used: $(USED_LIBS)"

$(LIBRARY_PATHS):
	$(MAKE) -C $(dir $@) all

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
	@for lib in $(LIB_DIR); do \
		$(MAKE) -C lib/$$lib fclean; \
	done
	$(RM) $(LIBRARIES) $(NAME)

re: fclean all