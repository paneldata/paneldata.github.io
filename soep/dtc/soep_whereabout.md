---
layout: dtc
---
```stata
* Version SOEP 30, Mathis Schröder & Moritz Mannschreck & Jan Goebel
* produces figure "Longitudinal Development of the 1984 Population"

clear all
set mem 50m
set more off

* set the basics
local waves "a b c d e f g h i j k l m n o p q r s t u v w x y z ba bb bc bd be"
local maxwave: word count `waves'
local maxyear=1983+`maxwave' 
 
use ~/data/soep/soep31/stata/ppfad.dta, clear

* restrict to participants in 1984; desired n=16252
keep if anetto>0
count 
assert r(N)==16252

* generate a new netto variable 
label define net 1 "Moved abroad" 2 "Deceased" 3 "Under age 16" 4 "With interview" 5 "Temporary drop out" 6 "Declined to reply" 7 "No contact", modify 

qui foreach i in `waves' {
	gen byte `i'net=.
	replace `i'net=1 if (`i'netto>=91 & `i'netto<=93)					
	replace `i'net=2 if (`i'netto>=97 & `i'netto<=99)										
	replace `i'net=3 if (`i'netto>=20 & `i'netto<=29)										
	replace `i'net=4 if (`i'netto>=10 & `i'netto<=19)  | (`i'netto>=32 & `i'netto<=39)  // some other qnnaire in 32-39
	replace `i'net=5 if (`i'netto>=80 & `i'netto<=89)	| inlist(`i'netto,31,61,62) 	   // only luecke filled out for last year
	replace `i'net=6 if `i'netto==-2 | `i'netto==30
	replace `i'net=7 if (`i'netto!=-2 & ~inrange(`i'netto,29,39)) & ~inrange(`i'net,-2,5)
	lab values `i'net net
}

/*
im Jahr 2009 hat die Anzahl der Verstorbenen einen Sprung, liegt daran dass
"Hinweise zu Verstorbenen" im Jahr 2009 oft belegt ist --> wenn todjahr
vorliegt, die entsprechenden net Variablen ersetzen!
*/
local cnt=1
 qui {
   forvalues yr=1984/`maxyear' {
      local wv: word `cnt' of `waves'
      replace `wv'net=2 if znetto==97 & todjahr==`yr'
      rename `wv'net net`yr'
      local cnt=`cnt'+1
   }
}   

* Wenn net in einem Jahr auf -2 steht, ersetze den Code des Vorjahres 
qui forvalues i=1985/`maxyear' {
   local a=`i'-1
   replace net`i'=net`a' if net`i'==6 & net`a'!=-2 & (net`a'==1 | net`a'==2 | net`a'==7)
}

keep persnr net*
reshape long net, i(persnr) j(svyyear)

* graph mit "catplot"
#d;
catplot net, percent(svyyear) stack asyvars recast(bar) yreverse
   over(svyyear, label(angle(ninety))) ylabel(, angle(zero)) ytitle("") b1title("")
	legend(cols(4) region(lcolor(white)) position(12) symxsize(small)) 
   bar(1, lcolor(black) lpattern(solid)) bar(2, lcolor(black) lpattern(solid)) bar(3, lcolor(black) lpattern(solid)) 
	bar(4, lcolor(black) lpattern(solid)) bar(5, lcolor(black) lpattern(solid))
	scheme(s2color) xsize(20) ysize(12) graphregion(fcolor(white));
#d cr	

* graph export ../graphics/where2.ps,  replace
graph export ../graphics/where2.eps, replace 
! convert ../graphics/where2.eps ../graphics/where2.png

```
