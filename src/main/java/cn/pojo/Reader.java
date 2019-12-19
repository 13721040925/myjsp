package cn.pojo;

import org.springframework.stereotype.Component;

@Component("reader")
public class Reader {
	private Integer id;
	private String readerName;
	private String readerEmail;
	private String title;
	private String content;

	public Reader() {
	}

	public Reader(String readerName, String readerEmail, String title, String content) {
		this.readerName = readerName;
		this.readerEmail = readerEmail;
		this.title = title;
		this.content = content;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReaderName() {
		return readerName;
	}

	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}

	public String getReaderEmail() {
		return readerEmail;
	}

	public void setReaderEmail(String readerEmail) {
		this.readerEmail = readerEmail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Reader [id=" + id + ", readerName=" + readerName + ", readerEmail=" + readerEmail + ", title=" + title
				+ ", content=" + content + "]";
	}

}