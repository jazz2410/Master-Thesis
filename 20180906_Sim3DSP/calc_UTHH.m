function [D_UT, HH] = calc_UTHH(B0)
% Berechnet D_UT and HH fuer ein gegebenes B0
    % Konstanten laden
    Getriebedaten_1t;

    %% unteres Lenkersystem
    A0 = [0; 0];
    B_OT = KDP(B0, A0, s2, s1-r);
    C_OT = KDP(B_OT, B0, s4, s3);
    D_OT = [150; C_OT(2) - sqrt(s5^2 - (150-C_OT(1))^2)];
    
    B_UT = KDP(B0, A0, s2, s1+r);
    C_UT = KDP(B_UT, B0, s4, s3);
    D_UT = [150; C_UT(2) - sqrt(s5^2 - (150-C_UT(1))^2)];
    
    HH = D_OT(2) - D_UT(2);
end