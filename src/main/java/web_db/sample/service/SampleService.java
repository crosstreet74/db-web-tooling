package web_db.sample.service;
 
import java.util.List;
import java.util.Map;
 
public interface SampleService {
 
    List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception;
    
    List<Map<String, Object>> selectTableList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectGetTable(String req) throws Exception;
    
}