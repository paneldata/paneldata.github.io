---
title: "Variablen"
---
Fragen zu Variablen im SOEP Datensatz
=====================================


**Welche Art und Weise ist am verbreitetsten, um eine Familiengründung, also das erste Kind einer Person, herauszufinden?**
Für jede Person kann über die Datensätze biobirth (Frauen) und biobrthm (Männer ab 2001) ermittelt werden, 
wann das erste Kind geboren wurde (Variable kidgeb01). Eine nähere Dokumentation dieser Datenbestände befindet 
sich in unserer Biografiedokumentation.

Variable: kidgeb01
Variableninhalt: Geburt des ersten Kindes
*Ansprechpartner: Christian Schmitt*


**Wo finde ich Informationen über die Befragungsart während des Interviews (CAPI, PAPI etc.)**
Die meisten Interviews werden in CAPI (computer assisted personal interviews) durchgeführt. 
Allerdings gibt es in anderen Stichproben PAPI-Interviews. 
Mehr Informationen dazu sind in der Variable $hivform aus den Haushaltsdatensätzen zu finden. 

Variable: $$hivform
Variableninhalt: Art der Befragung
*Ansprechpartner: Florian Griese*


**Wo befindet sich die Personennummer (persnr) der Person, die den Haushaltsfragebogen beantwortet hat?**
Die persnr der Person, die den Haushaltsfragebogen ausgefüllt hat, kann man sich über einen kleinen Umweg anspielen.
In den Datensätzen $H existiert eine Variable $ausku, die angibt, wer den Fragebogen ausgefüllt hat. 
Hierbei handelt es sich allerdings im Gegensatz zur unveränderlichen persnr um eine wellenspezifische Kennzeichnung der Person im Haushalt.
Diese findet sich im Datensatz $PRUTTO wieder, dort allerdings unter dem Namen $pnrakt.
Durch das Zusammenspielen der beiden Datensätze ist es also möglich an die persnr der betreffenden Person gelangen.
Falls mit Stata gearbeitet wird, hilft vielleicht ein Beispiel für die Welle BA:

use "~\bah.dta" , clear
rename baausku bapnrakt
merge 1:1 hhnrakt bapnrakt using "~\bapbrutto.dta", keep(1 3) nogen keepus(persnr)

Variable: persnr
Variableninhalt: Personennummer
*Ansprechpartner: Rainer Siegers*


**Wieso unterscheiden sich die Angaben zum Haushaltseinkommen in den generierten Datensätzen von den Originaldaten.**
Beispiel:
Hinc01 in rhgen:
HHnrakt 27 = 614
Rh49 in rh:
HHnrakt 27 = 1200
Das Phänomen ist der Währungsreform in Deutschland geschuldet. 
Die Variable im p Datensatz spiegelt die Originaldaten wider (bis einschließlich 2001 in DM erfragt) und 
die generierten Daten sind auf eine einheitliche Währung (Euro) umgerechnet worden:

round( 1200 / 1.95583 )
[1] 614

Variable: Hinc01 in rhgen / Rh49 in rh
Variableninhalt: Haushaltseinkommen
*Ansprechpartner: Jan Goebel*


**Die Variable "adjusted household income" ist in 2012 ein Missing und in 2013 gleich Null. Wurde diese Variable für diese Jahre bisher noch nicht generiert?**
Seit der Welle 29 (Daten bis 2012) ist die Variable AHINC$$ des Datensatzes $HGEN nicht länger Teil der 
Datendistribution. Wir empfehlen die Nutzung des kompletten (multiplen), kalkulatorischen, monatlichen 
Haushaltseinkommens der Variable I$HINC$$ (oder den Datensatz MIHINC im „long"-Format über die Jahre). 
Informationen dazu finden Sie in der Dokumentation des HGEN-Datensatzes (<http://panel.gsoep.de/soep-docs/surveypapers/diw_ssp0252.pdf>).

Variable: AHINC$$
Variableninhalt: adjusted household income / angepasstes Haushaltseinkommen
*Ansprechpartner: Jan Goebel*


**Bei der Variablen "Number of Years of Education" (d11109, Datensatz: pequiv) wurde für einige Beobachtungen "-2, does not apply" angegeben. 
Soll dies bedeuten, dass diese Personen keinerlei Bildung genossen haben - dann wäre die Angabe mit Ausbildungsjahre = Null gleichzusetzen) - 
oder sollte diese Angabe als fehlender Wert interpretiert werden?**
Eine "-2" bedeutet im SOEP generell "trifft nicht zu". Im Falle der Variablen d11109
sind dies alle Kinder, denn diese befinden sich noch im Ausbildungssystem und haben
noch keine Ausbildung abgeschlossen.

Variable: d11109 in pequiv
Variableninhalt: Number of Years of Education
*Ansprechpartner: Markus Grabka*


**Welche Variable ist am besten geeignet, um offiziell arbeitslos gemeldete Personen zu erfassen?**
Allgemein eignet sich dafür die Roh-Variable „Arbeitslos gemeldet“, 
die die eigene Antwort auf die Frage angibt ob man „beim Arbeitsamt arbeitslos gemeldet“ ist. 
Diese Variable ist geeigneter als die Kalender-Variablen „Arbeitslos gemeldet“ und „Arbeitslos gemeldet N Monate“, 
die angibt in welchen Monaten des vorangegangenen Jahres eine Person arbeitslos gemeldet war. 
Die Rohvariable misst die registrierte Arbeitslosigkeit zu einem bestimmten Stichtag, welches das üblichere Maß ist. 
Falls aber beispielsweise saisonale Arbeitslosigkeit bestimmt werden soll, sind die Kalender-Variablen nützlicher.

Variable:
Variableninhalt: Arbeitslos gemeldet
*Ansprechpartner: Alexandra Fedorets*


**Was sagt die Variable aus, die den Grad der Behinderung oder der Erwerbsminderung misst?**
Zum einem werden mit dieser Variable der Grad der Behinderung nach Behindertenrecht und die Verminderte Erwerbsfähigkeit nach Rentenversicherungsgesetz erfasst, 
welche beide keine Prozentangaben sind, sondern einen Grad zwischen 20 und 100 angeben, 
der in Zehnerschritten erhöht wird. Zum anderen wird aber auch die Minderung der Erwerbsfähigkeit 
nach Unfallversicherungsgesetz bestimmt, welches eine Prozentangabe ist und deren Einstufung nicht in Zehner-Schritten erfolgen muss.

Variable:
Variableninhalt: Grad der Behinderung oder der Erwerbsminderung
*Ansprechpartner: Alexandra Fedorets*


**Bei der Variable „Tatsächliche Wochenarbeitszeit“ [YP60] beträgt die durchschnittliche Wochenarbeitszeit bis zum Jahr 1989 39 Stunden. 
Beim Sample von 2002 bis 2012 kommt allerdings eine durchschnittliche Wochenarbeitszeit von ca. 390 Stunden heraus.**
Die Variable gehört zu rohen Variablen, die in manchen Jahren ohne Kommastellen vorliegt (da es ein sparsameres Format ist). 
Um die Variable sinnvoll zu nutzen, soll man sie durch 10 teilen.
In den Files "$pgen.dta" gibt es die generierte Variable $tatzeit, die die gleichen Informationen in einem über die Zeit konsistenten Format enthält.

Variable: YP60
Variableninhalt: Tatsächliche Wochenarbeitszeit
*Ansprechpartner: Alexandra Fedorets*


**Kann sich die Stichproben-Zugehörigkeit im Laufe der Zeit verändern? Bleibt eine Befragungsperson der Ausländer-Stichprobe auch dann in diesem Sample, wenn die Staatsbürgerschaft gewechselt wurde?**
Die Stichprobenzugehörigkeit (Variablen PSAMPLE in PPFAD bzw. HSAMPLE in HPFAD) verändert sich grundsätzlich nicht. 
Weder durch den Wechsel der Staatsbürgerschaft noch durch den Umzug in eine andere Sample-Region (von West- nach Ostdeutschland oder umgekehrt). 
Die Person bleibt trotzdem in der Ausländer-, bzw. West- oder Oststichprobe. Die aktuelle Nationalität (NATION$$) bzw. Regionalzugehörigkeit ($SAMPREG) ist leicht erkennbar.

Variable: PSAMPLE in PPFAD bzw. HSAMPLE in HPFAD
Variableninhalt: Stichprobenzugehörigkeit
*Ansprechpartner: *


**Welche Variable enthält eine korrekte regionale Zuordnung der Befragten ($SAMPREG vs. PSAMPLE bzw. HSAMPLE)?**
Mittlerweile sind zahlreiche Befragte von Ost- nach Westdeutschland und - in geringerem Umfang von West- nach Ostdeutschland - umgezogen. Analysen, die auf regionale Bezüge abstellen, werden durch Verwendung der Variablen PSAMPLE, die die Stichprobenzugehörigkeit angibt, zum Teil erheblich verzerrt (PSAMPLE befindet sich in PPFAD: 1 = Subsample A, 2 = Subsample B, 3 = Subsample C, 4= Subsample D (Zuwanderer), 5 = Subsample E (Ergänzungsstichprobe ab 1998), 6 = Subsample F (Innovationsstichprobe ab 2000)). 
Eine korrekte regionale Zuordnung der Stichprobenmitglieder wird nur über die zeitabhängigen Variablen $SAMPREG in PPFAD und HPFAD erreicht (1 = Westdeutschland, 2 = Ostdeutschland). 
In $SAMPREG wird seit 1990 für jedes Jahr die west- bzw. ostdeutsche Population unabhängig von der Sample-Zugehörigkeit ermittelt. Wir empfehlen, immer diese Variable für regionale Analysen zu verwenden! 

Variable: $SAMPREG vs. PSAMPLE bzw. HSAMPLE
Variableninhalt: regionale Zuordnung der Befragten
*Ansprechpartner: *


**Welche Variable enthält eine korrekte Zuordnung von deutschen und nicht-deutschen Befragten in den einzelnen Stichproben A-F (NATION$$ vs. PSAMPLE)?**
Analog zum o.g. Phänomen ($SAMPREG vs.P SAMPLE) wird häufig auch eine Identität des Samples B mit der Population der im SOEP interviewten Gruppe der "Ausländer" unterstellt, während Sample A mit "Deutschen" gleichgesetzt wird. Dies trifft zwar im Großen und Ganzen zu, ist jedoch nicht exakt und wird im Zeitverlauf immer weniger genau.
Zu Beginn des SOEP im Jahre 1984 war es die Nationalität des Haushaltsvorstands, die eine Zugehörigkeit in die beiden Samples A und B festlegte. Nichtdestotrotz konnten weitere Haushaltsmitglieder mit einer anderen Nationalität als derjenigen des Vorstandes in diesen Haushalten leben. Zudem enthielt auch Sample A AusländerInnen, sofern sie nicht einer der durch Sample B repräsentierten Nationalitäten angehörten. Deutlich verstärkt wird das Auseinanderklaffen von SAMPLE-Zugehörigkeit und (zeitpunktbezogener) Nationalitätsinformation insbesondere durch das Einbürgerungsverhalten von Personen im Sample B. 
Während Sample C auch bis zum Jahr 2000 fast ausnahmslos aus Personen mit deutscher Nationalität besteht, enthält Sample D aufgrund des hohen Anteils an Aussiedlern verhältnismäßig viele Deutsche.
In den neueren Samples E und F ist eine ex-ante Zuordnung der entsprechenden Personen zu "Deutschen" oder "Nicht-Deutschen" aufgrund des Stichproben-Ziehungsdesigns schlichtweg nicht möglich. 

Variable: NATION$$ vs. PSAMPLE
Variableninhalt: Zuordnung von deutschen und nicht-deutschen Befragten
*Ansprechpartner: *


**Wie erklärt sich die Diskrepanz bei der Bildung von Gebäudetypen mittels der Variablen $WUM1 und CNSTYR$?**
Bei dieser Herangehensweise muss sicher gestellt sein, dass bei der Variablem $WUM1 jeweils nur aus den Datensätzen $HBRUTTO die Informationen verwendet werden und nicht aus HBRUTT$$.
Denn für alle teilnehmenden Haushalte liegen nur in den Datensätzen $HBRUTTO valide Angaben vor. 
Die Variable $STELL=0 muss nicht als Selektionskriterium verwendet.
Es empfiehlt sich die Analyse direkt mit der Variablen $HNETTO=1 (aus dem File HPFAD) auf die teilnehmenden Haushalte zu begrenzen. 

Variable: $WUM1, CNSTYR$, $STELL und $HNETTO aus HPFAD
Variableninhalt: Gebäudetypen
*Ansprechpartner: Markus Grabka*


**Es konnten insgesamt nur ca. 20 gleichgeschlechtliche Paare über die ‘household grid’ identifiziert werden. 
In anderen (random sample based) Surveys findet man meistens, dass um die 0.9% aller Paare gleichgeschlechtlich sind (zum Bsp. General & European Social Survey oder Generations and Gender Survey). 
Von daher würde man mindestens etwa 200 Paare erwarten.**
Mit folgendem Skript werden für das Jahr 2012
- 29 Personen mit eingetragenen Lebenspartnerschaften
- 38 gleichgeschlechtliche (nicht verpartnerte) Personen bzw. 19 Partnerschaften/Beziehungen, die in einem Haushalt wohnen
ermittlt.

Informationen über gleichgeschlechtliche Paare, die nicht im gleichen Haushalt wohnen, liegen lt. Fragebogen nicht vor.

use "S:\DATA\soep29_de\stata\bcp.dta", clear
* 29 Personen mit eingetragene Lebenspartnerschaften ...
fre bcp129
* ... in 18 Haushalten
fre hhnrakt if bcp129==6
* 3724 Ledige in Partnerschaften
fre bcp13001
* 1930 von 3724 Partner im HH
fre bcp13002
* bcp13002 suchen in bcpnr
* hhnrakt aktueller Haushaltsnummer

* file für Partner herstellten:
keep hhnrakt bcpnr bcp12801
rename bcpnr bcp13003
rename bcp12801 bcp12801partner
save c:/temp/partner.dta, replace


use "S:\DATA\soep29_de\stata\bcp.dta", clear
* Partnergeschlecht nur wenn fester Partner im HH wohhnt
keep if bcp13001==1 & bcp13002==1
* Fehlerkorrektur (Person hat Beziehung mit sich selbst)
drop if bcpnr==bcp13003
merge 1:m hhnrakt bcp13003 using c:/temp/partner.dta, keep(matched)
gen gg=1 if bcp12801partner==bcp12801
* 38 gleichgeschlechtliche Personen, die mit Partner im Haushalt wohnen
fre gg

Fazit: Von 20,806 im Jahr 2012 interviewten Personen leben 38 mit ihrex gleichgeschlechtlichen Partnerx im Haushalt und 29 in einer eingetragenen Lebenspartnerschaft. (Von 7 Personen, die zu einer dieser 29 eingetragenen Lebenspartnerschaften gehören, liegen keine Angaben vor.) Es gibt keine Informationen im SOEP über gleichgeschlechtliche Partnerschaften/Beziehungen, die nicht eingetragen sind und sich auf 2 Haushalte erstrecken.

Ähnliches sollte auch mit SOEPlong funktionieren.

Variable: bcp12801, bcp129, bcp13001, bcp13002 und bcp13003
Variableninhalt: gleichgeschlechtliche Paare
*Ansprechpartner: Knut Wenzig*


**Wo steht, an welchem Ort (z.B. Bundesland) die Kinder des jeweiligen Haushalts geboren sind?**
Im SOEP gibt es keine spezielle Frage bzgl. des Geburtsortes, nur 'country of birth'. 
Mit dem SOEP ist nicht mit Sicherheit feststellbar, in welchem Bundesland das Kind geboren wurde. 
Für Kinder, die während der Befragungperiode geboren wurden, gäbe es die Möglichkeit sich anzusehen, in welchem Bundesland die Familie gelebt hat als das Kind zur Welt gekommen ist und dann anzunehmen, dass das der Geburtsort ist. 
Im Forschungsdatenzentrum des DIW ginge  das sogar auf noch kleinräumigerer Ebene (Kreis, Gemeinde, Postleitzahl) zu berechnen. 
Für Kinder bzw. Jugendliche, die bei Geburt noch nicht im Befragungshaushalten waren, geht das leider nicht zu analysieren.

Variable:
Variableninhalt: country of birth / Geburtsland
*Ansprechpartner: Pia Schober*


**Werden in der Variable Jobch aus dem PGEN Datensatz die Wechsel nur Wechsel zu einer neuen Firma definiert 
oder auch Wechsel der Position innerhalb der gleichen Firma?**
In der Variable Jobch werden sowohl Wechsel innerhalb der Firma als auch Wechsel zu einer anderen Firma als Wechsel definiert.

Variable: jobch
Variableninhalt: Wechsel innerhalb einer Firma oder nach außen
*Ansprechpartner: Alexandra Fedorets*


**Welche Variable ist am Ehesten geeignet, um die Arbeitslosigkeit zu ermitteln?**
Zur Messung der Arbeitslosigkeit eignet sich die Variable "arbeitslos gemeldet" besser als die Variable, die auf Kalenderangaben basiert. 
Grund dafür ist, dass die variable plb0021 registrierte Arbeitslosigkeit zu einem Stichtag misst. 
Die Kalender-basierte Variable (z.B. kal1d01) bezieht sich auf alle Episoden der Arbeitslosigkeit aus dem Vorjahr. 
Für die Messung der Arbeitslosigkeit ist es üblicher, Stichtag-bezogene Informationen zu nutzen.

Variable: plb0021
Variableninhalt: arbeitslos gemeldet
*Ansprechpartner: Alexandra Fedorets*


**Wird der Grad der Erwerbsminderung anders berechnet als der Grad der Behinderung?**
Die Variable misst den Grad der Behinderung nach Behindertenrecht, 
die verminderte Erwerbsfähigkeit nach dem Rentenversicherungsgesetz (in Prozent und in Zehner-Schritten)und 
die Minderung der Erwerbsfähigkeit nach dem Unfallversicherungsgesetz.

Variable:
Variableninhalt: Grad der Behinderung oder Erwerbsminderung
*Ansprechpartner: Alexandra Fedorets*


**Warum hat die Variable "p_nace" hat über alle Wellen hinweg eine sehr hohe Anzahl an "trifft nicht zu (-2)" -Werten?**
Die nace-Angaben in den Personen-files geben die jeweiligen Angaben so an, wie sie im Erhebungsinstrument (vercodet) erfasst wurden -
da die Erwerbsfragen zum Teil im 2-jährigen Rhythmus voll erfasst werden  - dazwischen nur im Falle beruflicher Veränderungen -
ist zu empfehlen, auf die korrespondierende Variable in den pgen-files zuzugreifen - da sind in jedem Jahr alle in geprüfter Weise drin.

Variable: p_nace
Variableninhalt: Wirtschaftszweig – Branche
*Ansprechpartner: Peter Krause*


**Wo finde ich Angaben zum Geburtszeitpunkt von Mutter und Kind?**
Die Geburtsangaben sind für einige der Erwachsenen und Kinder, deren letzte Befragung schon länger zurückliegt, unvollständig. 
Grundsätzlich sind die Angaben zum Geburtszeitpunkt (gebjahr & gebmonat) in der Datei ppfad. 
Für die Kinder zusätzlich in biobrth bzw. biobrthm in den variablen kidmon[nn].

Variable: gebjahr und gebmonat in ppfad / kidmon[nn] in biobrth bzw. biobrthm
Variableninhalt: Geburtsmonat
*Ansprechpartner: Christian Schmitt*


**Wo steht, wie viele Personen im Haushalt unter 16 Jahre alt sind und welche Variablen werden üblicherweise zur Bedarfsgewichtung des Nettohaushaltseinkommens genutzt?**
Entsprechende Variable zur Erstellung der modifizierten OECD-Äquivalenzskala sind in den $PEQUIV-Files.
Die Variablen heißen: 
D11106$$ (Zahl der Haushaltsmitglieder) und
H11101$$ (Zahl der Kinder im HH bis 14 Jahren).

Weitere Informationen sind in der Dokumentation zu den $PEQUIV-Files zu finden.
Siehe: <http://panel.gsoep.de/soep-docs/surveypapers/diw_ssp0143.pdf>

Variable: D11106$$ und H11101$$ in $PEQUIV
Variableninhalt: modifizierte OECD-Äquivalenzskala
*Ansprechpartner: Markus Grabka*