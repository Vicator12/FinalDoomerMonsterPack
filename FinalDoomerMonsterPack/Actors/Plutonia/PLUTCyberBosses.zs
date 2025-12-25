class PlutCyberdemon : CyberDemon 
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
		TNT1 A 0 A_PlaySound("plutrocketlauncher/fire1", CHAN_AUTO, 1, 0, 0.7);
		TNT1 A 0 A_PlaySound("plutrocketlauncher/fire2", 7, 1, 0, 0.4);
		CYBR F 12 A_SpawnProjectile("CyberPlutMissile", angle:frandom(-1.0,1.0));
		CYBR E 12 A_FaceTarget;
		TNT1 A 0 A_PlaySound("plutrocketlauncher/fire1", CHAN_AUTO, 1, 0, 0.7);
		TNT1 A 0 A_PlaySound("plutrocketlauncher/fire2", 7, 1, 0, 0.4);
		CYBR F 12 A_SpawnProjectile("CyberPlutMissile", angle:frandom(-1.0,1.0));
		CYBR E 12 A_FaceTarget;	
		TNT1 A 0 A_PlaySound("plutrocketlauncher/fire1", CHAN_AUTO, 1, 0, 0.7);
		TNT1 A 0 A_PlaySound("plutrocketlauncher/fire2", 7, 1, 0, 0.4);
		CYBR F 12 A_SpawnProjectile("CyberPlutMissile", angle:frandom(-1.0,1.0));
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
class PlutSpiderMastermind : SpiderMastermind
{
	Default
	{
		AttackSound "plutplasmarifle/fire";
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
		SPID G 4 BRIGHT A_CustomBulletAttack(1.2, 0.7, 1, 2*random(2,8), "FDGibBulletPuff", flags:CBAF_NORANDOM);
		SPID H 4 BRIGHT A_CustomBulletAttack(1.2, 0.7, 1, 2*random(2,8), "FDGibBulletPuff", flags:CBAF_NORANDOM);
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