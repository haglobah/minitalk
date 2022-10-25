# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    $(MAKE)file                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bhagenlo <bhagenlo@student.42heilbronn.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/26 16:14:12 by bhagenlo          #+#    #+#              #
#    Updated: 2022/10/25 22:13:26 by bhagenlo         ###   ########.fr        #
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
LFT = libft.a

all: $(NAME)

$(NAME): $(LFT)
	@$(MAKE) $(SNAME) 
	@$(MAKE) $(CNAME)

$(LFT):
	@if [ ! -d "libft" ]; then git clone https://github.com/haglobah/libft.git; fi
	@$(MAKE) -C $(LIBFT_DIR)
	@mv ./$(LIBFT_DIR)/libft.a ./libft.a

$(SNAME):
	@$(CC) $(CFLAGS) $(SSRC) libft.a -o $@
	@echo " server ready!"

$(CNAME):
	@$(CC) $(CFLAGS) $(CSRC) libft.a -o $@
	@echo " client ready!"

clean:
	rm -f $(SSOB) $(CSOB)
	make -C $(LIBFT_DIR) clean

fclean: clean
	rm -f $(SNAME) $(CNAME)

re: fclean
	@$(MAKE) all
