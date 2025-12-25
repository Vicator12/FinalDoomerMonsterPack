class PlayerClassCount : EventHandler
{
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

	override void PlayerSpawned (PlayerEvent e)
	{
		event = PlayerClassCount(EventHandler.Find("PlayerClassCount"));
        if (event)
		{
			if(players[e.PlayerNumber].mo is 'FDPlutPlayer')
			{
				event.PLUTPlayerCount += 1;
			}
			
			else if(players[e.PlayerNumber].mo is 'FDTNTPlayer')
			{
				event.TNTPlayerCount += 1;
			}
			
			else if(players[e.PlayerNumber].mo is 'FDAliensPlayer')
			{
				event.AAPlayerCount += 1;
			}
			
			else if(players[e.PlayerNumber].mo is 'FDJPCPPlayer')
			{
				event.JPCPPlayerCount += 1;
			}
			
			else if(players[e.PlayerNumber].mo is 'FDBTSXPlayer')
			{
				event.BTSXPlayerCount += 1;
			}
			
			else if(players[e.PlayerNumber].mo is 'FDHellboundPlayer')
			{
				event.HELLPlayerCount += 1;
			}
			
			else if(players[e.PlayerNumber].mo is 'FDAlienVendettaPlayer')
			{
				event.AVPlayerCount += 1;
			}
			
			else if(players[e.PlayerNumber].mo is 'FDWhitemarePlayer')
			{
				event.WMPlayerCount += 1;
			}
			
			else if(players[e.PlayerNumber].mo is 'FDDoom2Player')
			{
				event.DOOMPlayerCount += 1;
			}
		}
	}
	
	override void CheckReplacement(ReplaceEvent e)
	{
		event = PlayerClassCount(EventHandler.Find("PlayerClassCount"));
        if (event)
		{
			if(!(CheckPlayerClassCount(event.DOOMPlayerCount)))
			{
				if(CheckPlayerClassCount(event.TNTPlayerCount))
				{
					if(e.Replacee == 'ZombieMan')
					{
						e.Replacement = 'TNTZombieMan';
					}
					
					if(e.Replacee == 'ShotgunGuy')
					{
						e.Replacement = 'TNTShotgunGuy';
					}
					
					if(e.Replacee == 'ChaingunGuy')
					{
						e.Replacement = 'TNTChaingunGuy';
					}
					
					if(e.Replacee == 'Arachnotron')
					{
						e.Replacement = 'TNTArachnotron';
					}
					
					if(e.Replacee == 'Cyberdemon')
					{
						e.Replacement = 'TNTCyberdemon';
					}
					
					if(e.Replacee == 'SpiderMastermind')
					{
						e.Replacement = 'TNTSpiderMastermind';
					}
				}
				
				if(CheckPlayerClassCount(event.PLUTPlayerCount))
				{
					if(e.Replacee == 'ZombieMan')
					{
						e.Replacement = 'PLUTZombieMan';
					}
					
					if(e.Replacee == 'ShotgunGuy')
					{
						e.Replacement = 'PLUTShotgunGuy';
					}
					
					if(e.Replacee == 'ChaingunGuy')
					{
						e.Replacement = 'PLUTChaingunGuy';
					}
					
					if(e.Replacee == 'Arachnotron')
					{
						e.Replacement = 'PLUTArachnotron';
					}
					
					if(e.Replacee == 'Cyberdemon')
					{
						e.Replacement = 'PLUTCyberdemon';
					}
					
					if(e.Replacee == 'SpiderMastermind')
					{
						e.Replacement = 'PLUTSpiderMastermind';
					}
				}
				
				if(CheckPlayerClassCount(event.AAPlayerCount))
				{
					if(e.Replacee == 'ZombieMan')
					{
						e.Replacement = 'AliensZombieMan';
					}
					
					if(e.Replacee == 'ShotgunGuy')
					{
						e.Replacement = 'AliensShotgunGuy';
					}
					
					if(e.Replacee == 'ChaingunGuy')
					{
						e.Replacement = 'AliensChaingunGuy';
					}
					
					if(e.Replacee == 'Arachnotron')
					{
						e.Replacement = 'AliensArachnotron';
					}
					
					if(e.Replacee == 'Cyberdemon')
					{
						e.Replacement = 'AliensCyberdemon';
					}
					
					if(e.Replacee == 'SpiderMastermind')
					{
						e.Replacement = 'AliensSpiderMastermind';
					}
				}
				
				if(CheckPlayerClassCount(event.AVPlayerCount))
				{
					if(e.Replacee == 'ZombieMan')
					{
						e.Replacement = 'AlienVendettaZombieMan';
					}
					
					if(e.Replacee == 'ShotgunGuy')
					{
						e.Replacement = 'AlienVendettaShotgunGuy';
					}
					
					if(e.Replacee == 'ChaingunGuy')
					{
						e.Replacement = 'AlienVendettaChaingunGuy';
					}
					
					if(e.Replacee == 'Arachnotron')
					{
						e.Replacement = 'AlienVendettaArachnotron';
					}
					
					if(e.Replacee == 'Cyberdemon')
					{
						e.Replacement = 'AlienVendettaCyberdemon';
					}
					
					if(e.Replacee == 'SpiderMastermind')
					{
						e.Replacement = 'AlienVendettaSpiderMastermind';
					}
				}
				
				if(CheckPlayerClassCount(event.BTSXPlayerCount))
				{
					if(e.Replacee == 'ZombieMan')
					{
						e.Replacement = 'BTSXZombieMan';
					}
					
					if(e.Replacee == 'ShotgunGuy')
					{
						e.Replacement = 'BTSXShotgunGuy';
					}
					
					if(e.Replacee == 'ChaingunGuy')
					{
						e.Replacement = 'BTSXChaingunGuy';
					}
					
					if(e.Replacee == 'Arachnotron')
					{
						e.Replacement = 'BTSXArachnotron';
					}
					
					if(e.Replacee == 'Cyberdemon')
					{
						e.Replacement = 'BTSXCyberdemon';
					}
					
					if(e.Replacee == 'SpiderMastermind')
					{
						e.Replacement = 'BTSXSpiderMastermind';
					}
				}
				
				if(CheckPlayerClassCount(event.JPCPPlayerCount))
				{
					if(e.Replacee == 'ZombieMan')
					{
						e.Replacement = 'JPCPZombieMan';
					}
					
					if(e.Replacee == 'ShotgunGuy')
					{
						e.Replacement = 'JPCPShotgunGuy';
					}
					
					if(e.Replacee == 'ChaingunGuy')
					{
						e.Replacement = 'JPCPChaingunGuy';
					}
					
					if(e.Replacee == 'Arachnotron')
					{
						e.Replacement = 'JPCPArachnotron';
					}
					
					if(e.Replacee == 'Cyberdemon')
					{
						e.Replacement = 'JPCPCyberdemon';
					}
					
					if(e.Replacee == 'SpiderMastermind')
					{
						e.Replacement = 'JPCPSpiderMastermind';
					}
				}
				
				if(CheckPlayerClassCount(event.HELLPlayerCount))
				{
					if(e.Replacee == 'ZombieMan')
					{
						e.Replacement = 'PLUTZombieMan';
					}
					
					if(e.Replacee == 'ShotgunGuy')
					{
						e.Replacement = 'HellBoundShotgunGuy';
					}
					
					if(e.Replacee == 'ChaingunGuy')
					{
						e.Replacement = 'HellBoundChaingunGuy';
					}
					
					if(e.Replacee == 'Arachnotron')
					{
						e.Replacement = 'HellBoundArachnotron';
					}
					
					if(e.Replacee == 'Cyberdemon')
					{
						e.Replacement = 'HellBoundCyberdemon';
					}
					
					if(e.Replacee == 'SpiderMastermind')
					{
						e.Replacement = 'HellBoundSpiderMastermind';
					}
				}
				
				if(CheckPlayerClassCount(event.WMPlayerCount))
				{
					if(e.Replacee == 'ZombieMan')
					{
						e.Replacement = 'WhitemareZombieMan';
					}
					
					if(e.Replacee == 'ShotgunGuy')
					{
						e.Replacement = 'WhitemareShotgunGuy';
					}
					
					if(e.Replacee == 'ChaingunGuy')
					{
						e.Replacement = 'WhitemareChaingunGuy';
					}
					
					if(e.Replacee == 'Arachnotron')
					{
						e.Replacement = 'WhitemareArachnotron';
					}
					
					if(e.Replacee == 'Cyberdemon')
					{
						e.Replacement = 'WhitemareCyberdemon';
					}
					
					if(e.Replacee == 'SpiderMastermind')
					{
						e.Replacement = 'WhitemareSpiderMastermind';
					}
				}
			}
		}
	}
}