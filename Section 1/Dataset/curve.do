clear all
set obs 1000
gen x = runiform(0, 10)
gen xb = log(x)
gen pr = exp(xb)/(1+exp(xb))
gen outcome = 0
replace outcome = 1 if pr > 0.5
replace outcome = 1 if outcome == 0 & runiform() > 0.95
replace outcome = 0 if outcome == 1 & runiform() > 0.95
egen xcat = cut(x), group(4)
