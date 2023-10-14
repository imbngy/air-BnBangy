package com.imbangy.airimmobiliare.services.impl;

import com.imbangy.airimmobiliare.dto.AsteDto;
import com.imbangy.airimmobiliare.models.Aste;
import com.imbangy.airimmobiliare.repository.AsteRepository;
import com.imbangy.airimmobiliare.services.AsteService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AsteServiceImpl implements AsteService {

    private AsteRepository asteRepository;

    public AsteServiceImpl(AsteRepository asteRepository) {
        this.asteRepository = asteRepository;
    }

    @Override
    public List<AsteDto> findAllAste() {
        List<Aste> aste = asteRepository.findAll();
        return aste.stream().map(this::mapToAsteDto).collect(Collectors.toList());
    }

    @Override
    public AsteDto updateAste(Long id, AsteDto asteDto) {
        Aste aste = asteRepository.findById(id).orElse(null);
        if (aste == null) {
            return null;
        }
        aste.setCompratore(asteDto.getCompratore());
        aste.setIdAnnuncio((int) asteDto.getIdAnnuncio());
        aste.setPrezzoAttuale(asteDto.getPrezzoAttuale());
        aste.setPrezzoIniziale(asteDto.getPrezzoIniziale());
        asteRepository.save(aste);
        return mapToAsteDto(aste);
    }

    @Override
    public boolean save(AsteDto asteDto) {
        Aste aste = new Aste();
        aste.setCompratore(asteDto.getCompratore());
        aste.setIdAnnuncio(asteDto.getIdAnnuncio());
        aste.setPrezzoAttuale(asteDto.getPrezzoAttuale());
        aste.setPrezzoIniziale(asteDto.getPrezzoIniziale());
        asteRepository.save(aste);
        return true;
    }

    private AsteDto mapToAsteDto(Aste asta) {
        return AsteDto.builder()
                .compratore(asta.getCompratore())
                .idAnnuncio(asta.getIdAnnuncio())
                .prezzoAttuale(asta.getPrezzoAttuale())
                .prezzoIniziale(asta.getPrezzoIniziale())
                .build();
    }
}
