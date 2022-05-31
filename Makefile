# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bhagenlo <bhagenlo@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/26 16:14:12 by bhagenlo          #+#    #+#              #
#    Updated: 2022/05/31 12:38:39 by bhagenlo         ###   ########.fr        #
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

$(NAME): start server client

start:
	@make -C $(LIBFT_DIR)
	@mv ./$(LIBFT_DIR)/libft.a ./libft.a

server:
	@$(CC) $(CFLAGS) $(SSRC) libft.a -o $@
	@echo " server ready!"

client:
	@$(CC) $(CFLAGS) $(CSRC) libft.a -o $@
	@echo " client ready!"

clean:
	rm -f $(SSOB)
	rm -f $(CSOB)

fclean: clean
	rm -f $(SNAME) $(CNAME)

re: fclean all
