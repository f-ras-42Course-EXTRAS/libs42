/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   string_is_digit_only.c                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: fras <fras@student.codam.nl>                 +#+                     */
/*                                                   +#+                      */
/*   Created: 2023/07/06 22:05:25 by fras          #+#    #+#                 */
/*   Updated: 2023/07/10 15:19:14 by fras          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libftextended.h"

bool	string_is_digit_only(char *str)
{
	if (!*str)
		return (false);
	while (ft_isdigit(*str))
		str++;
	if (*str == '\0')
		return (true);
	return (false);
}
