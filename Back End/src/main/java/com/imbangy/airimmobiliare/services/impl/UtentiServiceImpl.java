package com.imbangy.airimmobiliare.services.impl;

import com.imbangy.airimmobiliare.dto.RegistrationDto;
import com.imbangy.airimmobiliare.dto.UtentiDto;
import com.imbangy.airimmobiliare.models.Utenti;
import com.imbangy.airimmobiliare.services.UtentiService;
import org.springframework.stereotype.Service;
import com.imbangy.airimmobiliare.repository.UtentiRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UtentiServiceImpl implements UtentiService {

    private UtentiRepository utentiRepository;

    public UtentiServiceImpl(UtentiRepository utentiRepository) {
        this.utentiRepository = utentiRepository;
    }

    @Override
    public List<UtentiDto> findAllUtenti() {
        List<Utenti> utenti = utentiRepository.findAll();
        return utenti.stream().map(this::mapToUtentiDto).collect(Collectors.toList());
    }

    @Override
    public boolean existsById(Long id) {
        return utentiRepository.existsById(id);
    }

    @Override
    public UtentiDto updateUtenti(Long id, UtentiDto utentiDto) {
        Utenti utenti = utentiRepository.findById(id).orElse(null);
        if (utenti == null) {
            return null;
        }
        utenti.setNome(utentiDto.getNome());
        utenti.setCognome(utentiDto.getCognome());
        utenti.setEmail(utentiDto.getEmail());
        utenti.setPassword(utentiDto.getPassword());
        utenti.setTelefono(utentiDto.getTelefono());
        utenti.setSeller(utentiDto.isSeller());
        utenti.setAdmin(utentiDto.isAdmin());
        utenti.setBanned(utentiDto.isBanned());
        utentiRepository.save(utenti);
        return mapToUtentiDto(utenti);
    }

    @Override
    public boolean save(RegistrationDto registrationDto){

        Utenti utenti = new Utenti();
        utenti.setNome(registrationDto.getNome());
        utenti.setCognome(registrationDto.getCognome());
        utenti.setEmail(registrationDto.getEmail());
        utenti.setPassword(registrationDto.getPassword());
        utenti.setTelefono(registrationDto.getTelefono());
        utenti.setSeller(registrationDto.isSeller());
        utenti.setAdmin(false);
        utenti.setBanned(false);
        utentiRepository.save(utenti);
        return true;
    }

    @Override
    public UtentiDto findByEmail(String email) {
        Utenti utenti = utentiRepository.findByEmailIgnoreCase(email);
        if (utenti == null) {
            return null;
        }
        return mapToUtentiDto(utenti);
    }

    private UtentiDto mapToUtentiDto(Utenti utente) {
        return UtentiDto.builder()
                .id(utente.getId())
                .nome(utente.getNome())
                .cognome(utente.getCognome())
                .email(utente.getEmail())
                .password(utente.getPassword())
                .telefono(utente.getTelefono())
                .seller(utente.isSeller())
                .admin(utente.isAdmin())
                .banned(utente.isBanned())
                .build();
    }

}
