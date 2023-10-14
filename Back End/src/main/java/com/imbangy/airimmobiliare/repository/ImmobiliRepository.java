package com.imbangy.airimmobiliare.repository;

import com.imbangy.airimmobiliare.models.Immobili;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RestResource;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.data.domain.Pageable;

@CrossOrigin("http://localhost:4200")
public interface ImmobiliRepository extends JpaRepository<Immobili, Long> {

    Page<Immobili> findById(@Param("id") Long id, Pageable pageable);

    Page<Immobili> findByCategoria(@Param("categoria") String categoria, Pageable pageable);

    Page<Immobili> findAll(Pageable pageable);

    Page<Immobili> findByNomeContainingIgnoreCase(@Param("nome")String nome, Pageable pageable);

    Page<Immobili> findByIdProprietario(@Param("id_proprietario")Long id_proprietario, Pageable pageable);

    Page<Immobili> findByInAsta(@Param("in_asta")boolean in_asta, Pageable pageable);

    Page<Immobili> findByVenduto(@Param("venduto")boolean venduto, Pageable pageable);

    Page<Immobili> findByNome(@Param("nome")String nome, Pageable pageable);

    Page<Immobili> findByPrezzoInizialeGreaterThan(@Param("prezzo_iniziale")double prezzo_iniziale, Pageable pageable);

    Page<Immobili> findByPrezzoInizialeLessThanEqual(@Param("prezzo_iniziale")double prezzo_iniziale, Pageable pageable);

    Page<Immobili> findByPrezzoAttualeGreaterThan(@Param("prezzo_attuale")double prezzo_attuale, Pageable pageable);

    Page<Immobili> findByPrezzoAttualeLessThanEqual(@Param("prezzo_attuale")double prezzo_attuale, Pageable pageable);
}
