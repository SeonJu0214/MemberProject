package co.kr.mem;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	@GetMapping(value = {"/", "index"})
	public String index() {
		logger.info("INDEX PAGE >>");
		
		return "index";
	}
}