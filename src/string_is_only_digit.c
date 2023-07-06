/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   string_is_only_digit.c                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: fras <fras@student.codam.nl>                 +#+                     */
/*                                                   +#+                      */
/*   Created: 2023/07/06 22:05:25 by fras          #+#    #+#                 */
/*   Updated: 2023/07/06 22:13:30 by fras          ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "lib42-extended.h"

bool	string_is_only_digit(char *str)
{
	if (!*str)
		return(false);
	while (ft_isdigit(*str))
		str++;
	if (str == '\0')
		return(true);
	return(false);
}
