package web_db.sample.controller;
 
import java.util.List;
import java.util.Map;
 




import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import web_db.sample.service.SampleService;
import web_db.sample.vo.SelectVO;
 
@Controller
public class SampleController {
    Logger log = LoggerFactory.getLogger(this.getClass());
     
    @Resource(name="sampleService")
    private SampleService sampleService;
     
    @RequestMapping(value="/sample/openUserList.do")
    public ModelAndView openSampleUserList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/userList");
         
        List<Map<String,Object>> list = sampleService.selectUserList(commandMap);
        mv.addObject("list", list);
         
        return mv;
    }
    @RequestMapping(value="/sample/openDBEdit.do")
    public ModelAndView openSampleDBEdit(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/dbEdit");
         
        List<Map<String,Object>> list = sampleService.selectTableList(commandMap);
        mv.addObject("list", list);
         
        return mv;
    }
    @RequestMapping(value="/sample/openTableCrea.do")
    public ModelAndView openTableCreator(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/sample/tableCrea");
         
        List<Map<String,Object>> list = sampleService.selectTableList(commandMap);
        mv.addObject("list", list);
         
        return mv;
    }
    /**
     * @param vo
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getTable.do", method = RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> getTable(@RequestBody SelectVO vo) throws Exception {
    	String str = vo.getSelTB();
		return null;
	}
}