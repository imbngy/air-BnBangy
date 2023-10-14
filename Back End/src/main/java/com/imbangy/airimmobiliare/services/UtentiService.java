package com.imbangy.airimmobiliare.services;

import com.imbangy.airimmobiliare.dto.RegistrationDto;
import com.imbangy.airimmobiliare.dto.UtentiDto;

import java.util.List;

public interface UtentiService {

    List<UtentiDto> findAllUtenti();

    boolean save(RegistrationDto registrationDto);

    UtentiDto findByEmail(String email);

    boolean existsById(Long id);

    UtentiDto updateUtenti(Long id, UtentiDto utentiDto);

}
