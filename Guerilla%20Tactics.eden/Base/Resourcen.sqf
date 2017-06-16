_RESlager = ResVert select 0;
_RESMHQ1 = ResVert select 1;
_RESMHQ2 = ResVert select 2;
_RESMHQ3 = ResVert select 3;

_MUNlager = MuniVert select 0;
_MUNTrans1 = MuniVert select 1;
_MUNTrans2 = MuniVert select 2;

_kaempfer = Kaempfer;

_header = "Resource overview:";
_line1 = format ["Resources in Storage: %1",_RESlager];
_line2 = format ["Resources MHQ 1: %1",_RESMHQ1];
_line3 = format ["Resources MHQ 2: %1",_RESMHQ2];
_line4 = format ["Resources MHQ 3: %1",_RESMHQ3];
_line5 = format ["Ammo in Storage: %1",_MUNlager];
_line6 = format ["Ammo Transporter 1: %1",_MUNTrans1];
_line7 = format ["Ammo Transporter 2: %1",_MUNTrans2];
_line8 = format ["Fighters: %1", _kaempfer];
_text = composeText [_header, lineBreak, _line1, lineBreak, _line2, lineBreak, _line3, lineBreak, _line4, lineBreak, _line5, lineBreak, _line6, lineBreak, _line7, lineBreak, _line8];
hint _text;