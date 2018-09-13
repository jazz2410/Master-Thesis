clear;

% Exzenterwinkel in ° von 0..360°
phi_vec = linspace(0, 360, 36);
% Spindel oben y-Position in mm von 170..320 mm
% für Einzelposition kann z. B. SpOy_vec = 300 gesetzt werden
SpOy_vec = linspace(170, 320, 10);
% SpOy_vec = 300;

% Spindel unten y-Position in mm von -110..70 mm
SpUy_vec = linspace(-110, 70, 10);

% Größe der Vektoren auslesen
N_phi = length(phi_vec);
N_SpO = length(SpOy_vec);
N_SpU = length(SpUy_vec);

% Speicher reservieren für zu generierende Eingangsdaten u und
% Ausgangsdaten y
u = NaN(N_phi*N_SpO*N_SpU, 3);
y = NaN(N_phi*N_SpO*N_SpU, 1);

% definierte Exzenter- und Spindelpositionen durchiterieren und Getriebe
% berechnen
for i = 1:N_phi
    for ii = 1:N_SpO
        for iii = 1:N_SpU
            
            % Index für Ausgabevektor transformieren
            i_tr = (iii-1)*N_SpO*N_phi + (ii-1)*N_phi + i;
            
            % Abtrieb der Kinematik D_mess sowie B0 für
            % Betriebsfensterüberprüfung berechnen
            [~,~,B0,~,D_mess] = calc_solid_1t(SpOy_vec(ii), SpUy_vec(iii), phi_vec(i));
            
            % B0 auf unteren Totpunkt (D_UT) und Hubhöhe (HH)
            % transformieren
            [D_UT, HH] = calc_UTHH(B0);
            % prüfen, ob D_UT, HH im Betriebsfenster sind
            inOP = chk_operatingWindow(D_UT, HH);
            
            % Berechnung überspringen, wenn nicht im Betriebsfenster, d.h.
            % NaN bleibt für diesen Punkt in u und y stehen und wird nicht
            % geplottet
            if(~inOP)
                continue;
            end
            
            % Eingangsdaten schreiben [SpOy, SpUy, phi]
            u(i_tr,:) = [SpOy_vec(ii), SpUy_vec(iii), phi_vec(i)];
            
            % Ausgangsdaten schreiben
            y(i_tr) = D_mess(2);
                        
        end
    end
end

figure('name', 'einbezogene Spindelpositionen')
plot(u(:,1), u(:,2), 'o')
xlabel('SpO_y in mm')
ylabel('SpU_y in mm')
grid on

figure('name','Ein-/Ausgangsdaten, y')
subplot(2,1,1)
plot3(u(:,3), u(:,2), y, '.')
xlabel('\phi in °')
ylabel('SpU_y in mm')
zlabel('D_y in mm')
grid on
subplot(2,1,2)
plot3(u(:,3), u(:,1), y, '.')
xlabel('\phi in °')
ylabel('SpO_y in mm')
zlabel('D_y in mm')
grid on