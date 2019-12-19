package cn.mapper;

import org.apache.ibatis.annotations.Insert;

import cn.pojo.Reader;

public interface ReaderMapper {

	@Insert(" insert into reader (readerName,readerEmail,title,content) values (#{readerName},#{readerEmail},#{title},#{content}) ")
	int addReader(Reader reader);
}