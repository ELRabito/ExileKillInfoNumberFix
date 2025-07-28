/**
 * ExileClient_util_string_exponentToStringFormatted
 * by El'Rabito 
 */
params ["_num"];
private _intPart = floor _num;
private _decPart = _num - _intPart;
private _intStr = format ["%1", _intPart toFixed 0];
private _intArr = toArray _intStr;
private _len = count _intArr;
private _result = "";
for "_i" from 0 to (_len - 1) do 
{
    private _idx = _len - 1 - _i;
    private _char = toString [_intArr select _idx];
    _result = _char + _result;
    if (((_i + 1) % 3 == 0) && ((_i + 1) != _len)) then 
	{
        _result = "." + _result; 
    }; 
}; 
if (_decPart > 0.00001) then 
{ 
    private _decStr = format ["%.2f", _num]; 
    private _split = _decStr splitString "."; 
    private _decOnly = _split select 1; 
    _result = format ["%1,%2", _result, _decOnly]; 
}; 
_result