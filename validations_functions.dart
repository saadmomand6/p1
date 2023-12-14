validatename(String name){
  final nameReg = RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");
  return nameReg.hasMatch(name);
}
validateemail(String email){
  final emailReg = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_'{|}~-]+@[a-zA-Z0-9]");
  return emailReg.hasMatch(email);
}
validatepassword(var password){
  final passwordREg = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  return passwordREg.hasMatch(password);
}
validatephonenumber(var phonenumber){
  final phoneREg = RegExp(r"^[0-9]*$");
  return phoneREg.hasMatch(phonenumber);
}