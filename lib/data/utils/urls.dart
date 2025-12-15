class Urls{
  static final String _baseUrl = "https://task.teamrabbil.com/api/v1";
  static final String registerUser ="$_baseUrl/registration";
  static final String loginUser = "$_baseUrl/login";
  static final String addUserTask = "$_baseUrl/createTask";
  static final String taskCountByStatusModel = "$_baseUrl/taskStatusCount";
  static String showListView(String status) =>"$_baseUrl/listTaskByStatus/$status";
  static String deleteData(id)=>"$_baseUrl/deleteTask/$id";
  static String updateTaskStatus(id,status)=>"$_baseUrl/updateTaskStatus/$id/$status";
  static String profileUpdate="$_baseUrl/profileUpdate";

}