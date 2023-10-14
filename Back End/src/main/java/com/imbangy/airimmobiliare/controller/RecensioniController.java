package com.imbangy.airimmobiliare.controller;

import com.imbangy.airimmobiliare.dto.RecensioniDto;
import com.imbangy.airimmobiliare.dto.UtentiDto;
import com.imbangy.airimmobiliare.models.Recensioni;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import com.imbangy.airimmobiliare.services.RecensioniService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class RecensioniController {

    private RecensioniService recensioniService;

    public RecensioniController(RecensioniService recensioniService) {
        this.recensioniService = recensioniService;
    }

    @GetMapping("/recensioni")
    @CrossOrigin(origins = "http://localhost:4200")
    public String listRecensioni(Model model) {
        List<RecensioniDto> recensioni = recensioniService.findAllRecensioni();
        model.addAttribute("recensioni", recensioni);
        return "recensioni-list";
    }

    @RequestMapping("/recensioni/saveOrUpdate")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<String> saveOrUpdate(@RequestBody RecensioniDto recensioneDto) {
        recensioniService.save(recensioneDto);
        return new ResponseEntity<String>(HttpStatus.OK);
    }

}
