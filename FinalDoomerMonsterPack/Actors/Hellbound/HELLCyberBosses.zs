class HellBoundCyberdemon : Cyberdemon
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
	MissileAngry:
		goto Missile+1;
	Missile:
		//TNT1 A 0 A_JumpIfHealthLower(2000, "Enraged");
		CYBR E 6 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundrocketlauncher/throw");
		CYBR F 12 A_SpawnProjectile("CyberHBoundMissile");
		CYBR E 12 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundrocketlauncher/throw");
		CYBR F 12 A_SpawnProjectile("CyberHBoundMissile");
		CYBR E 12 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundrocketlauncher/throw");
		CYBR F 12 A_SpawnProjectile("CyberHBoundMissile");
		Goto See;
	Enraged:
		TNT1 A 0 A_Jump(232, "MissileAngry");
		TNT1 A 0 A_StartSound("cyber/sight");
		CYBR E 35 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundbfg9000/charge");
		CYBR E 16 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundbfg9000/load");
		CYBR E 16 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundbfg9000/fire");
		TNT1 A 0 A_StartSound("hellboundbfg9000/firemain");
		CYBR F 2 A_SpawnProjectile("CyberHBoundRageMissile");
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
class HellBoundSpiderMastermind : SpiderMastermind
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
	MissileAngry:
		goto Missile+1;
	Missile:
		//TNT1 A 0 A_JumpIfHealthLower(1500, "Enraged");
		TNT1 A 0 A_StartSound("hellboundplasmarifle/up");
		SPID A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundplasmarifle/spin");
		TNT1 A 0 A_StartSound("hellboundplasmarifle/add");
		TNT1 A 0 A_StartSound("hellboundplasmarifle/fire");
		SPID GHGH 1 BRIGHT 
		{
			A_SpawnProjectile("BSpidHBoundMissile", angle:frandom(3.0,-3.0), pitch:frandom(1.0,-1.0));
			A_SpawnProjectile("BSpidHBoundMissile", angle:frandom(3.0,-3.0), pitch:frandom(1.0,-1.0));
			A_SpawnProjectile("BSpidHBoundMissile", angle:frandom(3.0,-3.0), pitch:frandom(1.0,-1.0));
			A_SpawnProjectile("BSpidHBoundMissile", angle:frandom(3.0,-3.0), pitch:frandom(1.0,-1.0));
		}
		SPID H 1 BRIGHT A_MonsterRefire(10, "WindDown");
		Goto Missile+3;
	WindDown:
		SPID A 35 A_StartSound("hellboundplasmarifle/down");
		Goto See;
	Enraged:
		TNT1 A 0 A_Jump(232, "MissileAngry");
		TNT1 A 0 A_StartSound("spider/sight");
		SPID A 35 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundbfg9000/charge");
		SPID A 16 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundbfg9000/load");
		SPID A 16 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundbfg9000/fire");
		TNT1 A 0 A_StartSound("hellboundbfg9000/firemain");
		SPID H 2 A_SpawnProjectile("CyberHBoundRageMissile");
		SPID A 16 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundbfg9000/fire");
		TNT1 A 0 A_StartSound("hellboundbfg9000/firemain");
		SPID H 2 A_SpawnProjectile("CyberHBoundRageMissile");
		SPID A 16 A_FaceTarget;
		TNT1 A 0 A_StartSound("hellboundbfg9000/fire");
		TNT1 A 0 A_StartSound("hellboundbfg9000/firemain");
		SPID H 2 A_SpawnProjectile("CyberHBoundRageMissile");
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