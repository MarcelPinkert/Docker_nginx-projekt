Das "Works on my machine"-Problem:

Welchen entscheidenden Vorteil bietet dein Docker-Container im Vergleich dazu, wenn du einem Kollegen einfach nur deinen Code-Ordner schicken würdest?

Antwort:
Wenn ich meinen Code nur verschicke, kann es passieren, dass er bei meinem Kollegen nicht läuft, weil dessen Rechner eine andere Umgebung hat (andere Node-Version, fehlende Pakete, falsches OS usw.). Mit einem Docker-Container habe ich alles – Code, Abhängigkeiten und Laufzeitumgebung – standardisiert verpackt. Dadurch läuft die Anwendung auf jedem Rechner identisch.

Blaupause für die Infrastruktur:

Warum kann das Dockerfile als "Infrastructure as Code" bezeichnet werden?

Antwort:
Für mich ist das Dockerfile wie eine Bauanleitung: Es beschreibt in Codeform, wie die Infrastruktur meiner Anwendung aufgebaut sein soll – welches Basis-Image, welche Abhängigkeiten, welche Konfiguration. Dadurch kann jeder diese Infrastruktur automatisiert und reproduzierbar nachbauen, ohne dass ich manuell irgendetwas einrichten muss.

Trennung von Code und Abhängigkeiten:

Warum ist es (insbesondere bei Node.js und Python) eine gute Praxis, die Abhängigkeiten (node_modules oder virtuelle Umgebungen) nicht direkt in das Image zu kopieren, sondern sie durch einen RUN-Befehl im Dockerfile installieren zu lassen?

Antwort:
Wenn ich fertige node_modules oder ein virtuelles Python-Environment ins Image kopiere, schleppe ich Plattform-spezifische Dateien mit (z. B. binäre Module, die nur auf meinem Rechner funktionieren). Mit einem RUN npm install oder RUN pip install im Dockerfile werden die Abhängigkeiten direkt im Container installiert – passend zum Betriebssystem und der Architektur des Containers. So verhindere ich Kompatibilitätsprobleme.

Ports:

Was ist der Unterschied zwischen dem Port, den ich mit EXPOSE im Dockerfile angebe, und dem Port, den ich im docker run -p Befehl verwende?

Antwort:
Mit EXPOSE dokumentiere ich im Image, auf welchem Port die Anwendung im Container läuft (z. B. Port 80 bei Nginx). Dieser Port ist aber standardmäßig nur innerhalb des Containers sichtbar. Mit docker run -p 8080:80 lege ich eine Weiterleitung fest: Der Port 8080 auf meinem Host-Rechner zeigt dann auf den Port 80 im Container. So kann ich im Browser localhost:8080 eingeben und lande in meiner App.