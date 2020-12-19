part of 'helpers.dart';

String compareDates(DateTime commitDate){
  try{
    DateTime now = DateTime.now();
    int hoursDifference = now.difference(commitDate).inHours;
    if(hoursDifference < 24){
      return "$hoursDifference hours ago";
    }else{
      int daysDifference = now.difference(commitDate).inDays;
      return "$daysDifference days ago";
    }
  }catch(e){
    return "";
  }
}