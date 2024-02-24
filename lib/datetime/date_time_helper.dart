// converting datetime object into string yyyymmdd

String convertDateTimetoString(DateTime dateTime){

  String year = dateTime.year.toString(); // converting year into string

  String month = dateTime.month.toString(); // converting month into string
  if(month.length ==1 ){
    month= '0$month';
  }
  String date = dateTime.day.toString(); // converting day into string
  if(date.length ==1 ){
    date= '0$date';
  }


// final date string
 String yyyymmdd = year+month+date;
  return yyyymmdd;
}