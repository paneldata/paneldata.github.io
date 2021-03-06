---
title: "Allgemein"
---
Allgemeine Fragen zum SOEP Datensatz
====================================

**Wie kann ich die Daten über SAS nutzen?** 
  
Eine Installationsanleitung für SAS gibt es hier: „SAS_Installationsanleitung“. 
Weitere Informationen befinden sich unter http://www.diw.de/de/diw_02.c.239885.de/sas.html. 

*Ansprechpartner: Jan Goebel* 
   
		
**Sind die von mir gesuchten Variablen im SOEP enthalten?** 
  
Mit dem interaktiven Programm SOEPinfo v.2 können Sie gezielt nach Themenbereichen und Schlagworten suchen und einen Überblick über alle erhobenen Variablen (inkl. Häufigkeitsauszählungen) und Fragebögen erhalten. 
Dies funktioniert auf Quer- und Längsschnittdatenebene.

*Ansprechpartner: Marcel Hebing*  
    

**Was sind generierte Variablen und wann greife ich am besten auf sie zurück?** 
  
Generierte Variablen dienen ebenso wie Status-Variablen der Vereinfachung der Arbeit mit den SOEP-Daten. 
Bei ihrer Generierung fließen jeweils spezifische Annahmen ein, die Sie der Dokumentation entnehmen können. 
Schauen Sie die Dokumentation für die Files [$PGEN](http://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.60055.de/pgen.pdf) und [$HGEN](http://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.60053.de/hpfad.467493.pdf) an.

*Ansprechpartner:*    
 
 
**Wie kann ich deutsche Variablenlabels in Stata auf Englisch anzeigen lassen?**  

Um sich in Stata alle deutschen Variablenlabels auf Englisch anzeigen zu lassen nutzen Sie bitte den Befehl: 
label language EN.    

*Ansprechpartner:*  
  
  
**Wann war die Umstellung von PAPI auf CAPI?**

In rund der Hälfte der Fälle in Stichprobe E wird - im Rahmen eines zufälligen Splittings der Stichprobe - seit dem Jahr 2000 die für das SOEP neue Erhebungsmethode CAPI (=Computer Assisted Personal Interview) angewandt. 
Sie identifizieren diese Interviews in der Variablen $PFORM* in $PBRUTTO bzw. $HFORM* in $HBRUTTO. Erste erhebungsmethodische Analysen zeigten keine signifikanten Methodeneffekte. 
D.h., für die inhaltlichen Ergebnisse scheint die Form der Datenerhebung keinerlei eigenständige Einflüsse auszuüben. Weitere Analysen zur Erhebungsmethode durch Nutzer/innen sind natürlich sinnvoll. 
Seit dem Jahr 2001 wird diese Erhebungsmethode zunehmend auch in den Alt-Stichproben A bis D sowie F eingesetzt.   

*Ansprechpartner:*   
  
  
**Was ist der Jugendfragebogen?**   

Seit dem Jahr 2000 werden im SOEP Daten zu kinder- und jugendspezifischen Themen mit einem eigenen Instrument, dem Jugendfragebogen, erhoben. 
Er wird anstelle des Lebenslauffragebogens erhoben, weil die dort gestellten Fragen zur Familien- und Berufsbiographie für die Jugendlichen noch nicht zutreffen und Angaben zur sozialen Herkunft i.d.R. bereits vorliegen. 
Nur in den Fällen, in denen Jugendliche nicht mehr mit einem oder beiden Elternteilen zusammenwohnen, werden die entsprechenden Informationen über die Eltern erhoben. 
Zusätzlich werden die Standardfragen zur Immigration aus dem Lebenslauffragebogen an zugewanderte Jugendliche gestellt. 
Somit wird gewährleistet, dass alle wichtigen Informationen, die im Lebenslauffragebogen erhoben werden, auch für Jugendliche vorliegen. 
Der Jugendfragebogen enthält insbesondere retrospektive Fragen zur Schullaufbahn (Empfehlung für die Sekundarstufe I, Wiederholung einer oder mehrerer Klassenstufen), zur Musikerziehung und zum Sport wie auch zur aktuellen Situation (schulische Leistung, Freizeitgestaltung, Jobben, Verhältnis zu den Eltern etc.). 
Auch werden zahlreiche Prospektivfragen zu (Aus-)Bildungsplänen und Erwartungen an die berufliche und familiäre Zukunft gestellt. 
Die Jugenddaten ermöglichen somit zahlreiche Analysen, da sie retrospektive Informationen zur Kindheit enthalten, die mit der Geschichte der Eltern verknüpfbar sind, sowie auch prospektive Fragen. 
Da im SOEP alle Haushaltsmitglieder ab 17 Jahren befragt werden, eignet sich die Datenlage u.a. hervorragend für intergenerationale Analysen. 
Im Jahr 2000 wurde ein Pre-Test mit 232 Jugendlichen durchgeführt, die in SOEP-Haushalten leben (17-Jährige in Sample A-E). 
Einen erweiterten und überarbeiteten Fragebogen haben im Jahr 2001 618 Jugendliche, die zwischen 17 und 19 Jahre alt wurden, ausgefüllt (17-Jährige in Sample A-E, 17 bis 19-Jährige in Sample F). 
Die Daten der beiden Befragungen (850 Personen) sind in dem Datensatz "BIOYOUTH" abgelegt. 
Ab dem Jahr 2002 füllen jeweils alle 17-jährigen Jugendlichen, die erstmals persönlich in einem SOEP-Haushalt befragt werden, zum Start ihrer "Befragungskarriere" den Jugendfragebogen aus. 
Das sind pro Welle etwa 350 Jugendliche. So wird kumulativ sehr rasch ein großer jugendspezifischer Datensatz entstehen. 

*Ansprechpartner:*
 
 
**Können Skripte an Dritte weitergegeben werden?**  

Eine Weitergabe von Daten aus dem SOEP bedarf immer der Zustimmung des SOEPs. Sollten die Daten nicht weitergabefähig sein, darf der Herausgeber aus Datenschutzgründen nur vom Re-Analysis Archiv Gebrauch machen: 
<http://www.diw.de/de/diw_01.c.340858.de/soep_re_analyses.html> 
Die Daten werden dann bei uns hinterlegt und Wissenschaftler können die Daten vom SOEP bekommen (nach Abschluss eines Datennutzungsvertrags).    

*Ansprechpartner: Jan Goebel*   

 
**Ist es möglich eine frühere Version der Daten zu bekommen, z.B. die Datenlieferung der Welle v28?** 

Ja, mit einem gültigen Datenweitergabevertrag kann bei der SOEPhotline eine ältere digitale Datenlieferung bestellt werden.   

*Ansprechpartner: Michaela Engelmann* 


**Wie sind long Variablennamen aufgebaut?**   

Im soeplong sind alle variablen über die zeit konsistent und strukturiert zusammengeführt. Anders als bei den Querschnitts-Files spiegelt deshalb die Reihenfolge der Variable nicht die Stellung im Fragebogen wider. 
Die Namensgebung ist dabei wie folgt:  
Beispiel: PLH0171 
Das P am Anfang steht für "Personen". 
An Zweiter Stelle steht das L für "Long-vars" (alternativ C = Long-vars für Ursprungsdaten bei Recodierung oder A = Long-vars bei Strings). 
An dritter Stelle steht das Topic und an vierter bis achter Stelle die laufende Nummer der Long-Variablen.  

*Ansprechpartner:* 

    
**Gibt es online Codebücher?** 

Zur Zeit gibt es das nicht. Es gibt eine Liste aller Variablennamen über die Zeit zum Download (http://panel.gsoep.de/items/items2013-2015-03-05.zip). 

*Ansprechpartner: Uta Rahmann*    

   
**Warum lässt sich der Datensatz nicht öffnen?**    

Wie die Fehlermeldung sagt, das Betriebssystem gibt stata nicht mehr Speicher, entweder andere Programme schliessen oder mehr Speicher in den Computer stecken. 
Variablen selektieren schon beim öffnen kann man mit: use varlist using "[dataset].dta" und sich anzeigen lassen welche Variablen es im Datensatz gibt, ohne ihn aufzumachen kann man in Stata auch: 
"describe using [dataset].dta".  

*Ansprechpartner: Jan Goebel*

    
**Was ist mit FiD passiert?**  

Die FiD-Stichprobe wurde danach als reguläres Sample in das SOEP aufgenommen. Bei der ersten gemeinsamen Weitergabe zur Welle be werden dann auch integrierte Hochrechnungsfaktoren für alle Wellen zur Verfügung stehen.

*Ansprechpartner: Rainer Siegers*    

 
**Was bedeutet die "-2"?**

Die "-2"-Werte bilden System-Missings bei uns ab, die auch erst von uns gesetzt werden. Sie sind also nicht im Codebuch unseres Feldinstituts zu finden.    

*Ansprechpartner:*    

 
**Werden Zins- und Mieteinnahmen sowie die genutzte Immobilie als Einkommen berücksichtigt?**    

Zins- und Mieteinnahmen sind Bestandteil der Haushaltsmarkt- bzw. verfügbaren Haushaltseinkommen. 
Das fiktive Einkommen aus dem Besitz einer selbstgenutzten Immobilie - auch Mietwert selbstgenutzten Wohneigentums genannt - wird in den Daten des Sozio-oekonomischen Panels simuliert, da man dies schwerlich erfragen kann. 
Die Idee hierbei ist, dass eine Bruttokaltmiete von Mietern im frei finanzierten Wohnungsbau geschätzt wird, und die  sich ergebenden Regressionskoeffizienten Eigentümern mit vergleichbaren Charakteristika zugewiesen  werden (z.B. Wohnfläche, Haushaltsgröße, Ausstattung, etc.). 
Von diesem fiktiven Bruttowert werden nun eigentümerspezifische  Kosten abgezogen, insbesondere Zinszahlungen für Hypotheken. 
Am Ende erhält man einen Nettomietwert  selbstgenutzten Wohneigentums, der Standardmäßig in unseren Einkommensanalysen mit aufgenommen wird.  

*Ansprechpartner:*  

   
**Wie wird die Case-ID ermittelt?** 

Es wird die Ursprungs-Haushaltsnummer als unveränderliche Case-ID verwendet, so dass alle demografischen Entwicklungen, die aus einem Haushalt hervorgegangen sind, nachvollzogen werden können. 
Entscheidend ist dabei der Ursprungshaushalt zum Ziehungszeitpunkt (die Case-ID ist deshalb eine Info, die mit der Stichprobenziehung verbunden ist). 
Weitergehende temporäre oder anhaltende Abspaltungen und Rückzüge sind anhand der zeitlichen Entwicklung der aktuellen Haushaltsnummer nachvollziehbar. Aus dieser leitet sich auch die unveränderliche Personennummer ab. 
Ein Sonderfall besteht, wenn Personen aus zwei Ursprungs-Haushalten zusammenziehen -- diese sogenannten Casematches sind ebenfalls dokumentiert - hierbei bleibt bei den Personen die Case-ID erhalten (so kann es -selten- zu Haushalten mit derselben aktuellen Haushaltsnummer, aber unterschiedlichen Case-IDs kommen) - die Haushaltsangaben müssen dann unter einem Case abgelegt sein. 

*Ansprechpartner: Peter Krause*
  
  
[Zurück zum Index](index.html)