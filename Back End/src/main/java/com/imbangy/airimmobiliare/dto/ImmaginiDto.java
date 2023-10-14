package com.imbangy.airimmobiliare.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ImmaginiDto {

    private String url;

    private Long id_annuncio;

}
