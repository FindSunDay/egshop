package com.trade.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.trade.common.Constants;
import com.trade.pojo.Reviews;
import com.trade.service.ReviewsService;


public class ReviewsAction extends BaseAction{

	private int id;
	private String content;
	private Reviews reviews;
	private ReviewsService reviewsService;
	private List<Reviews> reviewsList;

	
	public String getReviewsObj(){
		reviews=reviewsService.getReviewsObj(id);
		return SUCCESS;
	}
	
	public String getReviewsManage(){
		try {
			totalCount=reviewsService.countReviews(content);
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
			reviewsList=reviewsService.getReviewsList(content, getCurrentPage());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String deleteReviews(){
		try {
			reviewsService.deleteReviews(ids);
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Reviews getReviews() {
		return reviews;
	}

	public void setReviews(Reviews reviews) {
		this.reviews = reviews;
	}

	public ReviewsService getReviewsService() {
		return reviewsService;
	}

	public void setReviewsService(ReviewsService reviewsService) {
		this.reviewsService = reviewsService;
	}

	public List<Reviews> getReviewsList() {
		return reviewsList;
	}

	public void setReviewsList(List<Reviews> reviewsList) {
		this.reviewsList = reviewsList;
	}
	
}
	