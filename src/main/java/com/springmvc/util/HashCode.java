package com.springmvc.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class HashCode {

 public String getHashPassword(String password) {
  BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
  String hashedPassword = passwordEncoder.encode(password);

  System.out.println(hashedPassword);
  return hashedPassword;
 }
 
 public static void main(String[] arg){
	 HashCode hash = new HashCode();
	 hash.getHashPassword("pass1");
 }

}