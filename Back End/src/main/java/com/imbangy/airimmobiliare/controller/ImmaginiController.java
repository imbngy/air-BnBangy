package com.imbangy.airimmobiliare.controller;

import com.imbangy.airimmobiliare.dto.ImmaginiDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import com.imbangy.airimmobiliare.services.ImmaginiService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RestController
public class ImmaginiController {
    private ImmaginiService immaginiService;

    public ImmaginiController(ImmaginiService immaginiService) {
        this.immaginiService = immaginiService;
    }

    @GetMapping("/immagini")
    public String listImmagini(Model model) {
        List<ImmaginiDto> immagini = immaginiService.findAllImmagini();
        model.addAttribute("immagini", immagini);
        return "immagini-list";
    }

    @RequestMapping("api/immaginis/save")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<String> save(@RequestBody ImmaginiDto immaginiDto) {
        System.out.println(immaginiDto);
        immaginiService.save(immaginiDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
