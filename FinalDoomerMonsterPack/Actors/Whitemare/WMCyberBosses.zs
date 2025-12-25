class WhitemareCyberdemon : Cyberdemon
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
		CYBR E 6 A_Facetarget();
		CYBR F 12 WhiteMareCyberAttack;
		CYBR E 12 A_Facetarget();
		CYBR F 12 WhiteMareCyberAttack;
		CYBR E 12 A_Facetarget();
		CYBR F 12 WhiteMareCyberAttack;
		Goto See;
	Missile2:
		Goto Missile;
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
	
	void WhiteMareCyberAttack()
	{
		if(target)
		{
			A_FaceTarget();
			A_PlaySound("whitemarerocketlauncher/fire", CHAN_WEAPON, 1, 0, 0.7);
			A_SpawnProjectile("CyberWMMissile", 64, 0, random2(1));
		}
	}
}

class WhitemareSpiderMastermind : SpiderMastermind
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
		BSPI A 0 A_JumpIfCloser(252, "FlamenWerfer");
		SPID A 20 BRIGHT A_FaceTarget;
		SPID G 4 A_CustomBulletAttack(25,15, random(8,16), random(2,4), "FDWhitemareBlueBulletPuff", flags:CBAF_NORANDOM);
		SPID H 4 A_CustomBulletAttack(25,15, random(8,16), random(2,4), "FDWhitemareBlueBulletPuff", flags:CBAF_NORANDOM);
		SPID H 1 BRIGHT A_SpidRefire;
		BSPI A 0 A_JumpIfCloser(252, "FlamenWerfer");
		Goto Missile+2;
	Flamenwerfer:
		SPID A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_StartSound("whitemareplasmarifle/fire", 37, attenuation:1.2);
		TNT1 A 0 A_StartSound("whitemareplasmarifle/fire2", 35, attenuation:1.2);
		TNT1 A 0 A_StartSound("whitemareplasmarifle/fireloop", 31, flags:CHANF_LOOPING, attenuation:1.1);
		TNT1 A 0 A_StartSound("whitemareplasmarifle/fireloop2", 36, flags:CHANF_LOOPING, attenuation:0.7);
		TNT1 AAAA 0 A_SpawnProjectile ("BSpidWMMissile");
		SPID GG 2 A_SpawnProjectile ("BSpidWMMissile");
		SPID H 2 BRIGHT;
		SPID H 1 BRIGHT A_MonsterRefire(10, "FlameEnd");
		Goto FlameLoop;
	FlameLoop:
		TNT1 AAAA 0 A_SpawnProjectile ("BSpidWMMissile");
		SPID GG 2 A_SpawnProjectile ("BSpidWMMissile");
		SPID H 0 BRIGHT;
		SPID H 0 BRIGHT A_MonsterRefire(10, "FlameEnd");
		SPID A 0 A_JumpIfCloser(352, "FlameLoop");
		Goto FlameEnd;
	FlameEnd:
		TNT1 A 0 A_PlaySound("whitemareplasmarifle/fireend");
		TNT1 A 0 A_StopSound (35);
		TNT1 A 0 A_StopSound (37);
		TNT1 A 0 A_StopSound (31);
		TNT1 A 0 A_StopSound (36);
		SPID A 15;
		Goto See+1;
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