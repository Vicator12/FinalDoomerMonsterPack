class AlienVendettaCyberdemon : CyberDemon 
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
		//TNT1 A 0 A_Jump(15, "SuperRocket");
		CYBR E 6 A_FaceTarget;
		CYBR F 12 A_SpawnProjectile("CyberAVMissile", angle:frandom(-1.0,1.0));
		CYBR E 3 A_FaceTarget;
		CYBR F 12 A_SpawnProjectile("CyberAVMissile", angle:frandom(-1.0,1.0));
		CYBR E 3 A_FaceTarget;	
		CYBR F 12 A_SpawnProjectile("CyberAVMissile", angle:frandom(-1.0,1.0));
		CYBR E 3 A_FaceTarget;	
		CYBR F 12 A_SpawnProjectile("CyberAVMissile", angle:frandom(-1.0,1.0));
		CYBR E 3 A_FaceTarget;
		CYBR F 12 A_SpawnProjectile("CyberAVMissile", angle:frandom(-1.0,1.0));
		CYBR E 3 A_FaceTarget;	
		CYBR F 12 A_SpawnProjectile("CyberAVMissile", angle:frandom(-1.0,1.0));
		Goto See;
	SuperRocket:
		TNT1 A 0 A_StartSound("cyber/sight");
		CYBR E 35 A_FaceTarget;
		CYBR FFFFFFF 2 A_SpawnItemEx("CyberAVRageMissile", 0,0,0, 0,0,0, 0, SXF_NOCHECKPOSITION | SXF_SETTRACER);
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
class AlienVendettaSpiderMastermind : SpiderMastermind
{
	Default
	{
		AttackSound "alienvendettaplasmarifle/fire";
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
		TNT1 A 0 A_Jump(128, "Railgun");
		SPID A 20 BRIGHT A_FaceTarget;
		SPID GHGHGHGHGHGHGH 4 BRIGHT
		{
			A_FaceTarget;
			A_SpawnItemEx("CyberAVRageMissile", 0,0,0, 0,0,0, 0, SXF_NOCHECKPOSITION | SXF_SETTRACER);
		}
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAutoAimRailgunPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff2");
		SPID G 0 A_StartSound("alienvendettaplasmarifle/fire", CHAN_BODY, 1, 1, 0.7);
		SPID G 0 A_FaceTarget();
		SPID G 35 BRIGHT A_CustomRailgun(40+(4*random(1,4)), 0, "", "White", RGF_SILENT | RGF_FULLBRIGHT | RGF_EXPLICITANGLE | RGF_SILENT, 1, 0, "FDAlienVendettaBeamImpactPuff", 0, 0, 0, 1, 0, 1, "FDAlienVendettaBeamCore", -2);
		SPID H 1 BRIGHT;
		Goto See;
	Railgun:
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAutoAimRailgunPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff2");
		SPID G 0 A_StartSound("alienvendettaplasmarifle/fire", CHAN_BODY, 1, 1, 0.7);
		SPID G 0 A_FaceTarget();
		SPID G 35 BRIGHT A_CustomRailgun(40+(4*random(1,4)), 0, "", "White", RGF_SILENT | RGF_FULLBRIGHT | RGF_EXPLICITANGLE | RGF_SILENT, 1, 0, "FDAlienVendettaBeamImpactPuff", 0, 0, 0, 1, 0, 1, "FDAlienVendettaBeamCore", -2);
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAutoAimRailgunPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff");
		TNT1 A 0 A_CustomBulletAttack(0,0, 1, 0, "FDAlienVendettaBeamVisualPuff2");
		SPID G 0 A_StartSound("alienvendettaplasmarifle/fire", CHAN_BODY, 1, 1, 0.7);
		SPID G 0 A_FaceTarget();
		SPID G 0 A_CustomRailgun(40+(4*random(1,4)), 0, "", "White", RGF_SILENT | RGF_FULLBRIGHT | RGF_EXPLICITANGLE | RGF_SILENT, 1, 0, "FDAlienVendettaBeamImpactPuff", 0, 0, 0, 1, 0, 1, "FDAlienVendettaBeamCore", -2);
		SPID G 35 BRIGHT A_CustomRailgun(40+(4*random(1,4)), 0, "", "White", RGF_SILENT | RGF_FULLBRIGHT | RGF_EXPLICITANGLE | RGF_SILENT, 1, 0, "FDAlienVendettaBeamImpactPuff", 0, 0, 0, 1, 0, 1, "FDAlienVendettaBeamCore", -2);
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