package com.imbangy.airimmobiliare.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
public class RecensioniDto {

    private Long id;

    private String autore;

    private Long idImmobile;

    private Long idUtente;

    private String testo;

    private String titolo;

    private short voto;

    private Date data;


}
