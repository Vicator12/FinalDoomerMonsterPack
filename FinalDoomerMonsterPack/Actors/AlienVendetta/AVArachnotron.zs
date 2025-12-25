class AlienVendettaArachnotron : Arachnotron
{
	Default
	{
		AttackSound "";
	}
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
		TNT1 A 0 A_Jump(128,"Railgun");
		BSPI A 20 BRIGHT A_FaceTarget;
		BSPI G 0 A_StartSound("alienvendettachaingun/fire", CHAN_BODY, 1, 1, 0.7);
		BSPI H 2 BRIGHT A_CustomBulletAttack(2, 0, 1, randompick(5,6), "FDBulletPuff", flags:CBAF_NORANDOM | CBAF_EXPLICITANGLE);
		BSPI G 0 A_StartSound("alienvendettachaingun/fire", CHAN_BODY, 1, 1, 0.7);
		BSPI G 2 BRIGHT A_CustomBulletAttack(0, 0, 1, randompick(5,6), "FDBulletPuff", flags:CBAF_NORANDOM | CBAF_EXPLICITANGLE);
		BSPI G 0 A_StartSound("alienvendettachaingun/fire", CHAN_BODY, 1, 1, 0.7);BSPI H 2 BRIGHT A_CustomBulletAttack(-2, 0, 1, randompick(5,6), "FDBulletPuff", flags:CBAF_NORANDOM | CBAF_EXPLICITANGLE);
		BSPI H 4 BRIGHT;
		BSPI H 1 BRIGHT A_SpidRefire;
		Goto Missile+2;
	Railgun:
		BSPI A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAutoAimRailgunPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff2");
		BSPI G 0 A_StartSound("alienvendettaplasmarifle/fire", CHAN_BODY, 1, 1, 0.7);
		BSPI G 35 BRIGHT A_CustomRailgun(40+(4*random(1,4)), 0, "", "White", RGF_SILENT | RGF_FULLBRIGHT | RGF_EXPLICITANGLE | RGF_SILENT, 1, 0, "FDAlienVendettaBeamImpactPuff", 0, 0, 0, 1, 0, 1, "FDAlienVendettaBeamCore", -2);
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAutoAimRailgunPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff2");
		BSPI G 0 A_StartSound("alienvendettaplasmarifle/fire", CHAN_BODY, 1, 1, 0.7);
		BSPI G 35 BRIGHT A_CustomRailgun(40+(4*random(1,4)), 0, "", "White", RGF_SILENT | RGF_FULLBRIGHT | RGF_EXPLICITANGLE | RGF_SILENT, 1, 0, "FDAlienVendettaBeamImpactPuff", 0, 0, 0, 1, 0, 1, "FDAlienVendettaBeamCore", -2);
		BSPI H 4 BRIGHT;
		Goto See;
	Pain:
		TNT1 A 0 A_StopSound(7);
		BSPI I 3;
		BSPI I 3 A_Pain;
		Goto See+1;
	Death:
		TNT1 A 0 A_StopSound(7);
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