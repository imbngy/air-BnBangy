package com.imbangy.airimmobiliare.services.impl;

import com.imbangy.airimmobiliare.dto.RecensioniDto;
import com.imbangy.airimmobiliare.models.Recensioni;
import com.imbangy.airimmobiliare.repository.RecensioniRepository;
import com.imbangy.airimmobiliare.services.RecensioniService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecensioniServiceImpl implements RecensioniService {

    private RecensioniRepository recensioniRepository;

    @Autowired
    public RecensioniServiceImpl(RecensioniRepository recensioniRepository) {
        this.recensioniRepository = recensioniRepository;
    }

    @Override
    public List<RecensioniDto> findAllRecensioni() {
        List<Recensioni> recensioni = recensioniRepository.findAll();
        return recensioni.stream().map(this::mapToRecensioniDto).collect(java.util.stream.Collectors.toList());
    }

    @Override
    public boolean save(RecensioniDto recensioniDto){
        Recensioni recensione = new Recensioni();
        recensione.setAutore(recensioniDto.getAutore());
        recensione.setIdImmobile(recensioniDto.getIdImmobile());
        recensione.setTesto(recensioniDto.getTesto());
        recensione.setTitolo(recensioniDto.getTitolo());
        recensione.setVoto(recensioniDto.getVoto());
        recensione.setData(recensioniDto.getData());
        recensione.setIdUtente(recensioniDto.getIdUtente());
        recensioniRepository.save(recensione);
        return true;
    }

    private RecensioniDto mapToRecensioniDto(Recensioni recensione) {
        RecensioniDto recensioniDto = new RecensioniDto();
        recensioniDto.setId(recensione.getId());
        recensioniDto.setAutore(recensione.getAutore());
        recensioniDto.setIdImmobile(recensione.getIdImmobile());
        recensioniDto.setTesto(recensione.getTesto());
        recensioniDto.setTitolo(recensione.getTitolo());
        recensioniDto.setVoto(recensione.getVoto());
        recensioniDto.setData(recensione.getData());
        return recensioniDto;
    }
}
