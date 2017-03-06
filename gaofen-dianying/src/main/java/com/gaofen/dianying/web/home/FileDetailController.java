package com.gaofen.dianying.web.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class FileDetailController {
		
	@RequestMapping("/detail")
    public String  home(Model model) {
        return "/film/file_detail";
    }
}
