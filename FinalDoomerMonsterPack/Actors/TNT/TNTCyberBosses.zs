class TNTCyberdemon : Cyberdemon
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
		CYBR F 6 TNTCyberAttack;
		CYBR E 3 A_FaceTarget;
		CYBR F 12 TNTCyberAttack;
		CYBR E 3 A_FaceTarget;
		CYBR F 12 TNTCyberAttack;
		CYBR E 3 A_FaceTarget;
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
	
	void TNTCyberAttack()
	{
		if(target)
		{
			A_FaceTarget();
			A_PlaySound("tntrocketlauncher/fire", CHAN_WEAPON, 1, 0, 0.7);
			A_SpawnProjectile("CyberTNTMissile", 32, 0, frandom(-1.0,1.0));
		}
	}
}

//Class TNTCyberMissile : FDTNTMissile
//{
	//Default
	//{
		//species "";
	//}
//}

class TNTSpiderMastermind : SpiderMastermind
{
	Default
	{
		AttackSound "tntshotgun/fire";
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
		SPID A 20 BRIGHT A_FaceTarget;
		SPID G 4 BRIGHT TNTSposAttack;
		SPID H 4 BRIGHT TNTSposAttack;
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
	void TNTSposAttack()
	{
		if(target)
		{
			A_CustomBulletAttack(2.5, 0, 1, 1, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(-2.5, 0, 1, 1, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(1.25, 1.25, 1, 1, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(-1.25, 1.25, 1, 1, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(1.25, -1.25, 1, 1, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(-1.25, -1.25, 1, 1, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
		}
	}
}