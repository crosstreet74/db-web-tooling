package web_db.sample.dao;
 
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import web_db.common.dao.AbstractDAO;
 
@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{
 
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception{
        return (List<Map<String, Object>>)selectList("sample.selectUserList", map);
    }

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTableList(Map<String, Object> map) {
        return (List<Map<String, Object>>)selectList("sample.selectTableList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRCCount(String req) {
        return (List<Map<String, Object>>)selectList("sample.selectRCCount", req);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectColName(String req) {
        return (List<Map<String, Object>>) selectList("sample.selectColName", req);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTableData(String req) {
        return (List<Map<String, Object>>) selectList("sample.selectTableData", req);
	}
}