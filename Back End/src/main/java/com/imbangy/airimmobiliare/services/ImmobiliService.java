package com.imbangy.airimmobiliare.services;

import com.imbangy.airimmobiliare.dto.ImmobiliDto;

import java.util.List;

public interface ImmobiliService {
    List<ImmobiliDto> findAllImmobili();

    ImmobiliDto findImmobiliById(Long id);

    boolean save(ImmobiliDto immobiliDto);


    boolean update(Long id, ImmobiliDto immobiliDto);

    boolean updatePrezzo(Long id, Double prezzo);
}
