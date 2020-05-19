package eltag;

import model.MemberDAO;

public class MyTagLib {
	
	/*
	EL에서 Java클래스의 메소드 호출절차 및 방법
	1. 클래스와 메소드를 정의한다. 
	단 메소드 정의시 반드시 public static으로 선언해야한다.
	*/
	
	
	/*
	 * 매개변수로 전달된 문자열에 숫자가 아닌 문자가 포함되어있으면
	 * false를 반환하고 , 전체가 숫자일때 true를 반환한다.
	 */
	public static boolean isNumber(String value) {
		
		char[] chArr = value.toCharArray();
		for(int i=0; i<chArr.length ; i++) {
			if( !(chArr[i]>='0' && chArr[i]<='9')) {
				return false;
			}
		}
		return true;
	}
	
	
	/*메소드설명 : 매개변수로 주민번호를 전달받아 성별을 판단 후 반환하는
		메소드를 작성한다. "123456-7890123" 형태로 전달됨 */
	public static String getGender(String jumin) {

		/*방법1*/
		String returnStr="";
		//-의 위치를 찾는다, +1 하면 성별을 표현하는숫자의 인덱스값이 된다.
		int beginIdx = jumin.indexOf("-")+1;
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		
		//성별을 표현하는 문자열을 정수로 변환하여 성별을 판단한다.
		if(Integer.parseInt(genderStr)==1 
				|| Integer.parseInt(genderStr)==3) {
			returnStr="남자";
			
		} else if(Integer.parseInt(genderStr)==2 
				|| Integer.parseInt(genderStr)==4){
			returnStr="여자";
		} else {
			returnStr="주민번호오류";
		}
		
		
		
		
		
		
		/*방법2*/
		if(jumin.charAt(7) == '1') return "남자";
		if(jumin.charAt(7) == '2') return "여자";
		return "<b>사람아님</b>";
		
		
	}



	/*
	아이디/패스워드, DB연결을 위한 드라이버, URL인자를 받아
	회원여부를 판단하여 true/false를 반환해주는 메소드
	 */
	public static boolean memberLogin(
		String id,String pw,String drv, String url) {
		
		
		//1. DB연결을 위한 객체 생성
		MemberDAO dao = new MemberDAO(drv, url);
		
		//2. 아이디/패스워드를 통한 회원인증 및 결과 반환
		boolean isBool = dao.isMember(id, pw);
		
		//3. 2번에서의 결과를 호출한 지점으로 반환
		return isBool;
	}




















}

































