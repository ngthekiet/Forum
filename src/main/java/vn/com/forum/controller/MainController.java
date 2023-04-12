package vn.com.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import vn.com.forum.model.Message;
import vn.com.forum.model.Topic;
import vn.com.forum.model.User;
import vn.com.forum.service.ForumService;

import java.util.List;

@Controller
@SessionAttributes("user")
public class MainController {
    @Autowired
    private ForumService forumService;

    @RequestMapping(value = "/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping(value = "/doLogin")
    public ModelAndView doLogin(String username, String password) {
        ModelAndView mav;
        if (forumService.checkUser(username, password) != null) {
            User user = forumService.checkUser(username, password);
            mav = getTopics();
            mav.addObject("user", user);
            return mav;
        }
        mav = new ModelAndView("login");
        mav.addObject("error", "Đăng nhập không thành công");
        return mav;
    }

    @RequestMapping("/listTopics")
    public ModelAndView getTopics() {
        ModelAndView mav = new ModelAndView("topic");
        mav.addObject("topics", forumService.getTopics());
        return mav;
    }

    @RequestMapping(value = "/showTopic/{id}")
    public ModelAndView showTopic(@PathVariable("id") int id) {
        ModelAndView mav = new ModelAndView("showTopic");
        Topic topic = forumService.findTopic(id);
        mav.addObject("topic", topic);
        List<Message> messageList = topic.getMessages();
        mav.addObject("listMessage", messageList);
        return mav;
    }

    @RequestMapping(value = "/showNewTopic")
    public String showNewTopic(Model model, @ModelAttribute("user") User user) {
        Topic topic = new Topic();
        topic.setId(forumService.getSizeTopic() + 1);
        topic.setCreator(user);
        model.addAttribute("topic", topic);
        return "newTopic";
    }

    @ModelAttribute("topic")
    @RequestMapping(value = "/newTopic")
    public ModelAndView newTopic(@ModelAttribute("user") User user, @ModelAttribute("topic") Topic topic) {
        forumService.newTopic(topic, user);
        return getTopics();
    }

    @RequestMapping(value = "/showReplay/{id}")
    public String showReplay(@PathVariable("id") int id, Model model) {
        Topic topic = forumService.findTopic(id);
        List<Message> messageList = topic.getMessages();
        Message message = new Message();
        String title = "";
        try {
            title = messageList.get(0).getTitle();
            message.setTitle(title);
        } catch (Exception e) {
            message.setTitle("Re:" + topic.getTitle());
        }
        model.addAttribute("message", message);
        model.addAttribute("id", id);
        return "replayTopic";
    }

    @RequestMapping(value = "/replay/{id}", method = RequestMethod.POST)
    public ModelAndView replay(@PathVariable("id") int id, Message message, @ModelAttribute("user") User user) {
        forumService.addMessage(message, id, user);
        return showTopic(id);
    }

    @RequestMapping(value = "/logout")
    public String logout(SessionStatus status) {
        status.setComplete();
        return toLogin();
    }
}
