* Version SOEP 30, Mathis Schroeder, Jan Goebel
* produces figure "Use of Different Interview Modes since 1984"

clear
set more off
set mem 100m

global sop "~/data/soep/soep31/stata/"
local waves "b c d e f g h i j k l m n o p q r s t u v w x y z ba bb bc bd be"

use persnr mode84 using $sop/apgen, clear
replace mode84=. if mode84<0
rename mode84 mode1984

local year=1984
foreach wv in `waves' {
  local year=`year'+1
  local yr=substr(string(`year'),3,2)
  merge 1:1 persnr using $sop/`wv'pgen.dta, nogen keepus(persnr mode`yr')
  replace mode`yr'=. if mode`yr'<0
  rename mode`yr' mode`year'
}  

reshape long mode, i(persnr) j(svyyear)
keep if ~missing(mode)

recode mode ///
         (100 110 = 1 "PAPI") ///
         (130 131 132 133 141 142 = 3 "SAQ (with Iwer)") ///
         (120 135 134 = 4 "SAQ (w/o Iwer)") ///
         (140 = 2 "CAPI") ///
         (150 = 6 "CAWI") ///
         (210 = 5 "Mail") ///
         (200 220 = . ) if mode<., into(newmode)
tab svyyear newmode 

* graph
#d;
catplot newmode , percent(svyyear) stack asyvars recast(bar)
   over(svyyear, label(angle(ninety))) ylabel(, angle(zero)) ytitle("") b1title("")
	legend(cols(6) region(lcolor(white)) position(12) symxsize(small)) 
   bar(1, lcolor(black) lpattern(solid)) bar(2, lcolor(black) lpattern(solid)) bar(3, lcolor(black) lpattern(solid)) 
	bar(4, lcolor(black) lpattern(solid)) bar(5, lcolor(black) lpattern(solid))
	scheme(s2color) xsize(20) ysize(12) graphregion(fcolor(white));
#d cr	

graph export ../graphics/mode.eps, replace
shell convert ../graphics/mode.eps  ../graphics/mode.png
