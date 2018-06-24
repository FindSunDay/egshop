package com.trade.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.trade.common.Constants;
import com.trade.pojo.News;
import com.trade.pojo.User;
import com.trade.service.MessageService;
import com.trade.service.NewsService;



public class NewsAction extends BaseAction{

	private int id;
	private String title;
	private News news;
	private NewsService newsService;
	private MessageService messageService;
	private List<News> newsList;
	
	public  String addNews(){
		try {
			User user=(User) session.get(Constants.loginUser);
			news.setCreateTime(new Date());
			news.setUserName(user.getName());
			newsService.saveNews(news);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getNewsObj(){
		news=newsService.getNewsObj(id);
		return SUCCESS;
	}
	
	public String getNewsLook(){
		news=newsService.getNewsObj(id);
		return SUCCESS;
	}
	
	public  String updateNews(){
		try {
			News newsL=newsService.getNewsObj(news.getId());
			newsL.setType(news.getType());
			newsL.setContent(news.getContent());
			newsL.setTitle(news.getTitle());
			newsService.updateNews(newsL);
			response.getWriter().write("success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getNewsManage(){
		try {
			totalCount=newsService.countNews(title);
			pageCount = (totalCount - 1) / Constants.TotalPage + 1;
			if (super.getCurrentPage() > pageCount) {
				super.setCurrentPage(Long.valueOf(pageCount).intValue());
			}
			newsList=newsService.getNewsList(title, getCurrentPage());
			messageService.addMessage("管理员查看【广告管理】");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String deleteNews(){
		try {
			newsService.deleteNews(ids);
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public NewsService getNewsService() {
		return newsService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

	/**
	 * @return the messageService
	 */
	public MessageService getMessageService() {
		return messageService;
	}

	/**
	 * @param messageService the messageService to set
	 */
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	
	
}
