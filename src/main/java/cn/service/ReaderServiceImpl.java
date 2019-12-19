package cn.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.mapper.ReaderMapper;
import cn.pojo.Reader;

@Service("readerService")
public class ReaderServiceImpl implements ReaderService {
	@Resource
	private ReaderMapper mapper;

	@Override
	public int addReader(Reader reader) {
		return mapper.addReader(reader);
	}

}
