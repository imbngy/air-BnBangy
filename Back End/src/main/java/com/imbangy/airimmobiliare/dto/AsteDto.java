package com.imbangy.airimmobiliare.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AsteDto {

        private String compratore;

        private long idAnnuncio;

        private int prezzoAttuale;

        private int prezzoIniziale;


}
