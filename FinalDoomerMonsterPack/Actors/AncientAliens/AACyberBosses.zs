class AliensCyberdemon : Cyberdemon
{
	States
	{
	Spawn:
		CYBR AB 10 A_Look;
		Loop;
	See:
		CYBR A 3 A_Hoof;
		CYBR ABBCC 3 A_Chase;
		CYBR D 3 A_Metal;
		CYBR D 3 A_Chase;
		Loop;
	Missile:
		CYBR E 6 A_FaceTarget;
		CYBR F 12 A_SpawnProjectile("CyberAAliensMissile");
		CYBR E 12 A_FaceTarget;
		CYBR F 12 A_SpawnProjectile("CyberAAliensMissile");
		CYBR E 12 A_FaceTarget;
		CYBR F 12 A_SpawnProjectile("CyberAAliensMissile");
		Goto See;
	Pain:
		CYBR G 10 A_Pain;
		Goto See;
	Death:
		CYBR H 10;
		CYBR I 10 A_Scream;
		CYBR JKL 10;
		CYBR M 10 A_NoBlocking;
		CYBR NO 10;
		CYBR P 30;
		CYBR P -1 A_BossDeath;
		Stop;
	}
}

class AliensSpiderMastermind : SpiderMastermind
{
	States
	{
	Spawn:
		SPID AB 10 A_Look;
		Loop;
	See:
		SPID A 3 A_Metal;
		SPID ABB 3 A_Chase;
		SPID C 3 A_Metal;
		SPID CDD 3 A_Chase;
		SPID E 3 A_Metal;
		SPID EFF 3 A_Chase;
		Loop;
	Missile:
		SPID A 20 BRIGHT A_FaceTarget;
		TNT1 AA 0 A_SpawnProjectile("BSpidAAlienMissile", 0);
		TNT1 AA 0 A_SpawnProjectile("BSpidAAlienSilencedMissile", 3);
		TNT1 AA 0 A_SpawnProjectile("BSpidAAlienSilencedMissile", -3);
		TNT1 AA 0 A_SpawnProjectile("BSpidAAlienSilencedMissile", 7);
		TNT1 AA 0 A_SpawnProjectile("BSpidAAlienSilencedMissile", -7);
		TNT1 AA 0 A_SpawnProjectile("BSpidAAlienSilencedMissile", 9);
		TNT1 AA 0 A_SpawnProjectile("BSpidAAlienSilencedMissile", -9);
		TNT1 AA 0 A_SpawnProjectile("BSpidAAlienSilencedMissile", 5);
		TNT1 A 0 A_SpawnProjectile("BSpidAAlienSilencedMissile", -5);
		SPID G 4 BRIGHT A_SpawnProjectile("BSpidAAlienSilencedMissile", -5);
		SPID H 4 BRIGHT;
		SPID H 1 BRIGHT A_SpidRefire;
		Goto Missile+1;
	Pain:
		SPID I 3;
		SPID I 3 A_Pain;
		Goto See;
	Death:
		SPID J 20 A_Scream;
		SPID K 10 A_NoBlocking;
		SPID LMNOPQR 10;
		SPID S 30;
		SPID S -1 A_BossDeath;
		Stop;
	}
}