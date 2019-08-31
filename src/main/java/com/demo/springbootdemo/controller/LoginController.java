package com.demo.springbootdemo.controller;

import com.demo.springbootdemo.entity.Person;
import com.demo.springbootdemo.manager.IPersonManager;
import com.demo.springbootdemo.utils.CheckFormatUtil;
import com.demo.springbootdemo.vo.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;

/**
 * 登录、注册
 *
 * @author: guan.kai
 * @date: 2019/8/30 9:13
 **/
@Controller
@SessionAttributes("user")
public class LoginController {

    @Resource
    private IPersonManager personManager;

    /**
     * 登录页面
     *
     * @return
     */
    @GetMapping("/login")
    public String login(){
        return "login";
    }

    /**
     * 登录操作
     *
     * @param model
     * @param account 账号
     * @param password 密码
     * @return
     */
    @PostMapping("/login")
    @ResponseBody
    public JsonResult login(Model model, String account, String password){
        JsonResult result = new JsonResult();
        Person person = personManager.getByAccount(account);
        if (person != null && password.equals(person.getPassword())){
            model.addAttribute("user",person);
            result.setSuccess(true);
            result.setMsg("登录成功！");
        }else {
            result.setSuccess(false);
            result.setMsg("用户名密码错误！！");
        }
        return result;
    }

    /**
     * 注册页面
     *
     * @return
     */
    @GetMapping("/register")
    public String register(){
        return "register";
    }

    /**
     * 注册操作
     *
     * @param model
     * @param account 账号
     * @param password 密码
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public JsonResult register(Model model, String account, String password){
        JsonResult result = new JsonResult();
        Person person = personManager.getByAccount(account);
        if (person != null){
            result.setMsg("该账号已存在！");
            return result;
        }
        if (CheckFormatUtil.isAccount(password)){
            result.setMsg("密码必须由8-18位字母加数字组成！");
            return result;
        }
        personManager.registerAccount(account,password);
        result.setSuccess(true);
        result.setMsg("注册成功！");
        return result;
    }
}
