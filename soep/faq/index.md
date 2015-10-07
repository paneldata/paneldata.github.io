---
title: "FAQ"
---
###FAQs about the SOEP.

#1. Allgemeine Fragen zum SOEP Datensatz

  1.  Wie kann ich die Daten über SAS nutzen?
  2.  Sind die von mir gesuchten Variablen im SOEP enthalten?
  3.  Werden zusätzlich tiefer gegliederte Regionaldaten zur Verfügung gestellt?
  4.  Sind Bundesländer repräsentativ auswertbar?
  5.  Was sind generierte Variablen und wann greife ich am besten auf sie zurück?
  6.  Wie kann ich deutsche Variablenlabels in Stata auf Englisch anzeigen lassen?
  7.  Wann war die Umstellung von PAPI auf CAPI?
  8.  Was ist der Jugendfragebogen?
  9.  Können Skripte an Dritte weitergegeben werden?
  10. Woher bekomme ich Zugang zum NEWSPELL Programm
  11. Welche Alternativen gibt es zum Programm NEWSPELL, um Mehrfachnennungen in Spelldaten zu eliminieren.
  12. Ist es möglich eine frühere Version der Daten zu bekommen, z.B. die Datenlieferung der Welle v28?
  13. Ist es möglich von einer Frage aus einem Fragebogen auf einen Variablennamen zu schließen?
  14. Wie sind long Variablennamen aufgebaut?
  15. Gibt es online Codebücher?
  16. Warum lässt sich der Datensatz nicht öffnen?
  17. Was ist mit FiD passiert?
  18. Was bedeutet die -2?
  19. Wir im SOEP auch das Einkommen und Vermögen erfasst?
  20. Wie wird die Case-ID ermittelt?
  

#2. Fragen zu Variablen im SOEP Datensatz

  1.  Geburt des ersten Kindes                                   - kidgeb01
  2.  Art der Befragung                                          - $$hivform
  3.  Personennummer                                             - persnr
  4.  Haushaltseinkommen                                         - Hinc01 in rhgen / Rh49 in rh
  5.  adjusted household income / angepasstes Haushaltseinkommen - AHINC$$
  6.  Number of Years of Education                               - d11109 in pequiv
  7.  Arbeitslos gemeldet                                        -
  8.  Grad der Behinderung oder der Erwerbsminderung             - 
  9.  Tatsächliche Wochenarbeitszeit                             - YP60
  10. Stichprobenzugehörigkeit                                   - PSAMPLE in PPFAD bzw. HSAMPLE in HPFAD
  11. regionale Zuordnung der Befragten                          - $SAMPREG vs. PSAMPLE bzw. HSAMPLE
  12. Zuordnung von deutschen und nicht-deutschen Befragten      - NATION$$ vs. PSAMPLE
  13. Gebäudetypen                                               - $WUM1, CNSTYR$, $STELL und $HNETTO aus HPFAD
  14. gleichgeschlechtliche Paare                                - bcp12801, bcp129, bcp13001, bcp13002 und bcp13003 
  15. country of birth / Geburtsland                             - 
  16. höchster Bildungsabschluss                                 - $ISCED in $$PGEN
  17. Wechsel innerhalb einer Firma oder nach außen              - jobch
  18. arbeitslos gemeldet                                        - plb0021
  19. Grad der Behinderung oder Erwerbsminderung                 - 
  20. Erwerbsstatus                                              - emplst und lfs
  21. Wirtschaftszweig – Branche                                 - p_nace
  22. Renteneintritt                                             - 
  23. Geburtsmonat                                               - gebjahr und gebmonat in ppfad / kidmon[nn] in biobrth bzw. biobrthm
  24. modifizierte OECD-Äquivalenzskala                          - D11106$$ und H11101$$ in $PEQUIV
  25. other expenditure / andere Ausgaben                        - HLF0432 
  26. Wochenstunden tatsächlich                                  - bbp64
  27. Haushaltsverschuldung                                      - 
  28. Social Assistance (SA) / Sozialunterstützung               - 
  29. Arbeitslosenhilfe                                          - IH4802, JH4802, KH4802, LH4802, MH4802, NH4802, OH4802, PH4802 und QH5202
  30. Elternzeit                                                 - 
  31. Race / "Menschenrasse"                                     - CORIGIN und NATION
  32. Kalenderangaben                                            - 
  33. Erwerbsstatus                                              - emplst$$
  34. desired weekly work hours / wöchentliche Wunscharbeitszeit - BCP46

  
#3. Fragen zu Methoden im SOEP Datensatz

  1.  Wie erklären sich unterschiedliche Zahlen vom SOEP und dem statistischen Bundesamt?
  2.  Was beschreibt der Bleibefaktor?
  3.  Wie gewichte ich den Quer- oder Längsschnittdatensatz so, dass er bevölkerungsrepräsentativ ist?
  4.  Wie können ausgezogene SOEP-Befragte aus getrennten Partnerschaften identifiziert werden?
  5.  Wie können Personen in „Erwerbstätige“, „Erwerbslose“ und „Nichterwerbspersonen“ oder andere Klassifikation unterteilt werden?
  6.  Wie werden Vollzeit- und Teilzeit- Beschäftigungsverhältnisse bestimmt?
  7.  Wie kann ich Rentnerinnen und Rentner im Datensatz identifizieren?
  8.  Warum gibt es Gewichte von 0?
  9.  Wie verwende ich Gewichte in einem Sample, das mehrere Jahre umfasst?
  10. Wo finde ich die Geschlechtsangabe für Jugendliche?
  11. Wie bestimme ich, ob ich Design- oder Querschnittsgewichte anwenden soll?
  12. Wo finde ich Zeitreihen zu Verteilungsmaßen für Deutschland?
  13. Wie kann ich die Verteilungen nach Bundesländern durch die Gewichtung der SOEP-Daten replizieren?
  14. Wieso kann ich ältere Berechnungen mit Hochrechnungsfaktoren nicht mit gleichen Ergebnissen reproduzieren?