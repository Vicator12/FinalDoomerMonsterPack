Class WhitemareArachnotron : Arachnotron
{
	States
	{
	Spawn:
		BSPI AB 10 A_Look;
		Loop;
	See:
		BSPI A 20;
		BSPI A 3 A_BabyMetal;
		BSPI ABBCC 3 A_Chase;
		BSPI D 3 A_BabyMetal;
		BSPI DEEFF 3 A_Chase;
		Goto See+1;
	Missile:
		BSPI A 0 A_JumpIfCloser(252, "FlamenWerfer");
		BSPI A 20 BRIGHT A_FaceTarget;
		BSPI G 4 BRIGHT 
		{
			A_Facetarget();
			A_SpawnProjectile("ShotgunGuyWMFireball");
		}
		BSPI H 4 BRIGHT;
		BSPI H 1 BRIGHT A_SpidRefire;
		BSPI A 0 A_JumpIfCloser(252, "FlamenWerfer");
		Goto Missile+2;
	Flamenwerfer:
		BSPI A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_StartSound("whitemareplasmarifle/fire", 37, attenuation:1.2);
		TNT1 A 0 A_StartSound("whitemareplasmarifle/fire2", 35, attenuation:1.2);
		TNT1 A 0 A_StartSound("whitemareplasmarifle/fireloop", 31, flags:CHANF_LOOPING, attenuation:1.1);
		TNT1 A 0 A_StartSound("whitemareplasmarifle/fireloop2", 36, flags:CHANF_LOOPING, attenuation:0.7);
		TNT1 AA 0 A_SpawnProjectile ("BSpidWMMissile");
		BSPI G 2 A_SpawnProjectile ("BSpidWMMissile");
		BSPI H 2 BRIGHT;
		BSPI H 1 BRIGHT A_MonsterRefire(10, "FlameEnd");
		Goto FlameLoop;
	FlameLoop:
		TNT1 AA 0 A_SpawnProjectile ("BSpidWMMissile");
		BSPI G 2 A_SpawnProjectile ("BSpidWMMissile");
		BSPI H 0 BRIGHT;
		BSPI H 0 BRIGHT A_MonsterRefire(10, "FlameEnd");
		BSPI A 0 A_JumpIfCloser(352, "FlameLoop");
		Goto FlameEnd;
	FlameEnd:
		TNT1 A 0 A_PlaySound("whitemareplasmarifle/fireend");
		TNT1 A 0 A_StopSound (35);
		TNT1 A 0 A_StopSound (37);
		TNT1 A 0 A_StopSound (31);
		TNT1 A 0 A_StopSound (36);
		BSPI A 15;
		Goto See+1;
	Pain:
		BSPI I 3;
		BSPI I 3 A_Pain;
		Goto See+1;
	Death:
		BSPI J 20 A_Scream;
		BSPI K 7 A_NoBlocking;
		BSPI LMNO 7;
		BSPI P -1 A_BossDeath;
		Stop;
	Raise:
		BSPI P 5;
		BSPI ONMLKJ 5;
		Goto See+1;
	}
}