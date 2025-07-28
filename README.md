# ExileKillInfoNumberFix

<img width="928" height="527" alt="grafik" src="https://github.com/user-attachments/assets/ceac62d5-00e9-455a-a563-e852684020bd" />

# Install
1. Add a new function to your mission, for example easily via this small snippet pasted inside initplayerlocal.sqf. This will take care of the number formatting.

		{
			missionNamespace setVariable [(_x #0), compileScript [_x #1]];
		} forEach [

			["ExileClient_util_string_exponentToStringFormatted","custom\ExileClient_util_string_exponentToStringFormatted.sqf"]
		];

2. Download ExileClient_gui_hud_showKillDetails and put it to your missionfile and add the CfgExileCustomCode entry for it in your missions config.cpp.
	
		ExileClient_gui_hud_showKillDetails = "Overrides\ExileClient_gui_hud_showKillDetails.sqf";


