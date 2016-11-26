clear all
macro drop _all
program drop _all
cd "your_directory"

run "pwcorr2.do"

set seed 20161125

set obs 20

* Generate some random variables, and one completely missing variable
gen columnvar1 = runiform()
gen columnvar2 = rnormal()
gen rowvar1 = rbeta(0.05, 0.15)
gen rowvar2 = rt(2)
gen rowvar3 = .

* And also input some missing data
replace rowvar1 = . in 1/5
replace columnvar2 = . in 1/10


* Correlations: Standard pwcorr
pwcorr columnvar1 columnvar2 rowvar1 rowvar2 rowvar3

* Alternative pwcorr2
pwcorr2 "columnvar1 columnvar2" "rowvar1 rowvar2 rowvar3"

* This produces similar output as pwcorr
pwcorr2 "columnvar1 columnvar2 rowvar1 rowvar2 rowvar3" "columnvar1 columnvar2 rowvar1 rowvar2 rowvar3"
