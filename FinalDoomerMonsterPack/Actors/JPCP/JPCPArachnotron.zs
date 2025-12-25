class JPCPArachnotron : Arachnotron
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
		BSPI A 20 BRIGHT A_FaceTarget;
		TNT1 A 0 A_StartSound("jpcpplasmarifle/fire");
		BSPI G 4 BRIGHT A_SpawnProjectile("BSpidJPCPMissile");
		BSPI H 4 BRIGHT;
		BSPI H 1 BRIGHT A_SpidRefire;
		Goto Missile+1;
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