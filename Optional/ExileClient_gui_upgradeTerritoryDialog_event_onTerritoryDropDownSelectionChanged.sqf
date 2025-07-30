/**
 * ExileClient_gui_upgradeTerritoryDialog_event_onTerritoryDropDownSelectionChanged
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
disableSerialization;
params ["_territoryDropDown","_index"];
private _display = uiNameSpace getVariable ["RscExileUpgradeTerritoryDialog", displayNull];
private _flagObject = objectFromNetId (_territoryDropDown lbData _index);
private _level = _flagObject getVariable ["ExileTerritoryLevel", 1];
private _territoryConfig = getArray(missionConfigFile >> "CfgTerritories" >> "Prices");
private _territoryLevels = count _territoryConfig;
private _upgradeButton = _display displayCtrl 4001;
private _costControl = _display displayCtrl 4002;
private _radiusControl = _display displayCtrl 4003;
private _levelControl = _display displayCtrl 4004;
_levelControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1/%2</t>",((_level + 1) min _territoryLevels),_territoryLevels];
if((_level + 1) > _territoryLevels)then
{
	_radiusControl ctrlShow false;
	_levelControl ctrlSetStructuredText parseText format ["<t size='1.4'>Max Level %1/%2</t>",((_level + 1) min _territoryLevels),_territoryLevels];
	_costControl ctrlShow false;
	_upgradeButton ctrlEnable false;
}
else
{
	private _territoryPrice = (_territoryConfig select _level) select 0;
	private _territoryRange = (_territoryConfig select _level) select 1;
	_costControl ctrlShow true;
	_upgradeButton ctrlEnable true;
	_radiusControl ctrlShow true;
	_costControl ctrlSetStructuredText(parseText format["<t size='1.4'>%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", (_territoryPrice call ExileClient_util_string_exponentToStringFormatted)]);
	_radiusControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1m</t>",_territoryRange];
	_upgradeButton ctrlEnable true;
};
