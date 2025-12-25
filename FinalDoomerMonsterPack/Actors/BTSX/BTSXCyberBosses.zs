class BTSXCyberdemon : Cyberdemon
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
		TNT1 A 0 A_StartSound("btsxrocketlauncher/charge");
		CYBR F 12 A_SpawnProjectile("CyberBTSXMissile");
		CYBR E 12 A_FaceTarget;
		CYBR F 12 A_SpawnProjectile("CyberBTSXMissile");
		CYBR E 12 A_FaceTarget;
		CYBR F 12 A_SpawnProjectile("CyberBTSXMissile");
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
class BTSXSpiderMastermind : SpiderMastermind
{
	Default
	{
		AttackSound "btsxplasmarifle/fire";
	}
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
		//TNT1 A 0 A_Jump(52, "Grenade");
		TNT1 A 0 A_StartSound("btsxplasmarifle/spinup");
		SPID A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_StartSound("btsxplasmarifle/fireloop");
		SPID GH 1 BRIGHT
		{
			A_SpawnProjectile("ArachnotronBTSXMissile", angle:frandom(-7.2,7.2), pitch:frandom(-4.6,4.6));
			A_SpawnProjectile("ArachnotronBTSXMissile", angle:frandom(-7.2,7.2), pitch:frandom(-4.6,4.6));
		}
		SPID H 1 BRIGHT A_SpidRefire;
		Goto Missile+2;
	Grenade:
		SPID A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_StartSound("btsxbfg9000/charge");
		SPID G 12 A_SpawnProjectile("RageBFGBTSXMissile");
		Goto See;
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