#include "script_component.hpp"
/*
 * Author: Mazinski.H
 * Checks for Reorientation Wakeup values to restore consciousness
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Succesful treatment <BOOL>
 *`
 * Example:
 * [player, cursorTarget] call kat_pharma_fnc_treatmentAdvanced_ReorientationLocal;
 *
 * Public: No
 */

params ["_medic", "_patient"];

private _bloodVolume = GET_BLOOD_VOLUME(_patient);
private _pulse = GET_HEART_RATE(_patient);

if (_bloodVolume > 5.1 && _pulse >= 70 && _pulse <= 100) then {
    [_patient, false] call ace_medical_fnc_setUnconscious;
    _output = LLSTRING(ReorientingSuccess);
    [_output, 1.5, _medic] call ace_common_fnc_displayTextStructured;
} else {
    _output = LLSTRING(Reorienting_Info);
    [_output, 1.5, _medic] call ace_common_fnc_displayTextStructured;
};