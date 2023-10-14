package com.imbangy.airimmobiliare.services.impl;

import com.imbangy.airimmobiliare.dto.ImmobiliDto;
import com.imbangy.airimmobiliare.models.Immobili;
import com.imbangy.airimmobiliare.repository.ImmobiliRepository;
import com.imbangy.airimmobiliare.services.ImmobiliService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ImmobiliServiceImpl implements ImmobiliService {
    private ImmobiliRepository immobiliRepository;

    public ImmobiliServiceImpl(ImmobiliRepository immobiliRepository) {
        this.immobiliRepository = immobiliRepository;
    }

    @Override
    public List<ImmobiliDto> findAllImmobili() {
        List<Immobili> immobili = immobiliRepository.findAll();
        return immobili.stream().map(this::mapToImmobiliDto).collect(Collectors.toList());
    }

    @Override
    public boolean save(ImmobiliDto immobiliDto) {
        try {
            if (immobiliDto.getPrezzoAttuale() == 0 || immobiliDto.getPrezzoAttuale() == null) {
                immobiliDto.setPrezzoAttuale(immobiliDto.getPrezzoIniziale());
            }
            immobiliRepository.save(mapToImmobili(immobiliDto));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updatePrezzo(Long id, Double Prezzo) {
        try {
            Optional<Immobili> immobili = immobiliRepository.findById(id);
            if (immobili.isPresent()) {
                immobili.get().setPrezzoAttuale(Prezzo);
                immobiliRepository.save(immobili.get());
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean update(Long id, ImmobiliDto immobiliDto) {
        try {
            Optional<Immobili> immobili = immobiliRepository.findById(id);
            if (immobili.isPresent()) {
                immobili.get().setNome(immobiliDto.getNome());
                immobili.get().setDescrizione(immobiliDto.getDescrizione());
                immobili.get().setIndirizzo(immobiliDto.getIndirizzo());
                immobili.get().setPrezzoIniziale(immobiliDto.getPrezzoIniziale());
                immobili.get().setPrezzoAttuale(immobiliDto.getPrezzoAttuale());
                immobili.get().setCategoria(immobiliDto.getCategoria());
                immobili.get().setMetriQuadri(immobiliDto.getMetriQuadri());
                immobili.get().setIdProprietario(immobiliDto.getIdProprietario());
                immobili.get().setVenduto(immobiliDto.getVenduto());
                immobili.get().setInAsta(immobiliDto.getInAsta());
                immobiliRepository.save(immobili.get());
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }



    private Immobili mapToImmobili(ImmobiliDto immobiliDto) {
        return Immobili.builder()
                .nome(immobiliDto.getNome())
                .descrizione(immobiliDto.getDescrizione())
                .indirizzo(immobiliDto.getIndirizzo())
                .prezzoIniziale(immobiliDto.getPrezzoIniziale())
                .prezzoAttuale(immobiliDto.getPrezzoAttuale())
                .categoria(immobiliDto.getCategoria())
                .metriQuadri(immobiliDto.getMetriQuadri())
                .idProprietario(immobiliDto.getIdProprietario())
                .venduto(immobiliDto.getVenduto())
                .inAsta(immobiliDto.getInAsta())
                .build();
    }

    private ImmobiliDto mapToImmobiliDto(Immobili immobile) {
        return ImmobiliDto.builder()
                .nome(immobile.getNome())
                .descrizione(immobile.getDescrizione())
                .indirizzo(immobile.getIndirizzo())
                .prezzoIniziale(immobile.getPrezzoIniziale())
                .categoria(immobile.getCategoria())
                .metriQuadri(immobile.getMetriQuadri())
                .idProprietario(immobile.getIdProprietario())
                .venduto(immobile.isVenduto())
                .inAsta(immobile.isInAsta())
                .build();
    }

    @Override
    public ImmobiliDto findImmobiliById(Long id) {
        Optional<Immobili> immobili = immobiliRepository.findById(id);
        if (immobili.isPresent()) {
            return mapToImmobiliDto(immobili.get());
        }
        return null;
    }

}
