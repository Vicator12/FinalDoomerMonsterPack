class PlayerClassCount : EventHandler
{
	// Global Vars
	int PLUTPlayerCount;
	int TNTPlayerCount;
	int AAPlayerCount;
	int AVPlayerCount;
	int BTSXPlayerCount;
	int JPCPPlayerCount;
	int HELLPlayerCount;
	int WMPlayerCount;
	int DOOMPlayerCount;
}

class PlayerClassCheckHandler : EventHandler
{
	
	PlayerClassCount event;

	// Function for checking whether the given weaponset is used by most players.
	bool CheckPlayerClassCount(int ClassCount)
	{
		event = PlayerClassCount(EventHandler.Find("PlayerClassCount"));
        if (event)
		{
			if (ClassCount == max(event.TNTPlayerCount, event.PLUTPlayerCount, event.AAPlayerCount, event.AVPlayerCount, event.BTSXPlayerCount, event.JPCPPlayerCount, event.HELLPlayerCount, event.WMPlayerCount, event.DOOMPlayerCount))
			{
				return true;
			}
			return false;
		}
		return false;
	}
	
	bool IsVoodooDoll(PlayerPawn mo) 
	{
		return !mo.player || !mo.player.mo || mo.player.mo != mo;
	}

	override void PlayerSpawned (PlayerEvent e)
	{
		event = PlayerClassCount(EventHandler.Find("PlayerClassCount"));
		PlayerInfo player = players[e.PlayerNumber];
        if (event)
		{
			// increments the player count of players using specific weaponset
			if(player.mo is 'FDPlutPlayer')
			{
				event.PLUTPlayerCount += 1;
			}
			
			else if(player.mo is 'FDTNTPlayer')
			{
				event.TNTPlayerCount += 1;
			}
			
			else if(player.mo is 'FDAliensPlayer')
			{
				event.AAPlayerCount += 1;
			}
			
			else if(player.mo is 'FDJPCPPlayer')
			{
				event.JPCPPlayerCount += 1;
			}
			
			else if(player.mo is 'FDBTSXPlayer')
			{
				event.BTSXPlayerCount += 1;
			}
			
			else if(player.mo is 'FDHellboundPlayer')
			{
				event.HELLPlayerCount += 1;
			}
			
			else if(player.mo is 'FDAlienVendettaPlayer')
			{
				event.AVPlayerCount += 1;
			}
			
			else if(player.mo is 'FDWhitemarePlayer')
			{
				event.WMPlayerCount += 1;
			}
			
			else if(player.mo is 'FDDoom2Player')
			{
				event.DOOMPlayerCount += 1;
			}
			//console.printf(string.format(event.DOOMPlayerCount));
		}
	}
	
	void MonsterReplacer(string WeaponsetType, ReplaceEvent e)
	{
		if(e.Replacee == "ZombieMan")
		{
			e.Replacement = WeaponsetType.."ZombieMan";
		}
			
		if(e.Replacee == "ShotgunGuy")
		{
			e.Replacement = WeaponsetType.."ShotgunGuy";
		}
			
		if(e.Replacee == "ChaingunGuy")
		{
			e.Replacement = WeaponsetType.."ChaingunGuy";
		}
		
		if(e.Replacee == "Arachnotron")
		{
			e.Replacement = WeaponsetType.."Arachnotron";
		}
		
		if(e.Replacee == "Cyberdemon")
		{
			e.Replacement = WeaponsetType.."Cyberdemon";
		}
		
		if(e.Replacee == "SpiderMastermind")
		{
			e.Replacement = WeaponsetType.."SpiderMastermind";
		}
	}
	
	override void CheckReplacement(ReplaceEvent e)
	{
		event = PlayerClassCount(EventHandler.Find("PlayerClassCount"));
        if (event)
		{
			//Vanilla stays vanilla, so if it is vanilla, return
			if(CheckPlayerClassCount(event.DOOMPlayerCount))
			{
				return;
			}
			// Monster replacer code for TNT
			else if(CheckPlayerClassCount(event.TNTPlayerCount))
			{
				MonsterReplacer("TNT", e);
			}
			
			// Monster replacer code for Plutonia
			else if(CheckPlayerClassCount(event.PLUTPlayerCount))
			{
				MonsterReplacer("PLUT", e);
			}

			// Monster replacer code for Ancient Aliens
			else if(CheckPlayerClassCount(event.AAPlayerCount))
			{
				MonsterReplacer("Aliens", e);
			}
			
			// Monster replacer code for Alien Vendetta
			else if(CheckPlayerClassCount(event.AVPlayerCount))
			{
				MonsterReplacer("AlienVendetta", e);
			}

			// Monster replacer code for Back To Saturn X
			else if(CheckPlayerClassCount(event.BTSXPlayerCount))
			{
				MonsterReplacer("BTSX", e);
			}

			// Monster replacer code for JaPanese Community Project
			else if(CheckPlayerClassCount(event.JPCPPlayerCount))
			{	
				MonsterReplacer("JPCP", e);
			}

			// Monster replacer code for Hellbound
			else if(CheckPlayerClassCount(event.HELLPlayerCount))
			{
				MonsterReplacer("HellBound", e);
			}

			// Monster replacer code for Whitemare
			else if(CheckPlayerClassCount(event.WMPlayerCount))
			{
				MonsterReplacer("Whitemare", e);
			}
		}
	}
}


