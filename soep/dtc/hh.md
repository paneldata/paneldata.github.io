---
layout: dtc
---
```R
##################################################################
## Produces figure "Old and New Households in the SOEP" for DTC ##
## Author: Jan Goebel                                           ##
##################################################################

soep.version <- 33
soep.waves <- c(letters, paste0("b", letters))[1:soep.version]
sample.shortnames <- c("A (1984)" , "B (1984)", "C (1990)", "D (1994/95)",
                       "E (1998)*", "F (2000)", "G (2002)", "H (2006)",
                       "I (2009)*", "J (2011)", "K (2012)",
                       "L1 (2010)", "L2 (2010)", "L3 (2011)",
                       "M1 (2013)", "M2 (2015)", "M3 (2016)", "M4 (2016)")

## create long version of hpfad
hpfad <- paste0("/mnt/rdc-prod/distribution/soep-core/soep.v", soep.version, "/stata_en/hpfad.dta")
require(foreign)
hpfad <- droplevels(read.dta(hpfad))
hpfad <- hpfad[, c("hhnr", "hsample", paste0(soep.waves, "hhnr"), paste0(soep.waves, "hnetto"))]
hpfadl <- reshape(hpfad, direction="long",
                  varying=list(hhnr=paste0(soep.waves, "hhnr"),
                               hnetto=paste0(soep.waves, "hnetto")),
                  v.names = c("hid", "hnetto"), timevar="syear", times=1984:(1983+soep.version))
hpfadl <- droplevels(hpfadl[hpfadl$hid > 0,])
names(hpfadl)[names(hpfadl) == "hhnr"] <- "cid"

                                        # max survey year
syears <- 1984:(1983+soep.version)
                                        # years with new samples
new.samples <- tapply(hpfadl$syear, hpfadl$hsample, min)
                                        # define output object
old.new.hh <- as.data.frame(matrix(NA, ncol=3, nrow=length(new.samples)))
names(old.new.hh) <- c("first wave hh", paste("new hh", 1983+soep.version), "share of new hh")
rownames(old.new.hh) <- names(new.samples)
                                        # temporary object for detecting new hh
tmp <- hpfadl[!duplicated(hpfadl$hid), ]
                                        # fill tables by samples
for (i in seq(along.with = new.samples)) {
    old.new.hh[names(new.samples)[i], "first wave hh"] <-
        sum(hpfadl$syear   == new.samples[i]        &
            hpfadl$hsample == names(new.samples)[i] &
            hpfadl$hnetto %in% c("[1] Successful HH Interview", "[1] Realisiertes Haushaltsinterview"))

    old.new.hh[names(new.samples)[i], paste("new hh", 1983+soep.version)] <-
        sum(! tmp$hid[tmp$hsample == names(new.samples)[i] & tmp$syear > new.samples[i]] %in%
              hpfadl$cid[hpfadl$hsample == names(new.samples)[i] & hpfadl$syear == new.samples[i]])
}
     
################################################
## FIX for Sample D starting in 1994 AND 1995 ##
################################################
is.sample.d <- names(new.samples) %in% c("[4] D 1994/5 Migration (1984-92/94 West)", "[4] D Zuwanderer 1984-93", "[4] D Immigrant 1984-1993", "[4] D 84-93 Immigrant (West)", "[4] D 1994/5 Migration (1984-1994, West)")
stopifnot(sum(is.sample.d) == 1)
old.new.hh[is.sample.d, "first wave hh"] <-
    sum(hpfadl$syear  %in% c(new.samples[is.sample.d], new.samples[is.sample.d]+1) &
            hpfadl$hsample == names(new.samples)[is.sample.d] &
            hpfadl$hnetto %in% c("[1] Successful HH Interview", "[1] Realisiertes Haushaltsinterview"))

                                        # Share of new hh in last year
ok <- hpfadl$syear == 1983+soep.version &
    hpfadl$hnetto %in% c("[1] Successful HH Interview", "[1] Realisiertes Haushaltsinterview")
is.new <- ! (hpfadl$cid == hpfadl$hid)

old.new.hh[, "share of new hh"] <- round(100* prop.table(table(hpfadl$hsample[ok],
                                                               is.new[ok]), margin=1)[, "TRUE"], 1)
old.new <- t(as.matrix(old.new.hh))

dimnames(old.new)[[2]] <- sample.shortnames

###################
## Create figure ##
###################
postscript("../graphics/old-new-hh.eps", horizontal = TRUE)
par(mar=c(7,4,2,4), las=2)
barplot(old.new[1:2,], beside=TRUE, horiz=FALSE, ylim=c(0,7000),
        legend.text=c("First Wave Households", paste0("New Households in ", 1983+soep.version, " since start of sample")))
par(new=TRUE)
plot(seq(from = 1.5, to=0.5+ncol(old.new)*2, by=2), old.new[3,], type="p", pch=19, col=2, axes=FALSE,
     xlab="", ylab="")
box()
axis(4, col=2)
legend(13, 54, paste0("Share of \"new\" Households\n in ", 1983+soep.version, " (right scale in %)"),
       pch=19, col=2, cex=0.75)
dev.off()
system("cd ../graphics/; convert -rotate 90 old-new-hh.eps old-new-hh.png")

```
