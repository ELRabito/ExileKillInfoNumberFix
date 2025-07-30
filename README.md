# ExileKillInfoNumberFix

This fixes the issue with the huge number display inside the kill info.
<img width="928" height="527" alt="grafik" src="https://github.com/user-attachments/assets/ceac62d5-00e9-455a-a563-e852684020bd" />

# Installation
1. Add a new function to your mission, for example easily via this small snippet pasted inside initplayerlocal.sqf. This function will then take care of the number formatting.

		{
			missionNamespace setVariable [(_x #0), compileScript [_x #1]];
		} forEach [

			["ExileClient_util_string_exponentToStringFormatted","custom\ExileClient_util_string_exponentToStringFormatted.sqf"]
		];

2. Download ExileClient_gui_hud_showKillDetails and put it to your missionfile and add the CfgExileCustomCode entry for it in your missions config.cpp.
	
		ExileClient_gui_hud_showKillDetails = "Overrides\ExileClient_gui_hud_showKillDetails.sqf";

3. Done


# Other Information

Can also easily be added to other scripts to show the huge numbers better (The output is a string!)
	
	// Example for ExileClient_gui_lockerDialog_event_onDepositButtonClick
	throw format ["Your locker can only hold %1 pop tabs.", (_lockerLimit call ExileClient_util_string_exponentToStringFormatted)];


And don't go to crazy with the numbers, stay below 1,000,000,000 (Otherwise it will not be precise / Arma limitation!). 
<img width="719" height="467" alt="grafik" src="https://github.com/user-attachments/assets/792819c0-8c93-4f65-9a6a-cd926593ede9" />

Territory upgrade big number fix inside the Optional folder
<img width="513" height="456" alt="grafik" src="https://github.com/user-attachments/assets/1d91fdfb-f8db-489f-9de0-f0d015f466c2" />


