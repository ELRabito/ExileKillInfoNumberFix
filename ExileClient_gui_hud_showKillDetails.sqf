/**
 * ExileClient_gui_hud_showKillDetails
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
private _messages = _this;
private _overallRespectChange = 0;
private _messageContent = "<t align='right' size='1.25'>";
{
	private _scoreName = _x select 0;
	private _scoreString = (_x select 1) call ExileClient_util_string_exponentToStringFormatted;
	_overallRespectChange = _overallRespectChange + (_x select 1);
	_messageContent = _messageContent + format ["<t font='PuristaSemibold'>%1</t>&#160;&#160;&#160;%2<br/>", toUpper _scoreName, _scoreString];
	
} forEach _messages;
_messageContent = _messageContent + "</t>";
if (_overallRespectChange >= 0) then
{
	playSound "FD_CP_Clear_F";
	private _formatRep = _overallRespectChange call ExileClient_util_string_exponentToStringFormatted;
	_messageContent = _messageContent + (format ["<t align='right' color='#b2ec00' font='PuristaBold' size='1.4'>+%1</t>", _formatRep]);
}
else 
{
	playSound "FD_CP_Not_Clear_F";
	private _formatRep = _overallRespectChange call ExileClient_util_string_exponentToStringFormatted;
	_messageContent = _messageContent + (format ["<t align='right' color='#ea0000' font='PuristaBold' size='1.4'>%1</t>", _formatRep]);
};
[
	parseText _messageContent, 
	[safezoneX, safezoneY + safeZoneH * 0.4, safezoneW * 0.3, safeZoneH * 0.25], 
	nil, 
	6, 
	0.7,
	0 
] 
spawn BIS_fnc_textTiles;
