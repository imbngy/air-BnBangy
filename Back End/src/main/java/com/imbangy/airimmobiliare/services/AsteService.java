package com.imbangy.airimmobiliare.services;

import com.imbangy.airimmobiliare.dto.AsteDto;

import java.util.List;

public interface AsteService {

    List<AsteDto> findAllAste();

    AsteDto updateAste(Long id, AsteDto asteDto);

    boolean save(AsteDto asteDto);
}
