package com.imbangy.airimmobiliare.controller;

import com.imbangy.airimmobiliare.dto.AsteDto;
import com.imbangy.airimmobiliare.models.Aste;
import com.imbangy.airimmobiliare.repository.AsteRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import com.imbangy.airimmobiliare.services.AsteService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AsteController {

    private AsteService asteService;

    private AsteRepository asteRepository;

    public AsteController(AsteService asteService) {
        this.asteService = asteService;
        this.asteRepository = asteRepository;
    }

    @GetMapping("/aste")
    public String listAste(Model model) {
        List<AsteDto> aste = asteService.findAllAste();
        model.addAttribute("aste", aste);
        return "aste-list";
    }

    @PutMapping("/api/astes/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<AsteDto> updateAste(@PathVariable Long id, @RequestBody AsteDto asteDto) {
        AsteDto aste = asteService.updateAste(id, asteDto);
        return new ResponseEntity<AsteDto>(aste, HttpStatus.OK);
    }

    @RequestMapping("/aste/create")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<String> createAste(@RequestBody AsteDto asteDto) {
        System.out.println(asteDto);
        asteService.save(asteDto);
        return new ResponseEntity<String>(HttpStatus.OK);
    }


}
