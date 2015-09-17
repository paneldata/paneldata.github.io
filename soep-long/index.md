---
---


# SOEPlong

## Citation

* **Title:**	SOEPlong
* **Label:** (e.g. German Socio-Economic Panel Study (SOEP))
* **Citation guideline:** (e.g. a publication)
* **Persistent identifier:** (e.g. DOI)
* **Investigators/authors:** Jürgen Schupp; Peter Krause; Martin Kroh; Jan Goebel; Simone Bartsch; Marco Giesselmann; Markus Grabka;    
                Elisabeth Liebau; David Richter; Christian Schmitt; Daniel Schnitzlein;
                Frauke Peter; Ingrid Tucci

## Study info

SOEPlong is a complete and user-friendly data format for all wave-specific data, primary and generated, from SOEPcore. In the classic delivery, the data are provided annually as individual files and.  Ppriority is given to faithful reproduction of the data and the original sequence based on the respective survey instrument. On the basis of structured programmes, SOEPlong includes all SOEPcore data as timely and consistent long-variables. 
The time-consuming data preparation required for analyses is facilitated by SOEPlong in many ways: (1) SOEPlong provides all variables as time-consistent long-variables – this makes individual collecting, renaming, and recoding of variables in the time course unnecessary. (2) If required, the long-variables are already recoded (e.g., changing categories in the time course or income data in euro) and integrated (i.e. variables from P/H-OST / PAUSL / P_MIG datasets).  All changed variables are additionally provided as original coded  long-variables for the respective years for alternative recoding. (3) Moreover, figures for all long-variables are provided which document temporal monitoring, time-course distribution (bar charts and violin plots), acquisition and consistency of the population (missings) in the time course.
Provenance details infrom the biography and life history dataquestionnaires are only shared in SOEPlong (BIO). Moreover, the variables partner-status and partner-ID – also for non-realised household members – as well as enumerated weights are only available in SOEPlong (P/H-PFADL).
Specifically, the following files are provided in SOEPlong Version v301 (prepared biography and spell data are already available as long or spell format in SOEPcore and can be linked in the same way in SOEPlong)

## Missings

|Code | Meaning|
|:----:|-----|
|-1|no answer /don`t know|
|-2|does not apply|
|-3|implausible value|
|-4|inadmissible multiple response|
|-5|not included in this version of the questionnaire|
|-6|version of questionnaire with modified filtering|
|-8|question not part of the survey programm this year*

*Only applicable for datasets in long format.

## Data set

Table 		Files and Variables in SOEPlong V30L

|SOEPlong | SOEPcore|||||
|:------:|:-----------:|:-:|:-------:|:-----------:|:----------:|
|**L-Files**|**N of L-Vars**|**N**|**C-Files**|**N of C-Vars**|**N (min-max)**|
|_Tracking Files_|
|PPFADL |37|740982|PPFAD, PHRF|258|87095|
|HPFADL |11|302713|HPFAD, HHRF|191|37421|
|_Respondents-Files_|
|PL, PL2 |506401|_P, _PAUSL, _POST, _P_MIG|16628, 910 (BDP_MIG)|2015- 14170, 4964|
|HL|867|270148|_H, _HOST|5474|2179-14170|
|KIDL|64|131158|KIDLONG|64|131158|
|_Register-Files_|
|PBRUTTO|48|730272|_PBRUTTO|950|13709-37217|
|PBR_EXIT|44|8649|PBR_EXIT|44|8649|
|HBRUTTO|61|302810|_HBRUTTO|1011|5213-16096|
|_Generated Files_|
|PGEN |64|508540|_PGEN|1850|9710 -24576|
|HGEN |53|270148|_HGEN|1590|4690 - 14170|
|PEQUIV |209|665818|_PEQUIV|6270|12645 - 33391|
|_Population-Files_|
|PPFAD |18|87095|(PPFAD)|183|87095|
|HPFAD |2|37421|(HPFAD)|116|37241|
|CSAMP |5|80413|(SAMP)|7|80413|
|_Original Files_|
|BIO |1405|57220|--|--|--|
|Jugend |490|4447|(_PAGE17)|529|214 - 346|
|										

