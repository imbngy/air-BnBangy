package com.imbangy.airimmobiliare.controller;

import com.imbangy.airimmobiliare.dto.UtentiDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import com.imbangy.airimmobiliare.services.UtentiService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpStatus;
import com.imbangy.airimmobiliare.dto.RegistrationDto;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static java.lang.Thread.sleep;

@Controller
public class UtentiController {

    private UtentiService utentiService;
    private final HttpServletRequest request;

    private String prova;

    private HttpSession session;


    public UtentiController(UtentiService utentiService, HttpServletRequest request) {
        this.utentiService = utentiService;
        this.request = request;
    }

    HttpStatus httpStatus = HttpStatus.OK;

    @GetMapping("/utenti")
    public String listUtenti(Model model) {
        List<UtentiDto> utenti = utentiService.findAllUtenti();
        model.addAttribute("utenti", utenti);
        return "utenti-list";
    }

    @GetMapping("/api/register")
    @CrossOrigin(origins = "http://localhost:4200")
    public String getRegister(Model model) {
        RegistrationDto user = new RegistrationDto();
        model.addAttribute("user", user);
        return "register";
    }


    @PostMapping("/api/register")
    @CrossOrigin(origins = "http://localhost:4200")
    public String register( HttpServletRequest req ,Model model) {
        String email = req.getParameter("email").toLowerCase();
        boolean isSeller = Objects.equals(req.getParameter("seller"), "on");
        UtentiDto exists = utentiService.findByEmail(email);
        if (exists != null) {
            String err = "Utente già registrato!";
            model.addAttribute("err", err);
            return "register";
        } else {
            RegistrationDto registrationDto = new RegistrationDto();
            registrationDto.setNome(req.getParameter("nome"));
            registrationDto.setCognome(req.getParameter("cognome"));
            registrationDto.setEmail(email);
            registrationDto.setPassword(req.getParameter("password"));
            registrationDto.setTelefono(Long.parseLong(req.getParameter("telefono").trim()));
            registrationDto.setSeller(isSeller);
            boolean saved = utentiService.save(registrationDto);
            if (saved) {
                return "redirect:/api/login";
            } else {
                String err = "Registrazione fallita!";
                model.addAttribute("err", err);
                return "register";
            }
        }
    }

    @GetMapping("/api/login")
    @CrossOrigin(origins = "http://localhost:4200")
    public String getLogin(Model model) {
        return "login";
    }


    @PostMapping("/api/login")
    @CrossOrigin(origins = "http://localhost:4200")
    public String login(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException {
        String email = req.getParameter("email").toLowerCase();
        String password = req.getParameter("password");

        UtentiDto utentiDto = utentiService.findByEmail(email);

        boolean logged = false;
        HttpSession session = req.getSession();

        if (utentiDto != null) {
            boolean banned = utentiDto.isBanned();


             if(!utentiDto.getPassword().equals(password) && !banned){
                String err = "Password errata!";
                model.addAttribute("err", err);
                return "login";
             }
             else if (utentiDto.getPassword().equals(password) && !banned) {
                logged = true;
                session.setAttribute("utente", utentiDto);
                session.setAttribute("sessionID", session.getId());
                req.getServletContext().setAttribute(session.getId(), session);
            } else if (utentiDto.getPassword().equals(password) && banned) {
                String err = "Utente bannato!";
                model.addAttribute("err", err);
                return "login";
            }
        } else {
            String err = "Utente non registrato!";
            model.addAttribute("err", err);
            return "login";
        }

        if (logged) {
            res.sendRedirect("http://localhost:4200/houses?sessionId=" + session.getId());
            System.out.println(session.getId());
            prova = session.getId();
            return null;
        } else {
            String err = "Login fallito!";
            model.addAttribute("err", err);
            return "login";
        }

    }



    @GetMapping("/api/utentis/user-details")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<UtentiDto> getUserDetails(@RequestParam String sessionId) {
        HttpSession session = (HttpSession) request.getServletContext().getAttribute(sessionId);
        if(session != null) {
            UtentiDto utente = (UtentiDto) session.getAttribute("utente");
            return ResponseEntity.ok(utente);
        }
        return ResponseEntity.notFound().build();
    }

    @PutMapping("/api/utentis/{id}")
    @CrossOrigin(origins = "http://localhost:4200")
    public ResponseEntity<UtentiDto> updateUtenti(@PathVariable Long id, @RequestBody UtentiDto utentiDto) {
        if (!utentiService.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        utentiDto = utentiService.updateUtenti(id, utentiDto);
        return ResponseEntity.ok(utentiDto);
    }


}
