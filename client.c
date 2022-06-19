/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhagenlo <bhagenlo@student.42heilbronn.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/26 16:08:19 by bhagenlo          #+#    #+#             */
/*   Updated: 2022/06/19 11:34:56 by bhagenlo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_sendc(int pid, char c)
{
	int	index;

	index = -1;
	while (++index < 8)
	{
		if (c & (1 << index))
			kill(pid, SIGUSR2);
		else
			kill(pid, SIGUSR1);
		usleep(SLEEP_TIME);
	}
}

void	ft_sendstr(int pid, char *str)
{
	int	i;

	i = -1;
	while (str[++i])
		ft_sendc(pid, str[i]);
}

int	main(int argc, char *argv[])
{
	if (argc != 3)
	{
		ft_printf("Wrong number of args, namely %i != 3. Sorry.\n", argc);
		return (1);
	}
	ft_sendstr(ft_atoi(argv[1]), argv[2]);
	return (0);
}
