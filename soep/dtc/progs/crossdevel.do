* Version SOEP 32, Mathis Schroeder, Jan Goebel
* produces figure "Cross-Sectional Development of Sample Size"

clear all
use *netto psample letztbef using /mnt/rdc-gen/consolidated/soep-core/soep.v33/consolidated1/ppfad.dta

qui sum letztbef
local last=r(max)
dis `last'
qui tab psample
local cols=r(r)
levelsof psample, local(samps)

matrix define countme=J(`last'-1984+1,`cols'+1,.)
local row=1
qui foreach wv in a b c d e f g h i j k l m n o p q r s t u v w x y z ba bb bc bd be bf bg {
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

local colnm "A B C D E F G H I J K L1 L2 L3 M1 M2 M34"
matrix colnames countme=`colnm' year

svmat countme, names(col)
keep A-M34 year
dropmiss, obs force


* note: set scheme(s2color) to scheme(s2mono) for black and white if necessary. 

#d;
graph bar (first) A B C D E F G H I J K L1 L2 L3 M1 M2 M34, over(year, label(angle(ninety))) stack 
   bar( 1, lcolor(black) lpattern(solid)) bar( 2, lcolor(black) lpattern(solid)) bar( 3, lcolor(black) lpattern(solid)) 
   bar( 4, lcolor(black) lpattern(solid)) bar( 5, lcolor(black) lpattern(solid)) bar( 6, lcolor(black) lpattern(solid)) 
   bar( 7, lcolor(black) lpattern(solid)) bar( 8, lcolor(black) lpattern(solid)) bar( 9, lcolor(black) lpattern(solid)) 
   bar(10, lcolor(black) lpattern(solid)) bar(11, lcolor(black) lpattern(solid)) bar(12, lcolor(black) lpattern(solid))
   bar(13, lcolor(black) lpattern(solid)) bar(14, lcolor(black) lpattern(solid)) bar(15, lcolor(black) lpattern(solid))
   bar(16, lcolor(black) lpattern(solid)) bar(17, lcolor(black) lpattern(solid))
	ylabel(, angle(zero)) 
	legend(order(1 "Sample A" 2 "Sample B" 3 "Sample C" 4 "Sample D1/D2" 5 "Sample E" 
	             6 "Sample F" 7 "Sample G" 8 "Sample H" 9 "Sample I" 10 "Sample J"
                     11 "Sample K" 12 "Sample L1" 13 "Sample L2" 14 "Sample L3" 15 "Sample M1"
                     16 "Sample M2" 17 "Sample M3/M4") 
               cols(6) region(lcolor(white)) position(12) symxsize(small)) 
        scheme(s2color) xsize(20) ysize(13) graphregion(fcolor(white));
#d cr	

*graph export ../graphics/crossdevel.ps,  replace
graph export ../graphics/crossdevel.eps, replace
shell convert ../graphics/crossdevel.eps  ../graphics/crossdevel.png

set linesize 200 
order year 
list , table clean
