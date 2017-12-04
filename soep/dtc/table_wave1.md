---
layout: dtc
---
```stata
* Version SOEP 33, Mathis Schroeder, Jan Goebel
* creates Table "Starting Sample Size of SOEP-Samples"
* For new years without new samples, this should run with a new "ppfad" and and the addition of a new wave letter in local "waves".
* For new samples, local "rownm" needs to be extended accordingly.

clear all
local waves "a b c d e f g h i j k l m n o p q r s t u v w x y z ba bb bc bd be bf bg"
local rownm "A B C D1 D1/D2 E F G H I J K L1 L2 L3 M1 M2 M3 M4"

use *hhnr *netto psample letztbef using /mnt/rdc-prod/distribution/soep-core/soep.v33/stata_en/ppfad.dta, clear

qui sum letztbef
local last=r(max)
dis "Last year is " `last' "."
qui sum psample
local rows=r(max)
dis "Max psample is " `rows' "."

forvalues smp=1/`rows' {
   gen sampout`smp'=0
}   

matrix define countme=J(`rows'+1,6,.)
local row=1
qui forvalues smp=1/`rows' {
   local year=1984
   foreach wv in `waves' {
      count if psample==`smp' & sampout`smp'==0 & `wv'netto>0
	   if r(N)>0 & `smp'!=4 {
         matrix countme[`row',1]=`year'   
	      matrix countme[`row',3]=r(N)
         count if psample==`smp' & sampout`smp'==0 & inrange(`wv'netto,10,19)
	      matrix countme[`row',4]=r(N)
         count if psample==`smp' & sampout`smp'==0 & (inrange(`wv'netto,10,19) | inrange(`wv'netto,30,39))
	      matrix countme[`row',5]=round(100-countme[`row',4]/r(N)*100,.1)
         count if psample==`smp' & sampout`smp'==0 & inrange(`wv'netto,20,29)
	      matrix countme[`row',6]=r(N)
         preserve
            bysort `wv'hhnr: gen hh=1 if _n==1
            count if psample==`smp' & sampout`smp'==0 & hh==1
            matrix countme[`row',2]=r(N)
         restore
         replace sampout`smp'=1
      }  
	   if r(N)>0 & `smp'==4 {
         matrix countme[`row',1]=`year'   
	      matrix countme[`row',3]=r(N)
         count if psample==`smp' & sampout`smp'==0 & inrange(`wv'netto,10,19)
	      matrix countme[`row',4]=r(N)
         count if psample==`smp' & sampout`smp'==0 & (inrange(`wv'netto,10,19) | inrange(`wv'netto, 30, 39))
	      matrix countme[`row',5]=round(100-countme[`row',4]/r(N)*100,.1)
         count if psample==`smp' & sampout`smp'==0 & inrange(`wv'netto,20,29)
	      matrix countme[`row',6]=r(N)
         preserve
            bysort `wv'hhnr: gen hh=1 if _n==1
            count if psample==`smp' & sampout`smp'==0 & hh==1
            matrix countme[`row',2]=r(N)
         restore
         if `year'==1994  {
            local row=`row'+1
         }   
         if `year'==1995  {
            replace sampout`smp'=1
         }   
      }  
      local year=`year'+1
   }
   local row=`row'+1
}

matrix colnames countme=year hh pp_br pp_net punr% kids 
matrix rownames countme=`rownm'
matrix list countme, format(%9.0gc)
```
