package kr.co.coco.colabo.common.validation;

import java.util.List;
import java.util.Map;

public class DataValidation {

	
	public static boolean emptyListCheck(List<Object> arrayList) {
		boolean totalResult = false;
		
		for(int i=0; i<arrayList.size(); i++) {
			
			// 중간에 int 형이있어서 String.valueOf 로 한다
			if((String.valueOf(arrayList.get(i))).equals("")) {
				return false;
			}else {
				totalResult = true;
			}
		}
		
		return totalResult;
		
	}
	
	public static boolean CheckListLength(List<Integer> list, List<Object> arrayList) {
		boolean totalResult = false;
		
		int byteLength = 0;
		
		
		for(int i=0; i<list.size(); i++) {
			byteLength = 0;
			// 영어 1바이트, 한글 3바이트
			// "asdf" ['a', 's', 'd', 'f']
			for(char c : ((String)arrayList.get(i)).toCharArray()) {
				
				if(Character.toString(c).matches("[ㄱ-ㅎㅏ-ㅣ가-힣]")) {
					byteLength += 3;
				}else {
					byteLength++;
				}
				
			}
			
			if(byteLength < list.get(i)) {
				totalResult = true;
			}else {
				return false;
			}
		}
		
		return totalResult;
		
	}
	
	
	public static boolean emptyOneCheck(String data) {
			
			if(data.isEmpty()) {
				return false;
			}else {
				return true;
			}
			
			
		}
	
	
	
	public static boolean CheckOneLength(String data, int length) {
		int byteLength = 0;
		
		// 영어 1바이트, 한글 3바이트
		// "asdf" ['a', 's', 'd', 'f']
		for(char c : data.toCharArray()) {
			
			if(Character.toString(c).matches("[ㄱ-ㅎㅏ-ㅣ가-힣]")) {
				byteLength += 3;
			}else {
				byteLength++;
			}
			
		}
		
		if(byteLength < length) {
			return true;
		}else {
			return false;
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
