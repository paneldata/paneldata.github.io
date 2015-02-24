---
title: "Survey Design"
layout: dtc
---

### i. Survey Instruments

The interview methodology of the SOEP is based on a set of pre-tested
questionnaires for households and individuals. Interviewers try to
obtain face-to-face interviews with all members aged 16 years and over
of a given survey household. Thus, there are no proxy interviews for
adult household members. Additionally, one person (the so called
"head of household") is asked to answer a household related
questionnaire covering information on housing, housing costs, and
different sources of income (e.g. social transfers like social
assistance or housing allowances). This questionnaire also covers
some questions on children in the household up to the age of 16, mainly
concerning their attendance in day care, kindergarten and school.

The questions in the SOEP are in principle identical for all particpants
of the survey to ensure comparability across the participants within any
given year (of course, there are differences across years. There are a few exceptions to this rule, which
are due to different requirements in the target population. Up to 1996
the questionnaires for the foreigner’s sample (B) and immigrant sample
(D) covered additional measures of integration or information on
re-migration behavior. Between 1990 and 1992, i.e. during the first
years of the German unification process, the questionnaire for the East
German sample (C) also contained some additional specific variables.
Since 1996, all questionnaires are uniform and completely integrated for
all main SOEP samples. The related studies use SOEP related content, but
also have specific questions, so the contents may differ to various
degrees in every year.

Another type of difference in questionnaires is implemented because
first time respondents are not treated identically to those with a
repeated interview, since some information does not have to be asked
every year unless a change occurred. Additionally, each respondent is
asked to fill out a biography questionnaire covering information on the
life course up to the first SOEP interview (e.g. marital history, social
background, and employment biography).

Additional information - not provided directly by the respondents - can
be obtained from the so-called "address logs", which are stored for
every year in the $PBRUTTO and $HBRUTTO files.
Every address log is filled in by the interviewer even in the case of
non-response, thus providing very valuable information, e.g. for
attrition analyses. For researchers interested in methodological issues
these data also contain information on the field work process, e.g. the
number of contacts, reason for eventual drop-outs, or the interview
mode. For successfully contacted households, the address logs cover the
size of the household, some regional information, survey status etc.,
while the individual data for all household members include the relation
to the household head, survey status of the individual and some
demographic information.

### ii. Survey Concepts

Measuring stability and detecting changes means to repeat (almost)
identical measures over time. Furthermore, the SOEP-questions capture
stability and change by varying with regard to the time dimension,
asking about events in the past, the present, and the future.
Conceptually, different measurements of time are used:

* Questions about a point in time (present)<br>
e.g. current employment status or current levels of satisfaction
* Single retrospective questions on certain events in the past<br> 
e.g. how often did you change your job during the last ten years?
* Retrospective life event history since the age of 15 (in the past)<br> 
e.g. employment or marital history
* Monthly calendar information on income and labor market participation (in the past)<br> 
e.g. employment status January through December last year
* Questions concerning a period of time (in the past)<br> 
e.g. demographic changes since the last interview like marriage or death of spouse
* Questions concerning future prospects (future)<br> 
e.g. satisfaction with life five years from now, or job expectations

### iii. Survey Modes

The SOEP uses several different modes to collect the data. Originally,
the respondent’s answers were recorded by an interviewer who filled in a
paper questionnaire, the so called pen-and-paper interview or PAPI. The
personal contact between interviewer and respondent is important for the
success of the survey; however, before losing a respondent because of a
scheduling conflict between interviewer and respondent, the SOEP allows
mailing in the questionnaire starting from the second wave of subsamples
A-I. This concept does not resemble the concept of a regular mail
survey, because the interviewer still keeps the personal contact with
the household and schedules appointments with its respondents if
possible. Starting with subsample J, only the computer assisted mode
(CAPI) is allowed, and thus mailing in the questionnaires is no longer
possible.

While the interviewer is in the household she/he directly conducts an
interview with any household member, but can also hand out a
questionnaire to other household members, who fill it in with or without
her/his help (self-administered questionnaires, SAQ). This is much more
time efficient for the interviewer, because household members can work
in parallel on their questionnaires.

In 1998, interviews were conducted with computers for the first time, in
computer-assisted personal interviews, or in CAPI mode. Compared to
PAPI, CAPI is much more efficient in transferring the data into an
electronic format, which was an important asset especially with the
extensions of the panel starting in the year 2000. The CAPI mode was
first conducted in parallel to the PAPI mode, meaning that interviewers
and respondents were free to chose how they wanted to do the interview.
This was important for the "older" sample members (responents as well
as interviewers), who were used to the PAPI concept. Only in the most
recent samples (starting in subsample J), CAPI is the only mode. Figure 5 depicts the development of modes up to 2011, showing that the CAPI mode has gained importance since its implementation.

Since the questionnaires have to be identical in both modes, the CAPI
implementation is relatively simple compared to what would be
technically feasible. For example, the SOEP basically does not use any
form of dependent interviewing (i.e. referring to respondent data from
previous waves), because this cannot be easily implemented in the
PAPI-mode. Also, the filtering structure is very simple in the SOEP,
because any respondent must be able to follow the interview path on
her/his own on paper. Still, some technical features like the control of
value ranges (e.g. month of birth, year of first marriage) or the
randomization of scale items are implemented in the CAPI version of the
questionnaire.

In the future, new modes will be introduced into the SOEP as they
develop. The computer-assisted web interview (CAWI) is close to
implementation, it will, however, not be used as a replacement of the
current CAPI and PAPI modes, but rather as an extension the respondents
may use similar to the mail-in or self-administered questionnaires. The
core interview concept of the SOEP survey, the personal contact between
respondent and interviewer, will not change.

Figure 5: Use of Different Interviewe Modes since 1984
![Use of Different Interviewe Modes since
1984](https://raw.githubusercontent.com/paneldata/soep/gh-pages/dtc/graphics/mode.png)

[Stata Code to create figure.](mode)



### iv. Panel Care

To cope with panel attrition and to keep the the longitudinal response
rates at high levels, the SOEP has implemented so-called "panel care"
efforts to maintain the personal contact between respondents and the
survey. Panel care can be divided into incentives directly given to the
respondent and other measures undertaken to keep the respondent in the
study.

The study has honored the respondents with gifts and tokens of
appreciation from the very beginning. For the most part, these gifts are
small in-kind incentives like flowers, for which the interviewers have
their own budget. In addition, the interviewers are asked to hand out a
brochure with recent results from the study. Up to 2007, the respondents
also received a lottery ticket as a thank you upon completion of the
interview. The lottery collects money for social projects in Germany.
Since 2008, the lottery ticket is included in the contact letter which
is sent out about two weeks prior to the interview. It is thus given
unconditionally, as long as the person has participated in the previous
wave. After any successful interview, the respondent receives a thank
you letter from the field work organisation, which also inlcudes a stamp
for a regular letter.

In 2009, different incentive schemes were tested in the new subsample I
to increase the first-wave response rates. The basic experiment included
four randomized groups of households: (1) those with the default setup
of the conditional lottery ticket; (2) those with a "low" cash
incentive involing 5 Euros per household and 5 Euros per adult
respondent; (3) those with a "high" cash incentive involing 5 Euros
per household and 10 Euros per adult respondent; and (4) those with a
choice between a "low" cash incentive and a lottery ticket. The
results showed slightly higher response rates in the cash groups,
although the extra money in group (3) did not pay of. (Further results
will be published on our website as soon as possible.) Additional work
is done by the field work agency: Addresses are kept up to date
throughout the year in order to be informed about residential mobility.
This is achieved for example by sending out a brochure containing some
results based on previously collected data, or saisonal greeting cards.

In addition, the face-to-face interview ensures a personal relationship,
which increase the likelihood to stay in the survey. Thus, keeping the
same interviewer over time is one important goal - some of the
respondents have indeed had the same interviewer since the beginning in
1984.
