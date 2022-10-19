# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bhagenlo <bhagenlo@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/26 16:14:12 by bhagenlo          #+#    #+#              #
#    Updated: 2022/10/19 13:33:28 by bhagenlo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minitalk
SNAME = server
CNAME = client
SSRC = server.c
CSRC = client.c
SSOB = $(SSRC:.c=.o)
CSOB = $(CSRC:.c=.o)

CC = cc
CFLAGS = -Wall -Werror -Wextra
UNSAFE_FLAGS = -Wall
LIBFT_DIR = libft

all: $(NAME)

$(NAME): start
	@make $(SNAME) 
	@make $(CNAME)

start:
	@if [ ! -d "libft" ]; then git clone git@github.com:haglobah/libft.git; fi
	@make -C $(LIBFT_DIR)
	@mv ./$(LIBFT_DIR)/libft.a ./libft.a

$(SNAME):
	@$(CC) $(CFLAGS) $(SSRC) libft.a -o $@
	@echo " server ready!"

$(CNAME):
	@$(CC) $(CFLAGS) $(CSRC) libft.a -o $@
	@echo " client ready!"

clean:
	rm -f $(SSOB)
	rm -f $(CSOB)

fclean: clean
	rm -f $(SNAME) $(CNAME)

re: fclean
	@make all
