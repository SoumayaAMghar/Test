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
        for (int j=0; j < 10; j++){
            Brief brief = new Brief(0 + j, "brief"+j,"lorem ipsum lorem ipsum","assets/images/best_2020@2x.png");
            this.briefs.add(brief);
        }
        return this.briefs;
    }
}
