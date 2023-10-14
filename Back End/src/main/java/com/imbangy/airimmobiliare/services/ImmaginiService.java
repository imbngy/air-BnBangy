package com.imbangy.airimmobiliare.services;

import com.imbangy.airimmobiliare.dto.ImmaginiDto;

import java.util.List;

public interface ImmaginiService {
    List<ImmaginiDto> findAllImmagini();

    void save(ImmaginiDto immaginiDto);

}
