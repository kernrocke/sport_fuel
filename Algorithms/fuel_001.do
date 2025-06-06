
cls
** HEADER -----------------------------------------------------
**  DO-FILE METADATA
    //  algorithm name          fuel_001.do
    //  project:                New Haven Univesity - Project Capstone
    //  analysts:               Kern ROCKE
    //  date first created      06-JUN-2025
    // 	date last modified      06-JUN-2025
    //  algorithm task          Data cleaning to prepare dataset for analysis
    //  status                  In progress

    ** General algorithm set-up
    version 17.0
    clear all
    macro drop _all
    set more off

    ** Initialising the STATA log and allow automatic page scrolling
    capture {
            program drop _all
    	drop _all
    	log close
    	}

    ** Set working directories: this is for DATASET and LOGFILE import and export
    ** DATASETS to encrypted SharePoint folder
	local datapath "/Users/kernrocke/Library/Mobile Documents/com~apple~CloudDocs/Github/sport_fuel" // Kern encrypted local

** HEADER -----------------------------------------------------


** Load the dataset
import excel "`datapath'/Dataset/Capstone study (Responses).xlsx", firstrow

** VARIABLE CLEANING

encode Whatyearstudentareyou, gen(stud_type)

rename Whatisyourageinyears age
replace age = "19" if age=="2005, 19"
replace age = "19" if age=="19 years "
replace age = "19" if age=="18 years old "

destring age, replace

gen race = . 
replace race = 1 if RaceEthnicitySelectallthat== "White"
replace race = 2 if RaceEthnicitySelectallthat!= "" & RaceEthnicitySelectallthat!="White"
label var race "Race/Ethnicity"
label define race 1"White" 2"Non-white"
label value race race

encode Whatdoyoudefineyourselfas, gen(gender)
encode Areyouacommuter, gen(commute)
encode Whereisyourpermanentresidenc, gen(residence)

label define yesno 0"No" 1"Yes"

gen baseball = .
replace baseball = 0 if Whatsportsteamareyouinvolve != "Baseball" & Whatsportsteamareyouinvolve !=""
replace baseball = 1 if strpos(lower(Whatsportsteamareyouinvolve), "baseball") > 0
label var baseball "Baseball"
label value baseball yesno

gen basketball = .
replace basketball = 0 if Whatsportsteamareyouinvolve != "Basketball" & Whatsportsteamareyouinvolve !=""
replace basketball = 1 if strpos(lower(Whatsportsteamareyouinvolve), "basketball") > 0
label var basketball "Basketball"
label value basketball yesno

gen golf = .
replace golf = 0 if Whatsportsteamareyouinvolve != "Golf" & Whatsportsteamareyouinvolve !=""
replace golf = 1 if strpos(lower(Whatsportsteamareyouinvolve), "golf") > 0
label var golf "Golf"
label value golf yesno

gen football = .
replace football = 0 if Whatsportsteamareyouinvolve != "Football" & Whatsportsteamareyouinvolve !=""
replace football = 1 if strpos(lower(Whatsportsteamareyouinvolve), "football") > 0
label var football "Football"
label value football yesno

gen rugby = .
replace rugby = 0 if Whatsportsteamareyouinvolve != "Rugby" & Whatsportsteamareyouinvolve !=""
replace rugby = 1 if strpos(lower(Whatsportsteamareyouinvolve), "rugby") > 0
label var rugby "Rugby"
label value rugby yesno

gen lacrosse = .
replace lacrosse = 0 if Whatsportsteamareyouinvolve != "Lacrosse" & Whatsportsteamareyouinvolve !=""
replace lacrosse = 1 if strpos(lower(Whatsportsteamareyouinvolve), "lacrosse") > 0
label var lacrosse "Lacrosse"
label value lacrosse yesno

gen soccer = .
replace soccer = 0 if Whatsportsteamareyouinvolve != "Soccer" & Whatsportsteamareyouinvolve !=""
replace soccer = 1 if strpos(lower(Whatsportsteamareyouinvolve), "soccer") > 0
label var soccer "Soccer"
label value soccer yesno

gen volleyball = .
replace volleyball = 0 if Whatsportsteamareyouinvolve != "Volleyball" & Whatsportsteamareyouinvolve !=""
replace volleyball = 1 if strpos(lower(Whatsportsteamareyouinvolve), "volleyball") > 0
label var volleyball "Volleyball"
label value volleyball yesno

gen softball = .
replace softball = 0 if Whatsportsteamareyouinvolve != "Softball" & Whatsportsteamareyouinvolve !=""
replace softball = 1 if strpos(lower(Whatsportsteamareyouinvolve), "softball") > 0
label var softball "Softball"
label value softball yesno

gen track_field = .
replace track_field = 0 if Whatsportsteamareyouinvolve != "Track & Field" & Whatsportsteamareyouinvolve !=""
replace track_field = 1 if strpos(lower(Whatsportsteamareyouinvolve), "track") > 0
label var track_field "Track & Field"
label value track_field yesno

gen field_hockey = .
replace field_hockey = 0 if Whatsportsteamareyouinvolve != "Field Hockey" & Whatsportsteamareyouinvolve !=""
replace field_hockey = 1 if strpos(lower(Whatsportsteamareyouinvolve), "hockey") > 0
label var field_hockey "Field Hockey"
label value field_hockey yesno

gen cross_country = .
replace cross_country = 0 if Whatsportsteamareyouinvolve != "Cross Country" & Whatsportsteamareyouinvolve !=""
replace cross_country = 1 if strpos(lower(Whatsportsteamareyouinvolve), "cross") > 0
label var cross_country "Cross-Country"
label value cross_country yesno

gen tennis = .
replace tennis = 0 if Whatsportsteamareyouinvolve != "Tennis" & Whatsportsteamareyouinvolve !=""
replace tennis = 1 if strpos(lower(Whatsportsteamareyouinvolve), "tennis") > 0
label var tennis "Tennis"
label value tennis yesno

drop Timestamp Pleaseindicateifyouagreeto Whatyearstudentareyou RaceEthnicitySelectallthat IfyouchoseOtherasshownab Whatdoyoudefineyourselfas Areyouacommuter Whereisyourpermanentresidenc Whatsportsteamareyouinvolve
