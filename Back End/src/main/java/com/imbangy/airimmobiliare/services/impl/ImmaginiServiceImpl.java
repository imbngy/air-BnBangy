package com.imbangy.airimmobiliare.services.impl;

import com.imbangy.airimmobiliare.dto.ImmaginiDto;
import com.imbangy.airimmobiliare.models.Immagini;
import com.imbangy.airimmobiliare.repository.ImmaginiRepository;
import com.imbangy.airimmobiliare.services.ImmaginiService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ImmaginiServiceImpl implements ImmaginiService {

    private ImmaginiRepository immaginiRepository;

    public ImmaginiServiceImpl(ImmaginiRepository immaginiRepository) {
        this.immaginiRepository = immaginiRepository;
    }

    @Override
    public List<ImmaginiDto> findAllImmagini() {
        List<Immagini> immagini = immaginiRepository.findAll();
        return immagini.stream().map(this::mapToImmaginiDto).collect(Collectors.toList());
    }

    @Override
    public void save(ImmaginiDto immaginiDto) {
        immaginiRepository.save(mapToImmagini(immaginiDto));
    }

    private Immagini mapToImmagini(ImmaginiDto immaginiDto) {
        return Immagini.builder()
                .idAnnuncio(immaginiDto.getId_annuncio())
                .url(immaginiDto.getUrl())
                .build();
    }

    private ImmaginiDto mapToImmaginiDto(Immagini immagine) {
        return ImmaginiDto.builder()
                .id_annuncio(immagine.getIdAnnuncio())
                .url(immagine.getUrl())
                .build();
    }
}
