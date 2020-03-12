clear all
set obs 1000
gen x = runiform(-10, 10)
gen xb = -2+x^2
gen pr = exp(xb)/(1+exp(xb))
gen outcome = 0
replace outcome = 1 if pr > 0.5
replace outcome = 1 if outcome == 0 & runiform() > 0.95
replace outcome = 0 if outcome == 1 & runiform() > 0.95
replace x = x + 10
replace x = floor(x)
egen xcat = cut(x), group(4)
