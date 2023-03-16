package com.example.simplonapi.Contoller;

import com.example.simplonapi.models.Brief;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("brief")
public class BriefController {
    private ArrayList<Brief> briefs = new ArrayList<>();
    @GetMapping("all")
    public ArrayList<Brief> getAlleBriefs(){

        Brief brief = new Brief(0, "Application Mobile SimplonLine","Application Mobile SimplonLine","assets/images/Simplonline.png");
        this.briefs.add(brief);
        Brief brief3= new Brief(1, "MyPack","Application (JAVA-DOCKER)","assets/images/mypack.png");
        this.briefs.add(brief3);
        Brief brief1= new Brief(1, "MyTask","Application desktop avec javaFX","assets/images/task.png");
        this.briefs.add(brief1);
        Brief brief2= new Brief(1, "MyPet Mobile","Application Web/Mobile","assets/images/mypet.png");
        this.briefs.add(brief2);

        return this.briefs;

    }
}
