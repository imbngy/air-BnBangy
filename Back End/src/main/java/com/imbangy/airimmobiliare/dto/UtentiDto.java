package com.imbangy.airimmobiliare.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Builder
@Getter
@Setter
public class UtentiDto {

    private long id;

    private String nome;

    private String cognome;

    private String email;

    private String password;

    private long telefono;

    private boolean admin;

    private boolean banned;

    private boolean seller;



}
