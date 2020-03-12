qui clear all
qui set more off
//qui cd "C:\Users\mozahemna.UNIVERSITY\OneDrive - RHU(1)\Personal\Publications\Paper 22 (withdraw)"
//cd "/Users/user/onedrive - rhu/personal/publications/Paper 22 (withdraw)"

/*
//BUSINESS

foreach n of numlist 1/319 {
	qui import excel "merged_business.xlsx", sheet(`"`n'"') clear
	save data`n', replace
}

use data1, clear
foreach n of numlist 2/319 {
	append using data`n', force
}

save data_business, replace

foreach n of numlist 1/319 {
	erase data`n'.dta
}

use data_business, clear
qui rename A id
qui rename B gpa
qui rename C course_code
qui rename D course_title
qui rename E credits
qui rename F grade_letter
qui rename G grade_number
qui rename H semester
qui label variable id "Student ID"
qui label variable gpa "Student overall GPA"
qui label variable course_code "Course code"
qui label variable course_title "Course title"
qui label variable credits "Credits assigned to course"
qui label variable grade_letter "Letter grade on course"
qui label variable grade_number "Numeric grade on course"
qui label variable semester "Semester course was taken"
qui generate year_enrolled = int(id/10000)
qui label variable year_enrolled "Year the student enrolled in the university"
qui generate year_course = regexs(0) if(regexm(semester, "[0-9][0-9][0-9][0-9]"))
qui destring year_course, replace
qui label variable year_course "The year the course was taken"
qui generate semester_course = regexs(0) if(regexm(semester, "([a-zA-Z])+"))
qui label variable semester_course "Semester the course was taken"
qui replace semester_course = "SUMMER" if semester_course == "SUMMERI" | semester_course == "SUMMERII"
qui keep if semester_course == "FALL" | semester_course == "SPRING" | semester_course == "SUMMER"
qui generate time = year_course - year_enrolled
qui label variable time "Number if years student has been in university when course was taken"

save, replace

qui import excel "Students.xlsx", sheet("Business") firstrow clear

qui label variable id "Student ID"
qui label variable student_name "Student name"
save students_business, replace

//now merge
use data_business, clear
merge m:1 id using students_business
qui keep if _merge == 3
qui drop _merge
save data_business, replace


//-------------------------------------------------------------------------------------------
//ENGINEERING

foreach n of numlist 1/445 {
	qui import excel "merged_engineering.xlsx", sheet(`"`n'"') clear
	save data`n', replace
}

use data1, clear
foreach n of numlist 2/445 {
	append using data`n', force
}

save data_engineering, replace

foreach n of numlist 1/445 {
	erase data`n'.dta
}

use data_engineering, clear
qui rename A id
qui rename B gpa
qui rename C course_code
qui rename D course_title
qui rename E credits
qui rename F grade_letter
qui rename G grade_number
qui rename H semester
qui label variable id "Student ID"
qui label variable gpa "Student overall GPA"
qui label variable course_code "Course code"
qui label variable course_title "Course title"
qui label variable credits "Credits assigned to course"
qui label variable grade_letter "Letter grade on course"
qui label variable grade_number "Numeric grade on course"
qui label variable semester "Semester course was taken"
qui generate year_enrolled = int(id/10000)
qui label variable year_enrolled "Year the student enrolled in the university"
qui generate year_course = regexs(0) if(regexm(semester, "[0-9][0-9][0-9][0-9]"))
qui destring year_course, replace
qui label variable year_course "The year the course was taken"
qui generate semester_course = regexs(0) if(regexm(semester, "([a-zA-Z])+"))
qui label variable semester_course "Semester the course was taken"
qui replace semester_course = "SUMMER" if semester_course == "SUMMERI" | semester_course == "SUMMERII"
qui keep if semester_course == "FALL" | semester_course == "SPRING" | semester_course == "SUMMER"
qui generate time = year_course - year_enrolled
qui label variable time "Number if years student has been in university when course was taken"

save, replace

qui import excel "Students.xlsx", sheet("Engineering") firstrow clear
qui label variable id "Student ID"
qui label variable student_name "Student name"
save students_engineering, replace

//now merge
use data_engineering, clear
merge m:1 id using students_engineering
qui keep if _merge == 3
qui drop _merge
save data_engineering, replace

append using data_business
save data_all, replace
encode major, gen(major2)
encode college, gen(college2)
encode gender, gen(gender2)
qui drop major college gender
qui rename major2 major
qui rename college2 college
qui rename gender2 gender
qui label variable major "Major"
qui label variable college "College"
qui label variable gender "Gender"
save data_all, replace
*/

use data_all, replace
//rename old course names
qui replace course_code = "BMGT200" if course_code == "BADM200"
qui replace course_code = "BADM225" if course_code == "BADM202"
qui replace course_code = "BITM200" if course_code == "BCOP222"
qui replace course_code = "BACC201" if course_code == "BFIN230"
qui replace course_code = "BACC202" if course_code == "BFIN231"
qui replace course_code = "BADM230" if course_code == "BADM207"
qui replace course_code = "BMKT200" if course_code == "BMKT261"
qui replace course_code = "ENGL217" if course_code == "ENGL211"
qui replace course_code = "BFIN300" if course_code == "BFIN330"
qui replace course_code = "BACC300" if course_code == "BFIN340"
qui replace course_code = "BACC305" if course_code == "BFIN341"
qui replace course_code = "BECN301" if course_code == "ECON311"
qui replace course_code = "BITM300" if course_code == "BADM300"
qui replace course_code = "BACC400" if course_code == "BFIN440"
qui replace course_code = "BACC405" if course_code == "BFIN441"
qui replace course_code = "BECN302" if course_code == "ECON312"
qui replace course_code = "BADM485" if course_code == "BADM399"
qui replace course_code = "BACC465" if course_code == "BFIN470"
qui replace course_code = "ARAB211" if course_code == "ARAB300"
qui replace course_code = "BACC450" if course_code == "BFIN453"
qui replace course_code = "BADM495" if course_code == "BADM490"
qui replace course_code = "BADM495" if course_code == "BADM490G"
qui replace course_code = "BADM495" if course_code == "BADM490A"
qui replace course_code = "BADM495" if course_code == "BADM490C"
qui replace course_code = "BADM495" if course_code == "BADM490M"
qui replace course_code = "BACC460" if course_code == "BFIN456"
qui replace course_code = "BADM250" if course_code == "BADM310"
qui replace course_code = "BMGT205" if course_code == "BADM206"
qui replace course_code = "BHRM300" if course_code == "BADM302"
qui replace course_code = "BMGT350" if course_code == "BADM368"
qui replace course_code = "BMGT400" if course_code == "BADM401"
qui replace course_code = "BADM410" if course_code == "IBUS421"
qui replace course_code = "BMGT485" if course_code == "BADM460"
qui replace course_code = "BITM300" if course_code == "BCOP331"
qui replace course_code = "BITM340" if course_code == "BCOP371"
qui replace course_code = "BITM310" if course_code == "BCOP332"
qui replace course_code = "BMGT300" if course_code == "BADM330"
qui replace course_code = "BADM405" if course_code == "BADM415"
qui replace course_code = "BMKT300" if course_code == "BMKT360"
qui replace course_code = "BMKT305" if course_code == "BMKT363"
qui replace course_code = "BMKT310" if course_code == "BMKT464"
qui replace course_code = "BMKT450" if course_code == "BMKT462"
qui replace course_code = "BMKT485" if course_code == "BMKT465"
qui replace course_code = "BADM355" if course_code == "PHIL307"



qui replace course_code = "CIVE211" if course_code == "CIVE212"
qui replace course_code = "CCEE214" if course_code == "COSC221"
qui replace course_code = "MECH220" if course_code == "MECH212"
qui replace course_code = "CIVE240" if course_code == "CIVE310"
qui replace course_code = "MECH320" if course_code == "MECH281"
qui replace course_code = "CIVE321" if course_code == "CIVE330"
qui replace course_code = "CIVE342" if course_code == "CIVE325"
qui replace course_code = "MECH333" if course_code == "MECH351"
qui replace course_code = "ENGR300" if course_code == "ECON333"
qui replace course_code = "CIVE415" if course_code == "CIVE470"
qui replace course_code = "CIVE423" if course_code == "CIVE421"
qui replace course_code = "CIVE435" if course_code == "CIVE430"
qui replace course_code = "CIVE332" if course_code == "CIVE450"
qui replace course_code = "CIVE424" if course_code == "CIVE422"
qui replace course_code = "CIVE501" if course_code == "CIVE440"
qui replace course_code = "CCEE221" if course_code == "CCEE210"
qui replace course_code = "CCEE221L" if course_code == "CCEE211"
qui replace course_code = "CCEE231" if course_code == "CCEE320"
qui replace course_code = "ELEC320L" if course_code == "ELEC321"
qui replace course_code = "ELEC331" if course_code == "ELEC411"
qui replace course_code = "ELEC432" if course_code == "ELEC412"
qui replace course_code = "ELEC432L" if course_code == "ELEC415"
qui replace course_code = "ELEC451" if course_code == "ELEC471"
qui replace course_code = "CCEE426" if course_code == "CCEE414"
qui replace course_code = "CCEE341" if course_code == "CCEE321"
qui replace course_code = "CCEE316" if course_code == "COSC222"
qui replace course_code = "CCEE323" if course_code == "CCEE313"
qui replace course_code = "CCEE341" if course_code == "CCEE321"
qui replace course_code = "CCEE447" if course_code == "CCEE422"
qui replace course_code = "CCEE447L" if course_code == "CCEE415"
qui replace course_code = "CCEE454" if course_code == "CCEE422"
qui replace course_code = "CCEE411" if course_code == "CCEE461"
qui replace course_code = "BIOM301" if course_code == "BIOM310"
qui replace course_code = "BIOM312" if course_code == "BIOM337"
qui replace course_code = "BIOM312L" if course_code == "BIOM338"
qui replace course_code = "BIOM413" if course_code == "BIOM431"
qui replace course_code = "BIOM414" if course_code == "BIOM457"
qui replace course_code = "BIOM421" if course_code == "BIOM432"
qui replace course_code = "MECH223" if course_code == "MECH271"
qui replace course_code = "MECH224" if course_code == "ENGR210"
qui replace course_code = "MECH330" if course_code == "MECH341"
qui replace course_code = "MECA340" if course_code == "MECA331"
qui replace course_code = "MECH334" if course_code == "MECH441"
qui replace course_code = "MECH335" if course_code == "MECH351"
qui replace course_code = "MECH421" if course_code == "MECH332"
qui replace course_code = "MECH423" if course_code == "MECH432"
qui replace course_code = "MECH321" if course_code == "MECH331"
qui replace course_code = "MECH320" if course_code == "MECH281"
//
qui replace course_code = "MECH498" if course_code == "MECH597"
qui replace course_code = "MECA443" if course_code == "MECA475"
qui replace course_code = "COSC231" if course_code == "CCEE442"
qui replace course_code = "MATH317" if course_code == "MATH410"

qui drop if id == 20060447
qui drop if course_code == "MECA400" | course_code == "MECH400" | course_code == "CCEE490"
qui gen withdraw = 0
qui replace withdraw = 1 if grade_letter == "W"
qui label define withdraw 0 "No withdraw" 1 "Withdraw"
qui label values withdraw withdraw
qui label variable withdraw "Withdraw from course?"

qui gen fail = 0
qui replace fail = 1 if grade_letter == "F"
qui label define fail 0 "Pass" 1 "Fail"
qui label values fail fail
qui label variable fail "Fail course?"

qui encode semester_course, gen(semester_course2)
qui drop semester_course
qui rename semester_course2 semester_course
qui label variable semester_course "Semester the course was taken"
qui generate number_course = regexs(0) if(regexm(course_code, "[0-9][0-9][0-9]"))
qui destring number_course, replace
qui label variable number_course "Numeric value in course code"
qui gen number_level = int(number_course/100)
qui label variable number_level "The level of the course"
qui label define number_level 0 "intensive" 1 "100 level course" 2 "200 level course" 3 "300 level course" 4 "400 level course" 5 "500 level course" 6 "600 level course"
qui label values number_level number_level
qui drop if number_level == 6
qui gen number_level_first_year = 0
qui replace number_level_first_year = 1 if number_level == 2
qui label variable number_level_first_year "First year major course"
qui label define number_level_first_year 0 "Not a first year major course" 1 "First year major course"
qui label values number_level_first_year number_level_first_year
by id, sort: egen total_courses = count(id)
qui label variable total_courses "Total number of courses taken by student"
by course_code, sort: egen total_students_course = count(course_code)
by course_code, sort: egen total_withdraw_code = sum(withdraw)
qui gen pct_withdraw_code = total_withdraw_code/total_students_course * 100
qui label variable pct_withdraw_code "Percent withdrawals from the course"

qui save, replace








