package com.imbangy.airimmobiliare.controller;

import com.imbangy.airimmobiliare.dto.ImmobiliDto;
import com.imbangy.airimmobiliare.services.ImmobiliService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class ImmobiliController {
private ImmobiliService immobiliService;

    public ImmobiliController(ImmobiliService immobiliService) {
        this.immobiliService = immobiliService;
    }

    @GetMapping("/immobili")
    public String listImmobili(Model model) {
        List<ImmobiliDto> immobili = immobiliService.findAllImmobili();
        model.addAttribute("immobili", immobili);
        return "immobili-list";
    }

    @RequestMapping("api/immobilis/save")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<String> save(@RequestBody ImmobiliDto immobiliDto) {
        System.out.println(immobiliDto);
        if(immobiliService.save(immobiliDto)){
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PutMapping("api/immobilis/aggiornaPrezzo/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<String> update(@PathVariable Long id, @RequestBody Double Prezzo) {
        System.out.println(Prezzo);
        if(immobiliService.updatePrezzo(id, Prezzo)){
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PutMapping("api/immobilis/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<String> update(@PathVariable Long id, @RequestBody ImmobiliDto immobiliDto) {
        System.out.println(immobiliDto);
        if(immobiliService.update(id, immobiliDto)){
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

}
