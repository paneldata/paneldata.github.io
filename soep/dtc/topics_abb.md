---
layout: dtc
---
```R
topics <- list(
"Residential environment and\n neighborhood                    "=c(1986, 1994, 1999, 2004, 2009, 2014),
"Social security, transition to retirement                     "=c(1987, 1992, 1997, 2002, 2007, 2012),
"Household finances /wealth                                    "=c(1988, 2002, 2007, 2012),
"Further occupational training and\n professional qualifications"=c(1989, 1993, 2000, 2004, 2008),
"Time use and time preferences                                 "=c(1990, 1995, 1998, 2003, 2008),
"Labor market and subjective indicators                        "=c(1990),
"Family and social networks                                    "=c(1991, 1996, 2001, 2006, 2011),
"Working conditions                                            "=c(1994, 2006, 2011, 2013),
"Expectations for the future                                   "=c(1994, 1999, 2005),
"Transportation and energy use                                 "=c(1998, 2003),
"Health (SF12, BMI)                                            "=c(2002, 2004, 2006, 2008, 2010, 2012, 2014),
"Health (Grip Strength)                                        "=c(            2006, 2008, 2010, 2012),
"Health (Diseases)                                             "=c(                  2009, 2011, 2013),
"Trust                                                         "=c(2003, 2008, 2013),
"Risk Aversion                                                 "=c(2004, 2009, 2014),
"Big Five                                                      "=c(2005, 2009, 2013),
"Reciprocity                                                   "=c(2005, 2010),
"Globalization and Transnationalization                        "=c(2009, 2014),
"Consumption and Saving                                        "=c(2010))

require(gdata)
names(topics) <- trim(names(topics))

topics <- do.call("c", topics)
topics <- data.frame(topics=gsub("[0-9]$", "", names(topics)), year=as.numeric(topics))

topics <- topics[order(topics$topics, topics$year),]
topics$min <- unlist(tapply(topics$year, topics$topics,
                     FUN <- function(x) rep(min(x), length(x))))
topics <- topics[order(topics$min, topics$topics, topics$year),]


n <- length(unique(topics$topics))
years <- sort(unique(topics$year))
labels <- tapply(topics$year, topics$topics, min)
labels <- names(sort(labels))
label.pos <- 1:n
names(label.pos) <- labels
plot.pos <- label.pos[as.character(topics$topics)]

postscript("topics_abb.ps", width=9, height=5, paper="special", horizontal=TRUE)
opar <- par(mar=c(4,12,1,1), las=2)
plot(years, rep(1, length(years)), ylim=c(1, n), type="n", axes=FALSE, ylab="")
axis(1, at=years, labels=years, cex.axis=0.75)
axis(2, at=1:n, labels=names(sort(label.pos)), cex.axis=0.75)


rect(topics$year-0.5, plot.pos-0.5,
     topics$year+0.5, plot.pos+0.5, col="DarkSlateBlue", border=NA)
abline(h=(1:n)+0.5, col="grey")
abline(h=(1:n)-0.5, col="grey")
abline(v=years+0.5, col="grey")
abline(v=years-0.5, col="grey")
box()

par(opar)
dev.off()

```
