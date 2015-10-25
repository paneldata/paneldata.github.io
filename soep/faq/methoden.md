---
title: "Methoden"
---
Fragen zu Methoden im SOEP Datensatz
====================================

**Wie erklären sich unterschiedliche Zahlen vom SOEP und dem statistischen Bundesamt?**

Das statistische Bundesamt berichtet in der Regel Zahlen zu Personen in Privathaushalten, 
bei denen Besitzer von Zweitwohnungen doppelt gezählt werden. 
Wenn die aktiven Befragten im SOEP auf solche in Privathaushalten beschränkt werden (vgl. die pop-Variable in ppfadl), 
dann stimmt die hochgerechnete Summe mit der Zahl der Personen in Privathaushalten am Erstwohnsitz von Destatis überein.
Neben dem Total, das uns das statistische Bundesamt jährlich zur Verfügung stellt, 
nutzen wir ausgewählte demographische Merkmale wie Alter, Geschlecht oder Nationalität zur Randanpassung. 
Der Familienstand gehört nicht zu diesen Merkmalen. Dadurch kann es durchaus zu Abweichungen der 
hochgerechnete SOEP-Zahlen zu bspw. geschiedenen Personen im Vergleich zum statistischen Bundesamt kommen. 
Diese Unterschiede können auch Ergebnis unterschiedlicher Befragungsinstrumente zur Messung des 
Familienstandes im SOEP und im Mikrozensus sein.

*Ansprechpartner: Martin Kroh*


**Was beschreibt der Bleibefaktor?**

Ein Bleibefaktor bildet die (inverse) Wahrscheinlichkeit ab, dass ein Haushalt bzw. eine Person der Vorwelle 
in der aktuellen Welle wieder befragt werden kann. 
Der Wert wird dann vergeben, falls der Haushalt bzw. die Person in der aktuellen Welle tatsächlich befragt wird 
(mit diesem Gewicht kann die kleinere, realisierte Stichprobe der Welle t die größere, realisierte Stichprobe 
der Welle t-1 in ihren Verteilungen wiederhergestellt werden). Insofern haben endgültige aber auch temporäre 
Ausfälle in den Jahren mit fehlenden Informationen den Wert 0. 
Weiterhin setzen Bleibefaktoren eine Vorwelle voraus. D.h., erstmalig befragte Haushalte bzw. Personen erhalten 
ebenfalls ein Bleibefaktor von 0. 

*Ansprechpartner: Martin Kroh*


**Wie gewichte ich den Quer- oder Längsschnittdatensatz so, dass er bevölkerungsrepräsentativ ist?**

Beispiel: Wieviel Prozent der Bevölkerung rauchen 2007?
Zur Gewichtung in Querschnittsanalysen wird der Querschnittshochrechnungsfaktor (hier: xphrf) verwendet. 

Beispiel: Wieviel Prozent der Bevölkerung geben zwischen 2007 und 2008 das Rauchen auf?
Bei Längsschnittanalysen bilden das Produkt des Querschnittsgewichts 2007 (hier: xphrf) und die inverse Bleibewahrscheinlichkeit 2008 (hier: ypbleib) ein neues Längsschnittgewicht.

Siehe zu Gewichtung:
<http://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.353319.de/soep_folien_gewichtung_2010.pdf>

*Ansprechpartner: Martin Kroh*


**Wie können ausgezogene SOEP-Befragte aus getrennten Partnerschaften identifiziert werden?**

Es gibt verschiedene Möglichkeiten:
1. Mittels der Haushalts-ID kann jahrweise geprüft werden, ob zwei Personen zu einem Zeitpunkt im selben Haushalt leben. 
Sicherheit über die zeitliche Entwicklung gibt es in diesem Fall nicht.

2. Im Haushaltsfragebogen gibt es eine Frage "Seit wann wohnen Sie in dieser Wohnung?". 
Im Datensatz hl befinden sich hierzu Informationen in den Variablen hlf0107 und hcf0034.

3. In hbrutto befindet sich die Variable wein (Welle Einzug an diese Adresse).

4. In pbrutto gibt es die Variablen pzug (Zugehoerigkeit zum HH).

5. Im Datensatz movedist gibt es ab dem Jahr 2000 die Variable distance, 
in der auf Basis der Adressen die Umzugsdistanz enthalten ist. 
(<http://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.74806.de/ror_dokumentation.pdf>)
Die Variable wäre dabei am geeignetsten.
So könnte man auch überprüfen, wie die Qualität der anderen Informationen ist, insbesondere, 
wenn man Trennungen vor Verfügbarkeit von distance anschauen will.

*Ansprechpartner: Knut Wenzig*


**Wie können Personen in „Erwerbstätige“, „Erwerbslose“ und „Nichterwerbspersonen“ oder andere Klassifikation unterteilt werden?**

Grundsätzlich können Erwerbsgruppen mit Hilfe der generierten Variablen emplst$$ und lfs$$ unterschieden werden, 
welche detaillierte Informationen zu Erwerbsstatus und unterschiedlichen Arten von Erwerbslosigkeit enthalten. 
Diese beiden Variablen ergänzen sich. Für detailliertere Berufs-Klassifikationen können auch die 
internationalen Klassifikationen wie klas$$, isco$$ oder mps$$ genutzt werden.

*Ansprechpartner: Alexandra Fedorets*


**Wie werden Vollzeit- und Teilzeit- Beschäftigungsverhältnisse bestimmt?**

Die Unterscheidung in der Variable empslt$$, die unter anderem angibt, 
ob eine Beschäftigung in Voll- oder Teilzeit ausgeübt wird, erfolgt NICHT aufgrund einer gewissen Stundenanzahl, 
sondern nach den persönlichen Angaben der Befragten. Mit dieser Variablen kann also keine Aussage über die 
Grenzen der Stundenanzahlen gemacht werden. Falls eine Stundenanzahl festgelegt werden soll, 
ab der einer Vollzeitbeschäftigung nachgegangen wird, so kann die vertraglich festgelegte oder die 
tatsächliche Stundenanzahl mit den Variablen $vebzeit und $tatzeit bestimmt werden und daraus eine 
passende Variable generiert werden. Es gibt keine offiziell festgelegten Stundensätze für Voll- und Teilzeitarbeit, 
aber in der Forschung wird häufig ab einer Wochenarbeitszeit von 31 Stunden von einer Vollzeitbeschäftigung gesprochen.

*Ansprechpartner: Alexandra Fedorets*


**Wie kann ich Rentnerinnen und Rentner im Datensatz identifizieren?**

Je nach Fragestellung bieten sich hierzu verschiedene Möglichkeiten an: 

1. Selbstauskunft der Befragten zum Erwerbsstatus im Vorjahr. 
Diese Information ist im Kalenderfile $PKAL abgelegt und umfasst die Art des Erwerbsstatus als 
Rentner/Pensionär [mit Hilfe der Variablen $P1E01 und $P1E02] bzw. 
den Bezug von Altersrente / Pension im Vorjahr [mit Hilfe der Variablen $P2D01 bis $P2D03] 

2. Alter der Befragungsperson (z.B. ableitbar aus der Variablen GEBJAHR in PPFAD)

3. Berücksichtigung des aktuellen Erwerbsstatus (nicht erwerbstätig), 
ggf. in Kombination mit der Altersangabe. Beachten Sie hierbei bitte, dass Rentner mit Arbeitsvertrag 
beim zentralen Erwerbsfilter (z.B. UP09) als erwerbstätig gelten

4. Personen, die erst seit kurzem den Status als Rentner / Pensionär innehaben, sind identifizierbar 
über den Grund für die Beendigung des letzten Beschäftigungsverhältnisses 
(z.B. Variable UP75, Code 6: "Erreichen der Altersgrenze / Rente / Pension")

5. Darüber hinaus sind natürlich auch Kombinationen dieser genannten Varianten möglich, 
wie z.B. "Alter > 65 Jahre" und gleichzeitig "Bezug einer Altersrente"

*Ansprechpartner: *


**Warum gibt es Gewichte von 0?**

In einigen Einzelfälle gibt es Gewichte von 0, auch wenn die Personen/Haushalt an der Befragung teilgenommen haben. 
Dies betrifft Haushalte, die über ein sogenanntes Schneeball-Verfahren gezogen wurden 
(regulär gezogene Aussiedler-HH in Sample D wurden nach weiteren Aussiedler-HH gefragt). 
Da die Ziehungswahrscheinlichkeit dieser Schneebälle nicht ableitbar ist, bekommen sie kein Gewicht. 
In gewichteten Analysen werden die Angaben dieser Fälle somit nicht für die 
Schätzung des interessierenden Parameters in der Grundgesamtheit genutzt.

*Ansprechpartner: Martin Kroh*


**Wie verwende ich Gewichte in einem Sample, das mehrere Jahre umfasst?**

Wenn die Samples jeweils als Bevölkerungsquerschnitte (z.b. pro Welle, aber auch gepoolt) beschrieben werden, 
würde es sich empfehlen, die entsprechenden jahresspezifischen Querschnittsgewichte zu verwenden ($phrf bzw $hhrf).

Wenn Panel-Fixed Effects Modelle in den Jahren z.B. 1995-1998 berechnet werden, ist es sinnvoll, 
den Effekt von Attrition durch die Verwendung von Längsschnittgewichten abzuschätzen. 
Dazu sollten im balancierten Fall das Querschnittsgewicht des ersten Jahres (1995) mit den 
Bleibefaktoren bis zum letzten Jahr (1998) multipliziert werden.
Im unbalancierten Fall unterscheidet sich das erste und das letzte Beobachtungsjahr für Untersuchungen. 
In dem Fall muss jeweils das erste beobachtete Querschnittsgewicht der Untersuchung mit den 
jeweils folgenden Bleibefaktoren multipliziert werden. Um Gewichte von Null zu vermeiden, sollten vorab 
Bleibefaktoren von 0 auf 1 rekodiert werden.

Stata produziert Probleme bei zeitveränderlichen Gewichten im Fall des unbalancierten Panel-FE Modells (xtreg). 
Alternativ kann das gewichtete Least-Squares-Dummy-Variables Modell verwendet werden (areg).

*Ansprechpartner: Martin Kroh*


**Wo finde ich die Geschlechtsangabe für Jugendliche?**

Das Geschlecht der Jugendlichen (und aller anderen Befragten) ist in dem ppfad-Datensatz enthalten, 
indem dieser via der Personen-ID, mit z.B. dem Jugendfragebogen verknüpft wird. 
"ppfad" enthält die über die Zeit hinweg stabilen Personenmerkmale für alle SOEP Befragten. 

*Ansprechpartner: Pia Schober*


**Wie bestimme ich, ob ich Design- oder Querschnittsgewichte anwenden soll?**

Die Design-Gewichte beschreiben lediglich Unterschiede in den Ziehungswahrscheinlichkeiten der gezogenen 
Brutto-Stichprobe. Die Querschnittsgewichte der Welle 1 bauen auf den Designgewichten auf und berücksichtigen 
zusätzlich ausfallbedingte Abweichungen zwischen der gezogenen Bruttostichprobe und der realisierten Netto-Stichprobe. 
Insofern würde ich Ihnen die Verwendung der Querschnittsgewichte empfehlen.
Die cluster-Option bezieht sich nicht auf disproportionale Ziehungswahrscheinlichkeiten, 
sondern auf die Klumpung der Stichprobe in regionale Sampling Points der Feldbearbeitung. 
Diese Information ist in der Variable PSU im Datensatz DESIGN abgelegt.

*Ansprechpartner: Martin Kroh*

**Wie kann ich die Verteilungen nach Bundesländern durch die Gewichtung der SOEP-Daten replizieren?**

Im SOEP gibt es querschnittliche Gewichtungsvariablen (z.B. für Personen des Jahres 2012 => bcphrf im Datensaz phrf), 
mit denen die SOEP-Stichprobe eines Jahres auf die Grundgesamtheit "hochgerechnet" werden kann. 
Diese Gewichtungsvariablen bauen u.a. auf Daten des statistischen Bundesamtes auf. 
Solange das Analyse-Sample nicht allzu selektiv ist, sollte in etwa die Verteilung nach Bundesländern 
durch die Gewichtung der SOEP-Daten repliziert werden können.

*Ansprechpartner: Martin Kroh*


**Wieso kann ich ältere Berechnungen mit Hochrechnungsfaktoren nicht mit gleichen Ergebnissen reproduzieren?**

Tatsächlich ist es so, dass in verschiedenen Datengenerierungsprozessen einer Datenweitergabe 
alle Daten früherer Wellen neu erstellt werden. Das ist z.B. bei den Partnerzeigern so, 
bei den imputierten Einkommen und den Gewichten. Im Rahmen der Gewichtung hat sich zwischen v28 und v29 bspw. 
die Randanpassung der Stichprobe J verändert, da Nutzer der Daten eine vergleichsweise hohe Quote an ALG 2 
Empfängern in den Daten festgestellt haben. Insofern kann es durchaus sein, 
dass nicht exakt dieselben Ergebnisse kommen, die ein anderer Nutzer mit einer anderen Datenversion generiert hat.

*Ansprechpartner: Florian Griese*
  
  
[Zurück zum Index](index.html)