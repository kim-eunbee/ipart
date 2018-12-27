package kr.co.ipart.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/main")
public class MainController {
	@RequestMapping("/main.ipart")
	public void main() {
		System.out.println("여기는 메인 입니다.");
	}
}
