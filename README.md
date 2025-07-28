# Install

1. Add a new function to your mission, for example easily via initplayerlocal.sqf. This will take care of the number formatting.

		private ['_code', '_function', '_file'];
		{
			missionNamespace setVariable [(_x #0), compileScript [_x #1]];
		} forEach [

			["ExileClient_util_string_exponentToStringFormatted","custom\ExileClient_util_string_exponentToStringFormatted.sqf"]
		];

2. Download ExileClient_gui_hud_showKillDetails and put it to your missionfile and add the CfgExileCustomCode entry for it in your missions config.cpp.
	
		ExileClient_gui_hud_showKillDetails = "Overrides\ExileClient_gui_hud_showKillDetails.sqf";
