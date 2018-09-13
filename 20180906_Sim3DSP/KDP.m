function [ p3 ] = KDP( p1, p2, l1, l2 )
%   KDP( p1, p2, l1, l2 )
%   Berechnet den 3. Punkt p3 eines Dreischlags bestehend aus den Punkten
%   p1, p2 und p3 mit den Längen l1 und l2 zu p3. Die Reihenfolge von
%   p1 und p2 entscheidet hierbei, welche der beiden möglichen Lösungen
%   gefunden wird.
    l3 = norm(p1-p2);
    a2 = (l3^2+l2^2-l1^2)/(2*l3);
    h = sqrt(l2^2 - a2^2);
    p3 = p2 + a2*(p1-p2)/l3 + h/l3 * [p1(2)-p2(2); p2(1)-p1(1)];
end

