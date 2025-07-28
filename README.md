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


And don't go to crazy with the numbers, stay below 10,000,000,000 (Otherwise it will not be precise / Arma limitation!). 
<img width="752" height="488" alt="grafik" src="https://github.com/user-attachments/assets/3db4f3e4-29fd-4373-8752-998f0ecd9bcb" />

