extends Node

var money : float = 0
var guild_level : int = 1

func reset_money():
	money = 0

func reset_guild_level():
	guild_level = 1

func reset_everything():
	reset_money()
	reset_guild_level()
