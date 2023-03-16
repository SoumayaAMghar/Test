package com.example.simplonapi.models;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Brief {
    private int id;
    private String title;
    private String description;
    private String imageSrc;

}
