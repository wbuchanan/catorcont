cscript "Unit tests for catorcont" adofile catorcont.ado

// Load standard dataset
sysuse auto.dta, clear

// Get variable list w/o string variables
qui: ds, not(type string)

loc thevars `r(varlist)'

// Call program
catorcont `thevars'

// Should return three categorical variables
assert `"`r(cat)'"' == "rep78 headroom foreign"

// Should return eight continuous variables
assert `"`r(cont)'"' == "price mpg trunk weight length turn displacement gear_ratio"

// Call program
catorcont `thevars', catv(rep78 foreign headroom) contv(length turn mpg) minn(70)

// Should return three categorical variables
assert `"`r(cat)'"' == "headroom foreign"

// Should return eight continuous variables
assert `"`r(cont)'"' == "length turn mpg"
