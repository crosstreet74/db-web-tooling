package web_db.sample.service;
 
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import web_db.sample.dao.SampleDAO;
 
@Service("sampleService")
public class SampleServiceImpl implements SampleService{
    Logger log = LoggerFactory.getLogger(this.getClass());
     
    @Resource(name="sampleDAO")
    private SampleDAO sampleDAO;
     
    @Override
    public List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception {
        return sampleDAO.selectUserList(map);
    }

	@Override
	public List<Map<String, Object>> selectTableList(Map<String, Object> map) throws Exception {
        return sampleDAO.selectTableList(map);
	}

	@Override
	public List<Map<String, Object>> selectGetTable(String req) throws Exception {
		List<Map<String, Object>> list  = new ArrayList<Map<String, Object>>();
		
		list.addAll(sampleDAO.selectRCCount(req));
		list.addAll(sampleDAO.selectColName(req));
		list.addAll(sampleDAO.selectTableData(req));
		
		return list;
	}
 
}