/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bhagenlo <bhagenlo@student.42heilbronn.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/26 16:08:22 by bhagenlo          #+#    #+#             */
/*   Updated: 2022/05/26 16:08:22 by bhagenlo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static void	ft_listen(int signal)
{
	static t_ichar	ic;

	if (signal == SIGUSR2)
		ic.c = ic.c | (1 << ic.index);
	ic.index++;
	if (ic.index == 8)
	{
		ft_printf("%c", ic.c);
		ic.index = 0;
		ic.c = 0;
	}
}

int	main(void)
{
	int	pid;

	pid = (int)getpid();
	ft_printf("%i\n", pid);
	signal(SIGUSR1, ft_listen);
	signal(SIGUSR2, ft_listen);
	while (1)
		pause();
	return (0);
}
