class TNTZombieMan : ZombieMan
{
 	Default
	{
		AttackSound "tntpistol/fire";
	}
	States
	{
	Spawn:
		POSS AB 10 A_Look;
		Loop;
	See:
		POSS AABBCCDD 4 A_Chase;
		Loop;
	Missile:
		POSS E 10 A_FaceTarget;
		POSS F 8 BRIGHT A_CustomBulletAttack(1.5, 1.0, 1, randompick(4,5,6), "FDBulletPuff", flags:CBAF_NORANDOM);
		POSS E 8;
		Goto See;
	Pain:
		POSS G 3;
		POSS G 3 A_Pain;
		Goto See;
	Death:
		POSS H 5;
		POSS I 5 A_Scream;
		POSS J 5 A_NoBlocking;
		POSS K 5;
		POSS L -1;
		Stop;
	XDeath:
		POSS M 5;
		POSS N 5 A_XScream;
		POSS O 5 A_NoBlocking;
		POSS PQRST 5;
		POSS U -1;
		Stop;
	Raise:
		POSS K 5;
		POSS JIH 5;
		Goto See;
	}
}

class TNTShotgunGuy : ShotgunGuy
{
	Default
	{
		AttackSound "tntshotgun/fire";
	}
	States
	{
	Spawn:
		SPOS AB 10 A_Look;
		Loop;
	See:
		SPOS AABBCCDD 3 A_Chase;
		Loop;
	Missile:
		SPOS E 10 A_FaceTarget;
		SPOS F 10 BRIGHT TNTSposAttack();
		SPOS E 10;
		Goto See;
	Pain:
		SPOS G 3;
		SPOS G 3 A_Pain;
		Goto See;
	Death:
		SPOS H 5;
		SPOS I 5 A_Scream;
		SPOS J 5 A_NoBlocking;
		SPOS K 5;
		SPOS L -1;
		Stop;
	XDeath:
		SPOS M 5;
		SPOS N 5 A_XScream;
		SPOS O 5 A_NoBlocking;
		SPOS PQRST 5;
		SPOS U -1;
		Stop;
	Raise:
		SPOS L 5;
		SPOS KJIH 5;
		Goto See;
	}
	
	void TNTSposAttack()
	{
		if(target)
		{
			A_CustomBulletAttack(2.5, 0, 1, 2, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(-2.5, 0, 1, 2, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(1.25, 1.25, 1, 2, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(-1.25, 1.25, 1, 2, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(1.25, -1.25, 1, 2, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
			A_CustomBulletAttack(-1.25, -1.25, 1, 2, "FDBulletPuff", flags:CBAF_EXPLICITANGLE);
		}
	}
}

class TNTChaingunGuy : ChaingunGuy
{
	Default
	{
		AttackSound "tntchaingun/fire";
	}
	States
	{
	Spawn:
		CPOS A 1 A_StopSound(7);
		CPOS AB 10 A_Look;
		Loop;
	See:
		CPOS A 1 A_StopSound(7);
		CPOS AABBCCDD 3 A_Chase;
		Loop;
	Missile:
		CPOS E 10 A_FaceTarget;
		CPOS FE 4 BRIGHT TNTCPosAttack;
		CPOS E 0 A_StartSound("tntchaingun/fire", 7, 1, 1, 0.7);
		CPOS F 1 A_CPosRefire;
		Goto Missile+1;
	Pain:
		CPOS G 1 A_StopSound(7);
		CPOS G 2;
		CPOS G 3 A_Pain;
		Goto See;
	Death:
		CPOS H 1 A_StopSound(7);
		CPOS H 4;
		CPOS I 5 A_Scream;
		CPOS J 5 A_NoBlocking;
		CPOS KLM 5;
		CPOS N -1;
		Stop;
	XDeath:
		CPOS O 1 A_StopSound(7);
		CPOS O 4;
		CPOS P 5 A_XScream;
		CPOS Q 5 A_NoBlocking;
		CPOS RS 5;
		CPOS T -1;
		Stop;
	Raise:
		CPOS N 5;
		CPOS MLKJIH 5;
		Goto See;
	}
	
	void TNTCposAttack()
	{
		if(target)
		{
			A_CustomBulletAttack(5.5, 3.5, 1, randompick(2,3), "FDBulletPuff", flags:FBF_NORANDOM);
			A_CustomBulletAttack(5.5, 3.5, 1, randompick(2,3), "FDBulletPuff", flags:FBF_NORANDOM);
		}
	}
}