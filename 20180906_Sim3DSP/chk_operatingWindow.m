function [ val ] = chk_operatingWindow( D_UT, HH )
%CHK_OPERATINGWINDOW Checks whether position for D_UT, HH is inside the
%operating window of 3DSP_1t.
%   The operating window is determined by the positions P1, P2, P3, P4
P1 = [-160, 30];
P2 = [-160, 41];
P4 = [-210, 33];
P3 = [-210, 12];

P = [P1; P2; P4; P3; P1];

val = inpolygon(D_UT(2), HH, P(:,1), P(:,2)); 

end

