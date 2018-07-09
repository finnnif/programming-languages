
fun is_older (date1: (int * int * int), date2: (int * int * int)) =
    let
		val y1 = #1 date1
		val m1 = #2 date1
		val d1 = #3 date1
		val y2 = #1 date2
		val m2 = #2 date2
		val d2 = #3 date2
    in
		y1 < y2 orelse (y1 = y2 andalso m1 < m2)
				orelse (y1 = y2 andalso m1 = m2 andalso d1 < d2)
    end

(* fun	number_in_month (dates: (int * int * int) list, month: int) =
	if null dates
	then 0
	else if #2 (hd dates) = month
	then 1 + number_in_month(tl dates, month)
	else number_in_month(tl dates, month) *)

fun number_in_month (dates: (int * int * int) list, month: int) =
	if null dates
	then 0
	else (if #2 (hd dates) = month then 1 else 0)
			+ number_in_month(tl dates, month)

fun number_in_months (dates: (int * int * int) list, months: int list) =
	if	null months
	then 0
	else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month (dates: (int * int * int) list, month: int) = 
	if null dates
	then []
	else if #2 (hd dates) = month
	then (hd dates)::(dates_in_month(tl dates, month))
	else dates_in_month(tl dates, month)

fun dates_in_months (dates: (int * int * int) list, months: int list) =
	if null months
	then []
	else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth (strings: string list, n: int) =
	if n=1
	then hd strings
	else get_nth(tl strings, n-1)

fun date_to_string (date: (int * int * int)) = 
	let
		val month_name = ["January", "February", "March", "April", "May", "June", 
		"July", "August", "September", "October", "November", "December"]
	in	
		get_nth(month_name, #2 date) ^ " " ^ Int.toString(#3 date) ^ " ," ^ Int.toString(#1 date)
	end 
		 	
fun number_before_reaching_sum (sum: int, numbers: int list) = 
	if sum <= hd numbers
	then 0
	else 1 + number_before_reaching_sum(sum - hd numbers, tl numbers)

fun what_month(day_of_year: int) =
	let 
		val month_length = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]




