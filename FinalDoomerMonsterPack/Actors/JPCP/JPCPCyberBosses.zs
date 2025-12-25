Class JPCPCyberdemon : Cyberdemon
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
		TNT1 A 0 A_StartSound("jpcprocketlauncher/fire");
		CYBR F 12 A_SpawnProjectile("CyberJPCPMissile");
		CYBR E 12 A_FaceTarget;
		TNT1 A 0 A_StartSound("jpcprocketlauncher/fire");
		CYBR F 12 A_SpawnProjectile("CyberJPCPMissile");
		CYBR E 12 A_FaceTarget;
		TNT1 A 0 A_StartSound("jpcprocketlauncher/fire");
		CYBR F 12 A_SpawnProjectile("CyberJPCPMissile");
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

Class JPCPSpiderMastermind : Spidermastermind
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
		TNT1 A 0 A_Jump(12, "Missile2");
		SPID A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_Jump(12, "Missile2");
		//TNT1 A 0 A_Jump(1, "Enraged");
		TNT1 A 0 A_StartSound("jpcpplasmarifle/fire");
		SPID G 2 BRIGHT A_SpawnProjectile("BSpidJPCPMissile");
		TNT1 A 0 A_StartSound("jpcpplasmarifle/fire");
		SPID G 2 BRIGHT A_SpawnProjectile("BSpidJPCPMissile");
		SPID H 1 BRIGHT A_SpidRefire;
		Goto Missile+2;
	Missile2:
		TNT1 A 0 A_Jump(12, "Missile");
		SPID A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_Jump(12, "Missile");
		//TNT1 A 0 A_Jump(4, "光と闇の力");
		SPID G 2 BRIGHT
		{
			A_SpawnProjectile("ChaingunGuyJPCPNeedle", angle:frandom(-1.0,1.0), pitch:frandom(-1.0,1.0));
			A_StartSound("jpcpchaingun/fire");
		}
		SPID G 2 BRIGHT
		{
			A_SpawnProjectile("ChaingunGuyJPCPNeedle", angle:frandom(-1.0,1.0), pitch:frandom(-1.0,1.0));
			A_StartSound("jpcpchaingun/fire");
		}
		SPID H 1 BRIGHT A_SpidRefire;
		Goto Missile2+2;
	光と闇の力:
		TNT1 A 0 A_Jump(12, "Missile2");
		TNT1 A 0 A_StartSound("spider/sight");
		SPID A 35 A_FaceTarget;
		TNT1 A 0 A_PlaySound("jpcpbfg9000/charge", CHAN_WEAPON, 1, 0, 0.8);
		TNT1 A 0 A_PlaySound("jpcpbfg9000/kanji", 7, 0.7, 0, 1.4);
		SPID AA 16 A_FaceTarget;
		TNT1 A 0 A_PlaySound("jpcpbfg9000/orb", 6, 0.7, 0, 1.4);
		SPID H 2 A_SpawnProjectile("CyberJPCPRageMissile");
		SPID A 16 A_FaceTarget;
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