function [A,B,B0,C,D,E,F,H,Rram,SpO,SpU] = calc_solid_1t(SpOy, SpUy, phi)
% Berechnet das unelastische Stabwerk
    % Konstanten laden
    run Getriebedaten_1t;

    if(length(SpOy) == 1)
        SpO = [452; SpOy];
        SpU = [452; SpUy];
    else
        SpO = SpOy;
        SpU = SpUy;
    end
    
    %% oberes Lenkersystem
    E = [0; 286];
    H = SpO - [sqrt(s9^2 - 1/4*(SpO(2)-SpU(2))^2); (SpO(2)-SpU(2))/2];

    % Punkt F, KDP
    F = KDP(H, E, s6+s7, s8);
    B0 = F + (H-F)/norm(H-F)*s6;

    %% unteres Lenkersystem
    A = r*[cosd(phi); -sind(phi)];
    B = KDP(B0, A, s2, s1);
    C = KDP(B, B0, s4, s3);
    D = [150; C(2) - sqrt(s5^2 - (150-C(1))^2)];
    
    %% Stoessel
    Rram = D + [0; -495]; 
end