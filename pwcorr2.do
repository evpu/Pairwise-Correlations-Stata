* ************************************************************************
* https://github.com/evpu
* This program creates and stores the first column of pwcorr
* 
* to execute type in:
* pwcorr2 "columnvar1 columnvar2" "rowvar1 rowvar2 rowvar3"
* 
* if you want to save output into excel file name.xlsx:
* pwcorr2 "columnvar1 columnvar2" "rowvar1 rowvar2 rowvar3" name
*
* if column and row variables are identical,
* the results are the same as in the standard Stata pwcorr
* ************************************************************************

program pwcorr2
args column row name

capture qui matrix drop M_pwcorr2

	local row_n : list sizeof local(row)
	local column_n : list sizeof local(column)
	local i=1
	local j=1
matrix M_pwcorr2 = J(`row_n',`column_n',.)
foreach c of varlist `column' {

	foreach r of varlist `row' {
		capture qui corr `c' `r'
		if missing("`r(rho)'") {
			local r(rho)=.
		}
		matrix M_pwcorr2[`i',`j']=r(rho)
		local i=`i'+1
	}
	local i=1
	local j=`j'+1
}
matrix colnames M_pwcorr2 = `column'
matrix rownames M_pwcorr2 = `row'
matrix list M_pwcorr2

if !missing("`name'") {
	putexcel A1=matrix(M_pwcorr2, names) using "`name'.xlsx", replace
}

end
