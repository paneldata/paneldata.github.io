---
layout: dtc
---
```stata
* Version SOEP 30, Mathis Schroeder, Jan Goebel
* produces figure "Cross-Sectional Development of Sample Size"

clear all
use *netto psample letztbef using ~/data/soep/soep31/stata/ppfad.dta 

qui sum letztbef
local last=r(max)
dis `last'
qui tab psample
local cols=r(r)
levelsof psample, local(samps)

matrix define countme=J(`last'-1984+1,`cols'+1,.)
local row=1
qui foreach wv in a b c d e f g h i j k l m n o p q r s t u v w x y z ba bb bc bd be {
   forvalues i=1/`cols' {
       local smp : word `i' of `samps'
       count if inrange(`wv'netto,10,19) & psample==`smp'
       if r(N)>0 {
           matrix countme[`row',`i']=r(N)   
       }	 
   }
   local row=`row'+1
}

local rownm " "
local row=1
forvalues yr=1984/`last' {
   matrix countme[`row',`cols'+1]=`yr'   
   local rownm="`rownm'" + " " + string(`yr')
   local row=`row'+1
}
matrix rownames countme=`rownm'

local colnm "A B C D E F G H I J K L1 L2 L3 M1"
matrix colnames countme=`colnm' year

svmat countme, names(col)
keep `colnm' year
dropmiss, obs force

set linesize 255
list

* note: set scheme(s2color) to scheme(s2mono) for black and white if necessary. 

#d;
graph bar (first) `colnm', over(year, label(angle(ninety))) stack 
   bar( 1, lcolor(black) lpattern(solid)) bar( 2, lcolor(black) lpattern(solid)) bar( 3, lcolor(black) lpattern(solid)) 
   bar( 4, lcolor(black) lpattern(solid)) bar( 5, lcolor(black) lpattern(solid)) bar( 6, lcolor(black) lpattern(solid)) 
   bar( 7, lcolor(black) lpattern(solid)) bar( 8, lcolor(black) lpattern(solid)) bar( 9, lcolor(black) lpattern(solid)) 
   bar(10, lcolor(black) lpattern(solid)) bar(11, lcolor(black) lpattern(solid)) bar(12, lcolor(black) lpattern(solid)) 
   bar(13, lcolor(black) lpattern(solid)) bar(14, lcolor(black) lpattern(solid)) bar(15, lcolor(black) lpattern(solid)) 
	ylabel(, angle(zero)) 
	legend(order(1 "Sample A" 2 "Sample B" 3 "Sample C" 4 "Sample D" 5 "Sample E" 
	             6 "Sample F" 7 "Sample G" 8 "Sample H" 9 "Sample I" 10 "Sample J"
                     11 "Sample K" 12 "Sample L1" 13 "Sample L2" 14 "Sample L3" 15 "Sample M1") 
                     cols(6) region(lcolor(white)) position(12) symxsize(small)) 
	scheme(s2color) xsize(20) ysize(13) graphregion(fcolor(white));
#d cr	

*graph export ../graphics/crossdevel.ps,  replace
graph export ../graphics/crossdevel.eps, replace
shell convert ../graphics/crossdevel.eps  ../graphics/crossdevel.png


```
