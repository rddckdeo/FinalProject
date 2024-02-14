package kr.co.coco.admin.model.service;

public interface AdminService {
	// visit Count
	int visitCount();
	int freeCount();
	int infoCount();
	int projectCount();
	// board Count
	int boardCount();
	int deCount();
	
//	admin Visit Page
	int dayVisit();
	int weekVisit();
	int monthVisit();
}
