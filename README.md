# Pairwise Correlations - Modification of pwcorr
The program pwcorr2 displays and stores in a matrix "M_pwcorr2" (or exports to Excel) the first column of pwcorr. It is helpful if you have different sets of variables in your rows and columns
If the variables in rows and columns are identical, then the results are the same as in the standard pwcorr.

It is somewhat similar to ssc package "cpcorr", but in addition handles missing variables and reproduces pwcorr output.

## Example
Code in "example.do" sets up a quick illustrative case. Where pwcorr and pwcorr2 produce the following output:

pwcorr columnvar1 columnvar2 rowvar1 rowvar2 rowvar3

                    column~1 column~2  rowvar1  rowvar2  rowvar3
    -------------+---------------------------------------------
      columnvar1 |   1.0000 
      columnvar2 |   0.0580   1.0000 
         rowvar1 |   0.5498   0.3301   1.0000 
         rowvar2 |  -0.2973   0.3772  -0.0285   1.0000 
         rowvar3 |        .        .        .        .        . 




pwcorr2 "columnvar1 columnvar2" "rowvar1 rowvar2 rowvar3"

    M_pwcorr2[3,2]
              columnvar1  columnvar2
    rowvar1   .54980936   .33012319
    rowvar2  -.29734494   .37717309
    rowvar3           .           .
