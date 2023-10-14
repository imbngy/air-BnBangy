package com.imbangy.airimmobiliare.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Builder;
import lombok.Data;

@Data
public class RegistrationDto {

    private Long id;
    @NotEmpty(message = "Nome non può essere vuoto")
    private String nome;
    @NotEmpty(message = "Cognome non può essere vuoto")
    private String cognome;
    @NotEmpty(message = "Email non può essere vuoto")
    private String email;
    @NotEmpty(message = "Password non può essere vuoto")
    private String password;
    @NotEmpty(message = "Telefono non può essere vuoto")
    private Long telefono;

    private boolean admin;

    private boolean banned;

    private boolean seller;

}
