package com.imbangy.airimmobiliare.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class ImmobiliDto {

    private String nome;

    private String descrizione;

    private String indirizzo;

    private Double prezzoIniziale;

    private Double prezzoAttuale;

    private String categoria;

    private Double metriQuadri;

    private Long idProprietario;

    private Boolean venduto;

    private Boolean inAsta;
}
