/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   fr_atol.c                                          :+:    :+:            */
/*                                                     +:+                    */
/*   By: fras <fras@student.codam.nl>                 +#+                     */
/*                                                   +#+                      */
/*   Created: 2023/05/03 23:19:49 by fras          #+#    #+#                 */
/*   Updated: 2023/07/06 19:25:46 by fras          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

long	ft_atol(const char *str)
{
	long	rtn;
	int		i;
	int		sign;

	i = 0;
	rtn = 0;
	sign = 1;
	while (str[i] == '\t' || str[i] == '\n' || str[i] == '\v'
		|| str[i] == '\f' || str[i] == '\r' || str[i] == ' ')
		i++;
	if (str[i] == '-')
	{
		sign = -1;
		i++;
	}
	else if (str[i] == '+')
		i++;
	while (str[i] >= '0' && str[i] <= '9')
	{
		rtn *= 10;
		rtn += str[i++] - '0';
	}
	return (rtn * sign);
}
