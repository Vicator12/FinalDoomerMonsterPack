mixin Class HitscanTracerAttacks
{
	action void A_FireTracerRound(int damage, int spawnofs_xy = 0, bool useammo = true, int numtracers = 1, color color1 = 0, color color2 = 0, int flags = 0, double maxdiff = 0, class<Actor> pufftype = "BulletPuff", double spread_xy = 0, double spread_z = 0, double range = 0, int duration = 0, double sparsity = 1.0, double driftspeed = 1.0, class<Actor> spawnclass = "none", double spawnofs_z = 0, int spiraloffset = 270, int limit = 0)
	{
		for(int i; i<=numtracers; i++)
		{
			A_RailAttack(damage, spawnofs_xy, false, color1, color2, flags, maxdiff, "", spread_xy, spread_z, range, duration, sparsity, driftspeed, spawnclass, spawnofs_z, spiraloffset, limit);
			A_FireBullets (spread_xy, spread_z, -1, 0, pufftype, 0);
		}
		if(useammo == true)
		{
			invoker.depleteammo(invoker.bAltFire, true, 1);
		}
	}
}

Class AS_6 : Weapon
{
	int a;
	mixin HitscanTracerAttacks;
	Default
	{
		Weapon.Kickback 100;
		// Bobstyle shamelessly stolen from some cop while he was distracted fighting terrorists
		// Or more likely, from Wildweasel's Terrorists!
		Weapon.BobStyle "Alpha";
		Weapon.BobSpeed 2.5;
		Weapon.BobRangeX 0.2;
		Weapon.BobRangeY 0.5;
		Inventory.Pickupmessage "";
		Inventory.PickupSound "";
		Inventory.RestrictedTo "FDPlutPlayer";
		Inventory.Icon "PLSHOTGU";
		Weapon.UpSound "";
		Weapon.AmmoType1 "CMBSHELL";
		Weapon.AmmoUse1 1;
		Weapon.AmmoType2 "CMBSHELL";
		Weapon.AmmoUse2 1;
		Weapon.SlotNumber 3;
		+WEAPON.NOALERT
		+WEAPON.AMMO_OPTIONAL
		+NOTIMEFREEZE
		Obituary "%o couldn't escape %k's sight.";
		Decal "BulletChip";
		Tag "Scoped Shotgun";
	}
  States
  {
  Ready:
    TNT1 A 0 A_JumpIfInventory ("CMBSHELL", 1, "ReadyAmmo");
    PSHT A 1 A_WeaponReady (WRF_NOFIRE);
    Loop;
  ReadyAmmo:
    PSHT A 1 A_WeaponReady();
    Loop;
	
  Select:
    PSHT A 1 A_Raise;
    "####" "#" 0 A_Raise;
    Loop;
  Deselect:
    PSHT A 1 A_Lower;
    "####" "#" 0 A_Lower;
    Loop;
  Dryfire:
    PSHT A 6 A_PlaySound("weapons/dryfire1", 5, 1, 0, 1.25);
    Goto Ready;
	
  Fire:
	TNT1 A 0 {invoker.a++;}
    TNT1 A 0 A_JumpIfInventory ("CMBSHELL", 1, 1);
	Goto Dryfire;
    TNT1 A 0 A_AlertMonsters;
    TNT1 A 0 A_GunFlash;
	TNT1 A 0 A_JumpIf(CallACS("FD_gunsmoke") == 0, 2);
	TNT1 A 0 A_FireCustomMissile ("FDGunSmokeSpawner", 0,0,0,6);
    TNT1 A 0 A_PlaySound("plutshotgun/fire", CHAN_WEAPON, 1, 0, 0.7);
    TNT1 A 0 A_PlaySound("plutshotgun/fire", 7, 0.05, 0, 0.20);
	TNT1 A 0 A_FireTracerRound(5, useammo:false, numtracers:16, color1:"", color2:"navy", flags:RGF_NOPIERCING|RGF_FULLBRIGHT|RGF_SILENT , pufftype:"FDBulletPuff", spread_xy:4, spread_z:3, duration:7, spiraloffset:0);
    PSHT B 1 Bright A_SetPitch (pitch - (0.8 * CallACS("FD_recoil")/65536.0));
    PSHT B 1 Bright A_SetPitch (pitch - (0.4 * CallACS("FD_recoil")/65536.0));
    PSHT C 1 Bright A_SetPitch (pitch - (0.2 * CallACS("FD_recoil")/65536.0));
    PSHT C 1 Bright A_SetPitch (pitch - (0.1 * CallACS("FD_recoil")/65536.0));
    PSHT D 1 A_SetPitch (pitch + (0.5 * CallACS("FD_recoil")/65536.0));
    PSHT D 1 A_SetPitch (pitch + (0.25 * CallACS("FD_recoil")/65536.0));
    PSHT A 1 A_SetPitch (pitch + (0.25 * CallACS("FD_recoil")/65536.0));
    PSHT A 1 A_SetPitch (pitch + (0.4 * CallACS("FD_recoil")/65536.0));
    PSHT A 1 A_SetPitch (pitch + (0.1 * CallACS("FD_recoil")/65536.0));
	TNT1 A 0 A_Jumpif(invoker.a == 12, "GonnaReload");
	PSHT A 1 A_Refire;
	Goto Ready;
  GonnaReload:
	TNT1 A 0 {invoker.a = 0;}
    PSHT EF 2;
	PSHT G 1 A_SetPitch(pitch + (0.05 * CallACS("FD_recoil")/65536.0));
	PSHT G 1 A_SetPitch(pitch + (0.23 * CallACS("FD_recoil")/65536.0));
	PSHT G 1 A_SetPitch(pitch + (0.08 * CallACS("FD_recoil")/65536.0));
    TNT1 A 0 A_PlaySound("plutshotgun/pumpdown", 5, 1, 0, 1.25);
    PSHT HI 2;
	TNT1 A 0 A_JumpIf(CallACS("FD_guncasings") == 0, 2);
	TNT1 A 0 A_FireCustomMissile ("FDShellCasingSpawner", 0,0,frandom(-7.6,-7.2),-2, FPF_NOAUTOAIM);
    PSHT J 2;
	PSHT K 1 A_SetPitch(pitch - (0.06 * CallACS("FD_recoil")/65536.0));
	PSHT K 1 A_SetPitch(pitch - (0.28 * CallACS("FD_recoil")/65536.0));
	PSHT K 1 A_SetPitch(pitch - (0.02 * CallACS("FD_recoil")/65536.0));
    TNT1 A 0 A_PlaySound("plutshotgun/pumpup", 6, 1, 0, 1.25);
	TNT1 A 0 {invoker.depleteammo(invoker.bAltFire, true, 1);}
    PSHT HGFE 2;
    PSHT A 4;
    Goto Ready;
	
  Altfire:
    TNT1 A 0 A_JumpIfInventory ("CMBSHELL", 1, 1);
	Goto Dryfire;
    TNT1 A 0 A_AlertMonsters;
    TNT1 A 0 A_GunFlash;
	TNT1 A 0 A_JumpIf(CallACS("FD_gunsmoke") == 0, 2);
	TNT1 A 0 A_FireCustomMissile ("FDGunSmokeSpawner", 0,0,0,6);
    TNT1 A 0 A_PlaySound("plutshotgun/fire", CHAN_WEAPON, 1, 0, 0.7);
    TNT1 A 0 A_PlaySound("plutshotgun/fire", 7, 0.05, 0, 0.20);
	TNT1 A 0 A_FireTracerRound(5, numtracers:16*(12 - invoker.a), color1:"", color2:"navy", flags:RGF_NOPIERCING|RGF_FULLBRIGHT|RGF_SILENT , pufftype:"FDBulletPuff", spread_xy:18, spread_z:15, duration:7, spiraloffset:0);
    PSHT B 1 Bright A_SetPitch (pitch - (0.8 * CallACS("FD_recoil")/65536.0));
    PSHT B 1 Bright A_SetPitch (pitch - (0.4 * CallACS("FD_recoil")/65536.0));
    PSHT C 1 Bright A_SetPitch (pitch - (0.2 * CallACS("FD_recoil")/65536.0));
    PSHT C 1 Bright A_SetPitch (pitch - (0.1 * CallACS("FD_recoil")/65536.0));
    PSHT D 1 A_SetPitch (pitch + (0.5 * CallACS("FD_recoil")/65536.0));
    PSHT D 1 A_SetPitch (pitch + (0.25 * CallACS("FD_recoil")/65536.0));
    PSHT A 1 A_SetPitch (pitch + (0.25 * CallACS("FD_recoil")/65536.0));
    PSHT A 1 A_SetPitch (pitch + (0.4 * CallACS("FD_recoil")/65536.0));
    PSHT A 1 A_SetPitch (pitch + (0.1 * CallACS("FD_recoil")/65536.0));
	TNT1 A 0 {invoker.a = 0;}
    PSHT EF 2;
	PSHT G 1 A_SetPitch(pitch + (0.05 * CallACS("FD_recoil")/65536.0));
	PSHT G 1 A_SetPitch(pitch + (0.23 * CallACS("FD_recoil")/65536.0));
	PSHT G 1 A_SetPitch(pitch + (0.08 * CallACS("FD_recoil")/65536.0));
    TNT1 A 0 A_PlaySound("plutshotgun/pumpdown", 5, 1, 0, 1.25);
    PSHT HI 2;
	TNT1 A 0 A_JumpIf(CallACS("FD_guncasings") == 0, 2);
	TNT1 A 0 A_FireCustomMissile ("FDShellCasingSpawner", 0,0,frandom(-7.6,-7.2),-2, FPF_NOAUTOAIM);
    PSHT J 2;
	PSHT K 1 A_SetPitch(pitch - (0.06 * CallACS("FD_recoil")/65536.0));
	PSHT K 1 A_SetPitch(pitch - (0.28 * CallACS("FD_recoil")/65536.0));
	PSHT K 1 A_SetPitch(pitch - (0.02 * CallACS("FD_recoil")/65536.0));
    TNT1 A 0 A_PlaySound("whitemare/steam2", 7, 1, 0, 1.2);
    TNT1 A 0 A_GiveInventory ("FDWhitemareChaingunSteamCounter", 1);
	TNT1 AAAAA 0 A_SpawnItemEx("FDGunSteamSpawner2", 20 * cos(pitch + 24) * cos(angle) - 4 * sin(angle),20 * cos(pitch + 24) * sin(angle) + 4 * cos(angle),20 * sin(-(pitch + 24)) + 48, 0,0,0, 90, SXF_NOCHECKPOSITION | SXF_ORIGINATOR | SXF_ABSOLUTEPOSITION);
	TNT1 AAAAA 0 A_SpawnItemEx("FDGunSteamSpawner2", 20 * cos(pitch + 24) * cos(angle) + 4 * sin(angle),20 * cos(pitch + 24) * sin(angle) - 4 * cos(angle),20 * sin(-(pitch + 24)) + 48, 0,0,0, -90, SXF_NOCHECKPOSITION | SXF_ORIGINATOR | SXF_ABSOLUTEPOSITION);
	TNT1 AAAAA 0 A_SpawnItemEx("FDGunSteamSpawner3", 25 * cos(pitch + 0) * cos(angle) + 0 * sin(angle),25 * cos(pitch + 0) * sin(angle) - 0 * cos(angle),25 * sin(-(pitch + 0)) + 48, 0,0,0, 0, SXF_NOCHECKPOSITION | SXF_ORIGINATOR | SXF_ABSOLUTEPOSITION);
    TNT1 A 0 A_TakeInventory ("FDWhitemareChaingunSteamCounter", 0);
	PSHT K 30;
    TNT1 A 0 A_PlaySound("plutshotgun/pumpup", 6, 1, 0, 1.25);
    PSHT HGFE 2;
    PSHT A 4;
    Goto Ready;
  Flash:
    TNT1 A 2 A_Light1;
    TNT1 A 2 A_Light2;
    TNT1 A 0 A_Light0;
	Goto LightDone;
  }
	
}

Class CMBShell : Ammo
{
	Default
	{
		Inventory.PickupMessage "Picked up some shells.";
		translation "178:191=244:247", "160:167=197:205";
		Inventory.Amount 4;
		Inventory.MaxAmount 4;
		Ammo.BackpackAmount 6;
		Ammo.BackpackMaxAmount 6;
		Inventory.PickupSound "items/plutshellsmall";
		Inventory.Icon "PAMMB0";
		Tag "Shells";
	}
	States
	{
	Spawn:
		DSHE A -1;
		Stop;
	}
}